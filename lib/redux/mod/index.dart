import 'package:rxdart/rxdart.dart';

import './mod.dart' show
  DownstreamMod,
  ModBranch,
  UpstreamMod;

import '../reducers/index.dart' show AppState;
import '../store.dart' show redux;

abstract class ModLeaf extends DownstreamMod {
  static final List<ModLeaf> _leaves = [];
  
  bool _modified = false;
  bool _snoozing = false;

  ModLeaf(List<UpstreamMod> upstreams): super(upstreams) {
    ModLeaf._leaves.add(this);
  }

  dynamic get appState => redux.store.state;

  @override
  void modified() {
    if (!_snoozing) {
      this._modified = true;
    }
  }

  void clearModified() {
    this._modified = false;
  }

  void dispose() {
    ModLeaf._leaves.remove(this);
  }

  static void notifyModifiedLeaves(AppState appState) {
    ModLeaf._leaves.forEach((leaf) {
      if (leaf._modified) {
        if (!leaf._snoozing) {
          leaf.handleMod(appState);
        }
        leaf.clearModified();
      }
    });
  }

  void snooze() {
    this._snoozing = true;
    this._modified = false; // Just in case we snooze during a pending mod.
  }

  void wake() {
    this._snoozing = false;
  }

  void handleMod(AppState appState);
}

class ModLeafNotifier extends ModLeaf {

  int updates = 0;
  BehaviorSubject<int> _pub;

  ModLeafNotifier(List<UpstreamMod> upstreams): super(upstreams) {
    _pub = BehaviorSubject<int>.seeded(0);
  }

  Stream<int> get stream => _pub.stream;

  @override
  void handleMod(AppState appState) {
    updates++;
    _pub.sink.add(updates);
  }

  @override
  void dispose() {
    super.dispose();
    _pub.close();
  }
}

// Root States

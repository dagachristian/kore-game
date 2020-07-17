import 'dart:async' show StreamSubscription;

import 'package:redux/redux.dart' show Middleware, Store;
import 'package:redux_logging/redux_logging.dart' show LoggingMiddleware;  

import './mod/index.dart' show ModLeaf;
import './reducers/index.dart' show
  appReducer,
  AppState;

import '../config/index.dart' show config;

class _Redux {
  Store<AppState> _store;

  StreamSubscription<AppState> _subscription;

  Store<AppState> get store => this._store;

  _Redux() {
    List<Middleware<AppState>> middlewares = [];

    // LoggingMiddleware needs to be last.
    if (config.logRedux) {
      middlewares.add(
        LoggingMiddleware.printer(formatter: LoggingMiddleware.singleLineFormatter)
      );
    }

    // Might not work for newer versions.
    this._store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
    middleware: middlewares
  );

    // Notify leaf mods of app state change.
    _subscription = store.onChange.listen((appState) {
      ModLeaf.notifyModifiedLeaves(appState);
    });
  }

  void dispose() {
    _subscription.cancel();
  }
}
final _Redux redux = _Redux();
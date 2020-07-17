import '../store.dart' show redux;

abstract class AppAction {
  @override
  String toString() {
    return '$runtimeType';
  }
}

class InitialStateAction extends AppAction {
  InitialStateAction();
}


class _AppActions {
  void initialAppState() {
    redux.store.dispatch(InitialStateAction());
  }
}
final appActions = _AppActions();
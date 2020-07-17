import 'package:flutter/foundation.dart' show required;

import '../actions/AppActions.dart' show InitialStateAction;

class AppState {
  
  AppState({
    dynamic
  });

  AppState.initialState();
  
  AppState copyWith({
    dynamic
  }) {
    return AppState(
      
    );
  }
}

AppState appReducer(AppState state, dynamic action) {
  if (action is InitialStateAction) { // TODO: this check doesn't work, so use the next one.
    return AppState.initialState();
  } else if (action.toString() == 'InitialStateAction') {
    return AppState.initialState();
  }

  return state;
}
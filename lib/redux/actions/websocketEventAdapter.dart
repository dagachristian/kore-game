import './index.dart';

import '../selectors/index.dart';
import '../store.dart' show redux;

import '../../logger.dart' show logger;
import '../../websocket/EventTypes.dart' show EventType;
import '../../websocket/socketioClient.dart' show EventListener, OnlineOfflineListener;

class WebSocketEventAdapter extends EventListener {
  @override
  void handleEvent(eventType, event) {
    switch(eventType) {
      
    }
  }
}

class WebSocketOnlineOfflineAdapter extends OnlineOfflineListener {
  @override
  void handleEvent(bool online) {
    
  }
  
}
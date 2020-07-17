import 'package:socket_io_client/socket_io_client.dart' as IO;

import './EventTypes.dart' show EventType;

import '../logger.dart' show logger;

class SocketIOClient {

  final String _url;
  IO.Socket _socket;

  Set<EventListener> eventListeners = {};
  Set<OnlineOfflineListener> onlineOfflineListeners =  {};
  Set unauthorizedListeners = {};

  bool connectionListenersInitialized = false;

  SocketIOClient(this._url);

  void addEventListener(EventListener listener) {
    this.eventListeners.add(listener);
  }

  void addOnlineOfflineListener(OnlineOfflineListener listener) {
    this.onlineOfflineListeners.add(listener);
  }

  void addUnauthorizedListener(listener) {
    this.unauthorizedListeners.add(listener);
  }

  void _initializeConnectionListeners() {
    if (!this.connectionListenersInitialized) {
      this._socket.on('unauthorized', (error) {
        logger.finer('Unauthorized ${error.toString()}');

        if ((error.data.type == 'UnauthorizedError' || error.data.code == 'invalid_token')) {
          logger.finer('Token has expired');

          this._notifyUnauthorizedListeners();
        }
      });

      this._socket.on('reconnect_failed', (a) {
        logger.finer('reconnect failed a=$a');
      });

      this._socket.on('reconnect', (attemptNumber) {
        logger.finer('reconnected attemptnumber=$attemptNumber');
      });
      
      this._socket.on('connect_error', (err) {
        logger.finer('connect error ${err.toString()}');
        this._notifyOnlineOfflineListener(false);
      });

      this._socket.on('reconnect_error', (err) {
        logger.finer('reconnect error ${err.toString()}');
      });

      this._socket.on('connect_timeout', (_) {
        logger.finer('connect timeout');
      });

      this._socket.on('error', (err) {
        logger.finer('Error ${err.toString()}');
      });

      this._socket.on('ping', (_) {
        //logger.finer('messaging ping');
      });
      
      this._socket.on('pong', (ms) {
        //logger.finer('messaging pong (${ms}ms)');
      });

      EventType.EVENTS.forEach((eventType) {
        _socket.on(eventType, (event) {
          logger.finer('recieved eventType=$eventType event=${event.toString()}');
          _notifyEventListeners(eventType, event);
        });
      });

      this.connectionListenersInitialized = true;
    }
  }
  
  void _notifyEventListeners(eventType, event) {
    this.eventListeners.forEach((listener) => listener.handleEvent(eventType, event));
  }

  void _notifyOnlineOfflineListener(online) {
    this.onlineOfflineListeners.forEach((listener) => listener.handleEvent(online));
  }

  void _notifyUnauthorizedListeners() {
    this.unauthorizedListeners.forEach((listener) => listener.handleEvent());
  }

  void connnect(String jwt) {
    this.close();

    this._socket = IO.io(this._url, <String, dynamic>{
      'transports': ['websocket'],
      'extraHeaders': {'foo': 'bar'}
    });

    this._socket.on('connect', (_) {
      logger.finer('connected');
      this._socket.emit('authenticate', {'token': jwt});

      if (!this.connectionListenersInitialized) {
        this._socket.on('authenticated', (_) {
          logger.finer('authenticated');
        });
        
        this._notifyOnlineOfflineListener(true);
      }

      this._initializeConnectionListeners();

    });
  }

  void close() {
    if (this._socket != null) {
      this._socket.close();
      this._socket = null;
      this.connectionListenersInitialized = false;
    }
  }

  void myEventListener(EventType eventType, event) {
    print('recieved eventType=$eventType event=${event.toString()}');
  }

  void publishEvent(eventType, event) {
    this._socket.emit(eventType, event);
  }

}

abstract class EventListener {
  void handleEvent(String eventType, dynamic event);
}

abstract class OnlineOfflineListener {
  void handleEvent(bool online);
}
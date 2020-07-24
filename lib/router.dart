import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter/material.dart' show BuildContext, GlobalKey, NavigatorState;

import './logger.dart' show logger;

import './screens/home/index.dart' show HomeScreen;
import './screens/game/index.dart' show DankGameScreen;

/// Navigate to page using predefines `routes`.
/// 
/// To add more methods, refer to [Navigator class](https://api.flutter.dev/flutter/widgets/Navigator-class.html).
class _Router {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final Map<String, String> routes = {};

  String _composePath(String routeName, [Map<String, dynamic> params]) {
    // TODO: implement checks

    if (params == null) {
      return routeName;
    }

    final String composedPath = params.entries.fold(routeName, (routeName, kv) => routeName.replaceAll(':${kv.key}', '${kv.value}'));
    if (composedPath.contains(':')) {
      logger.severe('Failed to compose route ${routeName} with parameters ${params}.');
    }
    return composedPath;
  }

  void pop() {
    navigatorKey.currentState.pop();
  }

  Future<dynamic> push(String routeName, [Map<String, dynamic> params]) {
    return navigatorKey.currentState.pushNamed(_composePath(routeName, params));
  }

  Future<dynamic> replace(String routeName, [Map<String, dynamic> params]) {
    return navigatorKey.currentState.pushReplacementNamed(_composePath(routeName, params));
  }

}

final _Router router = _Router();

class _RouteDef {
  String path;
  Fluro.HandlerFunc handler;
  Fluro.HandlerType handlerType; 
  Fluro.TransitionType transitionType;

  _RouteDef(this.path, this.handler, { this.transitionType, this.handlerType });
}

class _FluroRouter extends Fluro.Router {
  void configureRoutes() {
    _routeHandlers.forEach((k, _RouteDef route) {
      router.routes[k] = route.path;
      logger.finer('Defining route=${route.path}');
      this.define(route.path, handler: Fluro.Handler(handlerFunc: route.handler));
    });

    this.notFoundHandler = Fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params, { replace = true }) {
        logger.warning('Non-existent route');
        router.replace(router.routes['/']);
        return;
      }
    );
  }

  final Map<String, _RouteDef> _routeHandlers = {
    '/': _RouteDef('/', (BuildContext context, Map<String, List<String>> params, { handlerType = Fluro.HandlerType.function }) {
      logger.finer('Navigate to /');
      return HomeScreen();
    }),
    '/game/dank': _RouteDef('/game/dank', (BuildContext context, Map<String, List<String>> params, { handlerType = Fluro.HandlerType.function }) {
      logger.finer('Navigate to /game/dank');
      return DankGameScreen();
    }),
  };
}
final _FluroRouter fluroRouter = _FluroRouter();
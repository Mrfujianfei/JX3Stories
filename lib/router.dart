import 'package:fluro/fluro.dart';
import 'package:his_hers_their/router_handler.dart';

class Routes {
  static String root = "/";
  static String home = "/animatedList/:type";

  static void ConfigureRoutes(Router router) {
    router.define('/', handler: homeHandler);
    router.define("/mine", handler: mineHandler);
  }
}

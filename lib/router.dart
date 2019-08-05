import 'package:fluro/fluro.dart';
import 'package:his_hers_their/router_handler.dart';

class Routes {
  static void configureRoutes(Router router) {
    router.define('/', handler: homeHandler);
    router.define('/article_detail', handler: articleDetailHandler);
    router.define("/commentList", handler: commentListHandler);
    router.define("/mine", handler: mineHandler);
    router.define("/login", handler: loginHandler);
    router.define("/register", handler: registerHandler);
  }
}

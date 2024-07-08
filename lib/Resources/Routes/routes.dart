import 'package:get/get.dart';
import 'package:tictactoe/Resources/Routes/routes_names.dart';
import 'package:tictactoe/View/HomeScreen/home_Screen.dart';
import 'package:tictactoe/View/SplashScreen/splash_Screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => SplashScreen(),
        ),
        GetPage(
          name: RoutesName.homeScreen,
          page: () => HomeScreen(),
        ),
      ];
}

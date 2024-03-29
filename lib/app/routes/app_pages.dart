import 'package:get/get.dart';
import 'package:apiproject_getx/app/modules/home/bindings/home_binding.dart';
import 'package:apiproject_getx/app/modules/home/views/login_view.dart';
part   'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => loginView(),
      binding: HomeBinding(),
    ),
  ];
}

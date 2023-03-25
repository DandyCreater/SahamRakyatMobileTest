import 'package:flutter/material.dart';
import 'package:mobile_dev_test/app/constanta_string.dart';
import 'package:mobile_dev_test/presentation/screen/dashboard.dart';
import 'package:mobile_dev_test/presentation/screen/detailfood_page.dart';
import 'package:mobile_dev_test/presentation/screen/splashscreen.dart';

class Routes {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case detailItem:
        return MaterialPageRoute(builder: (_) => const DetailFoodPage());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              leading: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Container(
              color: Colors.white,
              child: const Center(
                child: Text("Halaman Sedang Dalam Pengerjaan"),
              ),
            ),
          ),
        );
    }
  }
}

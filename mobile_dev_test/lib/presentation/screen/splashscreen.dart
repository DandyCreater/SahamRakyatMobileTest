import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_dev_test/app/constanta_string.dart';
import 'package:mobile_dev_test/presentation/bloc/list-food/list_food_bloc.dart';
import 'package:mobile_dev_test/presentation/bloc/list-kategori/list_kategori_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ListFoodBloc>().add(const FilterFood(foodKategori: "Beef"));
    context.read<ListKategoriBloc>().add(FetchKategori());
    Future.delayed(const Duration(seconds: 4))
        .then((value) => Navigator.pushNamed(context, dashboard));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.network(
            "https://assets9.lottiefiles.com/packages/lf20_rbtawnwz.json"),
      ),
    );
  }
}

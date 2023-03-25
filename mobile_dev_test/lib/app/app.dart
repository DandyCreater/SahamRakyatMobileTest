import 'package:flutter/material.dart';
import 'package:mobile_dev_test/app/constanta_string.dart';
import 'package:mobile_dev_test/app/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_dev_test/presentation/bloc/food-detail/food_detail_bloc.dart';
import 'package:mobile_dev_test/presentation/bloc/list-food/list_food_bloc.dart';
import 'package:mobile_dev_test/presentation/bloc/list-kategori/list_kategori_bloc.dart';

import 'injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final listkatergoriBloc = sl<ListKategoriBloc>();
    final listfoodBloc = sl<ListFoodBloc>();
    final detailFoodBloc = sl<FoodDetailBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => listkatergoriBloc),
        BlocProvider(create: (_) => listfoodBloc),
        BlocProvider(create: (_) => detailFoodBloc),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: splashScreen,
        onGenerateRoute: Routes().onGenerateRoute,
      ),
    );
  }
}

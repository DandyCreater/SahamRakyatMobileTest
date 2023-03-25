import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_dev_test/app/constanta_string.dart';
import 'package:mobile_dev_test/presentation/bloc/food-detail/food_detail_bloc.dart';
import 'package:mobile_dev_test/presentation/bloc/list-food/list_food_bloc.dart';
import 'package:mobile_dev_test/presentation/bloc/list-kategori/list_kategori_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Lottie.network(
                      "https://assets5.lottiefiles.com/packages/lf20_TmewUx.json"),
                ),
                const Text(
                  "Choose Your Food",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<ListKategoriBloc, ListKategoriState>(
                  builder: (context, state) {
                    if (state is ListKategoriSuccess) {
                      var items = state.value!.meals;
                      return DropdownButtonFormField2(
                        hint: Text(items!.first.strCategory!),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(4, 10, 18, 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        items: items
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item.strCategory!)))
                            .toList(),
                        isExpanded: true,
                        dropdownStyleData: const DropdownStyleData(
                          isOverButton: false,
                          maxHeight: 200,
                        ),
                        onChanged: (value) {
                          context.read<ListFoodBloc>().add(
                              FilterFood(foodKategori: value!.strCategory!));
                        },
                        onSaved: (value) {},
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: height * 0.65,
                  child: BlocBuilder<ListFoodBloc, ListFoodState>(
                    builder: (context, state) {
                      if (state is ListFoodSuccess) {
                        var items = state.value!.meals;
                        return AlignedGridView.count(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            physics: const BouncingScrollPhysics(),
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                            itemCount: items!.length,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  context.read<FoodDetailBloc>().add(
                                      SeeDetails(foodId: items[index].idMeal));
                                  Future.delayed(
                                          const Duration(milliseconds: 500))
                                      .then((value) => Navigator.pushNamed(
                                          context, detailItem));
                                },
                                child: Container(
                                  height: 200,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: const Offset(0, 2),
                                          color: Colors.black.withOpacity(0.2))
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      items[index]
                                                          .strMealThumb!),
                                                  fit: BoxFit.cover)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Menu Name : ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                items[index].strMeal!,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                              );
                            }));
                      }
                      return Center(
                        child: SizedBox(
                          height: 400,
                          width: 400,
                          child: Lottie.network(
                              "https://assets5.lottiefiles.com/temp/lf20_nXwOJj.json",
                              height: 300,
                              width: 300),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

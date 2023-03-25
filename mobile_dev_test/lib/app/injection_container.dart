import 'package:get_it/get_it.dart';
import 'package:mobile_dev_test/data/datasource/remote_data_source.dart';
import 'package:mobile_dev_test/data/repository/data_repository.dart';
import 'package:mobile_dev_test/domain/repository/domain_repository.dart';
import 'package:mobile_dev_test/domain/usecase/kategori_usecase.dart';
import 'package:mobile_dev_test/presentation/bloc/food-detail/food_detail_bloc.dart';
import 'package:mobile_dev_test/presentation/bloc/list-food/list_food_bloc.dart';
import 'package:mobile_dev_test/presentation/bloc/list-kategori/list_kategori_bloc.dart';

final sl = GetIt.instance;

Future<void> init(String baseUrl) async {
  //Bloc
  sl.registerFactory(() => ListKategoriBloc(sl()));
  sl.registerFactory(() => ListFoodBloc(sl()));
  sl.registerFactory(() => FoodDetailBloc(sl()));

  //UseCase
  sl.registerLazySingleton(() => ListKategoriUseCase(sl()));
  sl.registerLazySingleton(() => ListFoodUseCase(sl()));
  sl.registerLazySingleton(() => FoodDetailUseCase(sl()));

  //Repository
  sl.registerLazySingleton<DomainRepository>(
      () => DataRepository(remoteDataSource: sl()));

  //DataSource
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
}

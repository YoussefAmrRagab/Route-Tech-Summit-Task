import 'package:get_it/get_it.dart';
import 'package:route_flutter_task/data/data_sources/api.dart';
import 'package:route_flutter_task/data/repositories/repo.dart';
import 'package:route_flutter_task/presentation/view_models/home_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Api>(() => Api());
  getIt.registerLazySingleton<Repo>(() => Repo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}

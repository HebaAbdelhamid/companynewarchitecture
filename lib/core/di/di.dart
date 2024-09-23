import 'package:companynewarchitecture/core/network/dio_manager.dart';
import 'package:companynewarchitecture/feature/homepage/data/dataSource/home_remote_source.dart';
import 'package:companynewarchitecture/feature/homepage/data/repository/home_repository.dart';
import 'package:companynewarchitecture/feature/homepage/domain/repository/home_repository.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/home_page_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;


class Di {
  void setup() {
    getIt.registerLazySingleton<HomePageCubit>(()=> HomePageCubit(getIt.get<Dio>()));
    getIt.registerLazySingleton<Dio>(()=> Dio());
    //ClientRemoteDataSource
    //  final DioManager dioManager;
    getIt.registerLazySingleton<DioManager>(()=> DioManager.instance);

    getIt.registerLazySingleton<ClientRemoteDataSource>(()=> ClientRemoteDataSourceImpl(getIt.get<DioManager>()));

    getIt.registerLazySingleton< ClientRepository>(()=>ClientRepositoryImpl(getIt.get<ClientRemoteDataSource>()));

  }
}

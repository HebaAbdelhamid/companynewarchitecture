import 'package:bloc/bloc.dart';
import 'package:companynewarchitecture/core/di/di.dart';
import 'package:companynewarchitecture/feature/homepage/domain/entities/productDetails.dart';
import 'package:companynewarchitecture/feature/homepage/domain/entities/productDetails.dart';
import 'package:companynewarchitecture/feature/homepage/domain/usecase/get_product_details_usecase.dart';
import 'package:companynewarchitecture/feature/homepage/domain/usecase/get_product_usecase.dart';
import 'package:companynewarchitecture/feature/homepage/presentation/cubit/home_page_event.dart';
import 'package:dio/dio.dart';

import 'home_page_state.dart';

class HomePageCubit extends Bloc<HomeEvent,HomeStates> {
  HomePageCubit(this.dio) : super(InitialHomeState()){
    on<GetAllProductEvent>((event, emit) {
      geRealProduct();
    });
    on<GetProductDetailsEvent>((event,emit){
      geRealProductDetais(event.id);
    });
  }
  // getIt.get<Dio>();
  final Dio dio;

  void geRealProduct()async{
    emit(LoadingHomeState());
    GetClientsUsecase getClientsUsecase=GetClientsUsecase(getIt.get());
    getClientsUsecase.call().then((response) {
      response.fold((error) {
        // Handle Error
        emit(ErrorHomeState());
      }, (products) {
        print(products);
        // Handle Success
        emit(SuccessHomeState(products??[]));

      });
    });



  }
  void geRealProductDetais(int id)async{
    emit(LoadingHomeState());
    GetProductDetailsUsecase getProductDetailsUsecase =GetProductDetailsUsecase(getIt.get());
    getProductDetailsUsecase.call(id).then((response){
      response.fold((error){

      }, (productDetails){
        emit(SuccessDetailsState(productDetails ?? []));

      });
    }
    );}

  }


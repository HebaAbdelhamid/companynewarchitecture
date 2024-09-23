import 'package:companynewarchitecture/core/di/di.dart';
import 'package:companynewarchitecture/feature/homepage/domain/entities/product.dart';
import 'package:companynewarchitecture/feature/homepage/domain/entities/productDetails.dart';
import 'package:companynewarchitecture/feature/homepage/domain/usecase/get_product_details_usecase.dart';
import 'package:companynewarchitecture/feature/homepage/domain/usecase/get_product_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CounterController extends GetxController {
  var count = 0.obs;

    RxList<Productt> prodcts=RxList.empty();
    RxStatus status = RxStatus.loading();
  late Datat prodctts;

  void increment() {
    count++;
  }
  void geRealProduct()async{
    GetClientsUsecase getClientsUsecase=GetClientsUsecase(getIt.get());
    getClientsUsecase.call().then((response) {
      response.fold((error) {
        // Handle Error

        print(error);
      }, (products) {
        print(products);
        prodcts.assignAll(products ?? []);

        // prodcts=products;
        // Handle Success

      });
    });



  }
  void geRealProductDetais(int id)async{
    GetProductDetailsUsecase getProductDetailsUsecase =GetProductDetailsUsecase(getIt.get());
    getProductDetailsUsecase.call(id).then((response){
      response.fold((error){

      }, (productDetails){
prodctts=productDetails  ;
      });
    }
    );}

}

import 'package:companynewarchitecture/core/error/error_message_model.dart';
import 'package:companynewarchitecture/core/error/exceptions.dart';
import 'package:companynewarchitecture/core/network/api_constant.dart';
import 'package:companynewarchitecture/core/network/dio_manager.dart';
import 'package:companynewarchitecture/feature/homepage/data/model/product.dart';
import 'package:companynewarchitecture/feature/homepage/data/model/productDetails.dart';
import 'package:dio/dio.dart';

abstract class ClientRemoteDataSource {
  final DioManager dioManager;
  ClientRemoteDataSource(this.dioManager);

  Future<List<Product>> getClients();
  Future<Data> getProductDetails(int clientId);
}

class ClientRemoteDataSourceImpl extends ClientRemoteDataSource {
  ClientRemoteDataSourceImpl(super.dioManager);

  @override
  Future<List<Product>> getClients() async {
    try {
      var response = await dioManager.dio.get(ApiConstants.allproduct);
      return prodDuctModel.fromJson((response.data)).data ?? [];
    }  on DioException catch (error) {
      if (error.response != null) {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(error.response?.data)
        );
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(status: false, message: error.message ?? '')
        );
      }
    }
  }


  @override
  Future<Data> getProductDetails(int clientId) async {
    try {
      var response = await dioManager.dio.get(
        ApiConstants.productDetails(clientId),
      );
      return prodDuctDetailsModel.fromJson(response.data).data?? Data();
    } on DioException catch (error) {
      if (error.response != null) {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(error.response?.data)
        );
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(status: false, message: error.message ?? '')
        );
      }
    }
  }
}
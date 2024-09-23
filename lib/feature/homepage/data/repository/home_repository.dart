

import 'package:companynewarchitecture/core/error/exceptions.dart';
import 'package:companynewarchitecture/core/error/failure.dart';
import 'package:companynewarchitecture/feature/homepage/data/model/product.dart';
import 'package:companynewarchitecture/feature/homepage/data/model/productDetails.dart';
import 'package:companynewarchitecture/feature/homepage/domain/entities/productDetails.dart';
import 'package:companynewarchitecture/feature/homepage/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/product.dart';

class ClientRepositoryImpl extends ClientRepository {
  ClientRepositoryImpl(super.remoteDataSource);

  @override
  Future<Either<Failure, List<Productt>>> getClients() async {
    try {
      var response = await remoteDataSource.getClients();
      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessageModel.message));
    }
  }



  @override
  Future<Either<Failure, Datat>> getProductDetails(int clientId) async {
    try {
      var response = await remoteDataSource.getProductDetails(clientId);
      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessageModel.message));
    }
  }
}
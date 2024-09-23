import 'package:companynewarchitecture/core/error/failure.dart';
import 'package:companynewarchitecture/feature/homepage/data/model/productDetails.dart';
import 'package:companynewarchitecture/feature/homepage/domain/entities/productDetails.dart';
import 'package:companynewarchitecture/feature/homepage/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetProductDetailsUsecase {
  final ClientRepository repository;

  GetProductDetailsUsecase(this.repository);

  Future<Either<Failure, Datat>> call(int productId) async {
    return await repository.getProductDetails(productId);
  }
}
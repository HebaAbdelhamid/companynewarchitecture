import 'package:companynewarchitecture/core/error/failure.dart';
import 'package:companynewarchitecture/feature/homepage/data/dataSource/home_remote_source.dart';
import 'package:companynewarchitecture/feature/homepage/data/model/product.dart';
import 'package:companynewarchitecture/feature/homepage/data/model/productDetails.dart';
import 'package:dartz/dartz.dart';

import '../entities/product.dart';
import '../entities/productDetails.dart';

abstract class ClientRepository {
  final ClientRemoteDataSource remoteDataSource;
  ClientRepository(this.remoteDataSource);

  Future<Either<Failure, List<Productt>>> getClients();
  Future<Either<Failure, Datat>> getProductDetails(int clientId);
}
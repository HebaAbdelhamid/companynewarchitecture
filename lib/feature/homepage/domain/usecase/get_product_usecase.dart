import 'package:companynewarchitecture/core/error/failure.dart';
import 'package:companynewarchitecture/feature/homepage/data/model/product.dart';
import 'package:companynewarchitecture/feature/homepage/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/product.dart';

class GetClientsUsecase {
  final ClientRepository repository;

  GetClientsUsecase(this.repository);

  Future<Either<Failure, List<Productt>>> call() async {
    return await repository.getClients();
  }
}
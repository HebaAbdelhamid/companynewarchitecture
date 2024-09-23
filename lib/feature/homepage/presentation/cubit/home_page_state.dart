
import 'package:companynewarchitecture/feature/homepage/domain/entities/product.dart';
import 'package:companynewarchitecture/feature/homepage/domain/entities/productDetails.dart';

abstract class HomeStates{}
class InitialHomeState extends HomeStates{}
class LoadingHomeState extends HomeStates{}
class ErrorHomeState extends HomeStates{}

class SuccessHomeState extends HomeStates{
  final List<dynamic> prodcts;
  SuccessHomeState(this.prodcts);
}

class InitialDetailsState extends HomeStates{}
class LoadingDetailsState extends HomeStates{}
class SuccessDetailsState extends HomeStates{
  final dynamic prodcts;
  SuccessDetailsState(this.prodcts);
}
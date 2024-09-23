import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class GetAllProductEvent extends HomeEvent {
  const GetAllProductEvent();
}
class GetProductDetailsEvent extends HomeEvent {
  final int id;
  const GetProductDetailsEvent(this.id);
}
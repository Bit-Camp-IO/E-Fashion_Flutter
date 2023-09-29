part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class GetCategoriesEvent extends HomeEvent{
  final int genderId;

  const GetCategoriesEvent({required this.genderId});
  @override
  List<Object?> get props => [genderId];
}

class GetProductOffersEvent extends HomeEvent{
  final String? categories;

  const GetProductOffersEvent({this.categories});

  @override
  List<Object?> get props => [categories];
}

class GetBrandsEvent extends HomeEvent{
  const GetBrandsEvent();
}

class GetBrandsProductsEvent extends HomeEvent{
  final String? categories;
  const GetBrandsProductsEvent({this.categories});
}
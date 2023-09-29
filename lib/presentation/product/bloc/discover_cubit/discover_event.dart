part of 'discover_bloc.dart';

abstract class DiscoverEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class GetBrandProductsEvent extends DiscoverEvent{
  final String brandId;
  final String? categories;

  GetBrandProductsEvent({required this.brandId, required this.categories});
}

class GetOffersProductsEvent extends DiscoverEvent{
  final String? categories;

  GetOffersProductsEvent({required this.categories});
}

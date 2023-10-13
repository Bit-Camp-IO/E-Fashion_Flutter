import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/cartComponent/domain/entities/cart_order.dart';
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetOrdersListUseCase{
  final CartRepository _cartRepository;

  const GetOrdersListUseCase(this._cartRepository);

  Future<Either<Failure, List<CartOrder>>> call({required String userAccessToken}) async{
    return await _cartRepository.getOrdersList(userAccessToken: userAccessToken);
  }
}
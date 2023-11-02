import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class CreatePaymentIntentUseCase{
  final CartRepository _cartRepository;

  const CreatePaymentIntentUseCase(this._cartRepository);

  Future<Either<Failure, String>> call({required PaymentType paymentType, String? collectionId}) async{
    return await _cartRepository.createPaymentIntent(paymentType: paymentType, collectionId: collectionId);
  }
}
import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/create_payment_intent_usecase.dart';
import 'package:efashion_flutter/components/collectionComponent/domain/entities/collection.dart';
import 'package:efashion_flutter/components/collectionComponent/domain/entities/collection_item.dart';
import 'package:efashion_flutter/components/collectionComponent/domain/usecases/get_collection_items_list_usecase.dart';
import 'package:efashion_flutter/components/collectionComponent/domain/usecases/get_collections_list_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'collections_state.dart';

@injectable
class CollectionsCubit extends Cubit<CollectionsState> {
  final GetUserAccessTokenUseCase _getUserAccessTokenUseCase;
  final GetCollectionsListUseCase _getCollectionsListUseCase;
  final GetCollectionItemsListUseCase _getCollectionItemsListUseCase;
  final CreatePaymentIntentUseCase _createPaymentIntentUseCase;

  late String userAccessToken;

  CollectionsCubit(
    this._getUserAccessTokenUseCase,
    this._getCollectionsListUseCase,
    this._getCollectionItemsListUseCase,
    this._createPaymentIntentUseCase,
  ) : super(const CollectionsState());

  Future<void> getCollectionsList() async {
    emit(state.copyWith(collectionsState: CubitState.loading));
    final response = await _getCollectionsListUseCase();
    response.fold(
      (failure) => emit(
        state.copyWith(
          collectionsState: CubitState.failure,
          collectionsFailMessage: failure.message,
        ),
      ),
      (collectionsList) => emit(
        state.copyWith(
          collectionsState: CubitState.success,
          collectionsList: collectionsList,
        ),
      ),
    );
  }

  Future<void> getCollectionItemsList(
      {required String collectionId}) async {
    emit(state.copyWith(collectionItemsState: CubitState.loading));
    final response =
        await _getCollectionItemsListUseCase(collectionId: collectionId);
    response.fold(
      (failure) => emit(
        state.copyWith(
          collectionItemsState: CubitState.failure,
          collectionItemsFailMessage: failure.message,
        ),
      ),
      (collectionItemsList) => emit(
        state.copyWith(
          collectionItemsState: CubitState.success,
          collectionItemsList: collectionItemsList,
        ),
      ),
    );
  }

  Future<void> createPaymentIntent({required String collectionId}) async {
    emit(state.copyWith(paymentState: CubitState.loading));
    final getUserAccessToken = await _getUserAccessTokenUseCase();
    userAccessToken = getUserAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty) {
      final response = await _createPaymentIntentUseCase(
        paymentType: PaymentType.collection,
        collectionId: collectionId,
        userAccessToken: userAccessToken,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            paymentState: CubitState.failure,
            paymentMessage: failure.message,
          ),
        ),
        (clientSecret) {
          emit(
            state.copyWith(
              paymentClientSecret: clientSecret,
              paymentState: CubitState.success,
            ),
          );
        },
      );
    }
  }
}

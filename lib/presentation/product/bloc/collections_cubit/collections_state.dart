part of 'collections_cubit.dart';

class CollectionsState extends Equatable {
  final List<Collection> collectionsList;
  final CubitState collectionsState;
  final String collectionsFailMessage;
  final List<CollectionItem> collectionItemsList;
  final CubitState collectionItemsState;
  final String collectionItemsFailMessage;
  final String paymentClientSecret;
  final CubitState paymentState;
  final String paymentMessage;

  const CollectionsState({
    this.collectionsList = const [],
    this.collectionsState = CubitState.initial,
    this.collectionsFailMessage = '',
    this.collectionItemsList = const [],
    this.collectionItemsState = CubitState.initial,
    this.collectionItemsFailMessage = '',
    this.paymentClientSecret = '',
    this.paymentState = CubitState.initial,
    this.paymentMessage = '',
  });

  @override
  List<Object?> get props => [
    collectionsList,
    collectionsState,
    collectionsFailMessage,
    collectionItemsList,
    collectionItemsState,
    collectionItemsFailMessage,
    paymentClientSecret,
    paymentState,
    paymentMessage
  ];

  CollectionsState copyWith({
    List<Collection>? collectionsList,
    CubitState? collectionsState,
    String? collectionsFailMessage,
    List<CollectionItem>? collectionItemsList,
    CubitState? collectionItemsState,
    String? collectionItemsFailMessage,
    String? paymentClientSecret,
    CubitState? paymentState,
    String? paymentMessage,
  }) {
    return CollectionsState(
      collectionsList: collectionsList ?? this.collectionsList,
      collectionsState: collectionsState ?? this.collectionsState,
      collectionsFailMessage: collectionsFailMessage ?? this.collectionsFailMessage,
      collectionItemsList: collectionItemsList ?? this.collectionItemsList,
      collectionItemsState: collectionItemsState ?? this.collectionItemsState,
      collectionItemsFailMessage: collectionItemsFailMessage ?? this.collectionItemsFailMessage,
      paymentClientSecret: paymentClientSecret ?? this.paymentClientSecret,
      paymentState: paymentState ?? this.paymentState,
      paymentMessage: paymentMessage ?? this.paymentMessage,
    );
  }
}

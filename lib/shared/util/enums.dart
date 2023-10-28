enum NotificationType {
  general('GENERAL'),
  newMessage('NEW_MESSAGE'),
  orderStatus('STATUS_ORDER');
  const NotificationType(this.value);
  final String value;
}

enum DeliverStatus {
  onProgress,
  onTheWay,
  delivered;
}

enum BlocState {
  initial,
  loading,
  failure,
  success,
}

enum CubitState {
  initial,
  loading,
  failure,
  success,
}

enum PaymentType {
  cart("cart"),
  collection("collection");
  const PaymentType(String value);
}
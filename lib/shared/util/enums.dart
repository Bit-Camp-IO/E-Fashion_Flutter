enum NotificationType{
  rating,
  orderStatus,
  supportMessage;
}

enum DeliverStatus{
  onProgress,
  onTheWay,
  delivered;
}

enum BlocState{
  initial,
  loading,
  failure,
  success,
}

enum CubitState{
  initial,
  loading,
  failure,
  success,
}

enum PaymentType{
  cart("cart"),
  collection("collection");
  const PaymentType(String value);
}
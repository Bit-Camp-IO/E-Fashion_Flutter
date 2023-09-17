class Order {
  final String orderPicture;
  final String orderName;
  final String? orderSize;
  final int orderCost;
  final int orderProgress;

  Order({
    required this.orderPicture,
    required this.orderName,
    this.orderSize,
    required this.orderCost,
    required this.orderProgress,
  });

}
List<Order> ordersList = [
  Order(
    orderPicture: 'https://images.unsplash.com/photo-1632477574934-611a110c223f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=627&q=80',
    orderName: 'Modern Suit',
    orderSize: 'XL',
    orderCost: 220,
    orderProgress: 2,
  ),
  Order(
    orderPicture: 'https://images.unsplash.com/photo-1593631595508-193348a18b9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    orderName: 'Eternal Spring',
    orderCost: 130,
    orderProgress: 1,
  ),
  Order(
    orderPicture: 'https://images.unsplash.com/photo-1660036130490-b33c9962e36f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    orderName: 'Spring Dress',
    orderSize: 'M',
    orderCost: 180,
    orderProgress: 0,
  ),
  Order(
    orderPicture: 'https://images.unsplash.com/photo-1606659639419-8e5374a18522?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHphcmF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    orderName: 'Sun Glasses',
    orderCost: 100,
    orderProgress: 0,
  ),
];
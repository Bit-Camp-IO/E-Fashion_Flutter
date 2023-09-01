class Product {
  final int productId;
  final String productName;
  final String productImage;
  final int productPrice;
  final int avaliblePieces;
  final String? selectedSize;

  Product({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.avaliblePieces,
    this.selectedSize,
  });
}

List<Product> cartList = [
  Product(
    productId: 0,
    productName: 'Zara Hoodie',
    productImage:
        'https://images.unsplash.com/photo-1607957598810-191e891df4d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 150,
    avaliblePieces: 5,
    selectedSize: 'L',
  ),
  Product(
    productId: 1,
    productName: 'Sun Glasses',
    productImage:
        'https://images.unsplash.com/photo-1606659639419-8e5374a18522?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHphcmF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    productPrice: 100,
    avaliblePieces: 20,
  ),
  Product(
    productId: 2,
    productName: 'Premium Jacket',
    productImage:
        'https://images.unsplash.com/photo-1627637454030-5ddd536e06e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 200,
    avaliblePieces: 15,
    selectedSize: 'XL',
  ),
  Product(
    productId: 3,
    productName: 'Ice Watch',
    productImage:
        'https://images.unsplash.com/photo-1560024479-f513a5279041?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQyfHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 120,
    avaliblePieces: 25,
  ),
];

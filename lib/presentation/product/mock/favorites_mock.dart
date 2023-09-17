class Product {
  final int productId;
  final num productRating;
  final String productName;
  final String productImage;
  final String productDescription;
  final int? oldProductPrice;
  final int productPrice;
  final int avaliblePieces;
  final List<String> productSizes;
  final List<String> productColors;
  final List<double> rates;
  bool isFavorite;

  Product({
    required this.productId,
    required this.productName,
    required this.productRating,
    required this.productImage,
    required this.productDescription,
    required this.productPrice,
    this.oldProductPrice,
    required this.isFavorite,
    required this.avaliblePieces,
    required this.productSizes,
    required this.productColors,
    required this.rates,
  });
}


List<Product> favoriteList = [
  Product(
    productId: 0,
    productName: 'Zara Hoodie',
    productDescription:
    'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    productImage:
    'https://images.unsplash.com/photo-1607957598810-191e891df4d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 150,
    isFavorite: true,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
  ),
  Product(
    productId: 1,
    productName: 'Sun Glasses',
    productDescription:
    'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    productImage:
    'https://images.unsplash.com/photo-1606659639419-8e5374a18522?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHphcmF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    productPrice: 100,
    isFavorite: true,
    avaliblePieces: 20,
    productColors: [],
    productSizes: [],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
  ),
  Product(
    productId: 2,
    productName: 'Premium Jacket',
    productDescription:
    'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    productImage:
    'https://images.unsplash.com/photo-1627637454030-5ddd536e06e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 200,
    isFavorite: true,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
  ),
  Product(
    productId: 3,
    productName: 'Ice Watch',
    productDescription:
    'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    productImage:
    'https://images.unsplash.com/photo-1560024479-f513a5279041?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQyfHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 120,
    isFavorite: true,
    avaliblePieces: 25,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
  ),
];

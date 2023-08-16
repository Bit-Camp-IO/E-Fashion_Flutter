class Product {
  final String productName;
  final String productImage;
  final int? oldProductPrice;
  final int productPrice;
  final int avaliblePieces;
  final List<String> productSizes;
  final List<String> productColors;
  bool isFavorite;

  Product({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    this.oldProductPrice,
    required this.isFavorite,
    required this.avaliblePieces,
    required this.productSizes,
    required this.productColors,
  });
}

List<Product> offersList = [
  Product(
    productImage:  'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=765&q=80',
    productName: 'Nike Sneakers',
    oldProductPrice: 200,
    productPrice: 150,
    isFavorite: true,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['25', '30', '40', '45'],
  ),
  Product(
    productImage: 'https://images.unsplash.com/photo-1598554793905-075f7b355cd9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productName: 'White Shirt',
    oldProductPrice: 250,
    productPrice: 150,
    isFavorite: false,
    avaliblePieces: 20,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productImage: 'https://images.unsplash.com/photo-1595535373192-fc8935bacd89?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    productName: 'Chanel Perfume',
    oldProductPrice: 100,
    productPrice: 50,
    isFavorite: true,
    avaliblePieces: 10,
    productColors: [],
    productSizes: [],
  ),
  Product(
    productImage: 'https://images.unsplash.com/photo-1585728748176-455ac5eed962?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productName: 'Hijab',
    oldProductPrice: 300,
    productPrice: 250,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L'],
  ),
  Product(
    productImage: 'https://images.unsplash.com/photo-1542272604-787c3835535d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1026&q=80',
    productName: 'Jeans',
    oldProductPrice: 120,
    productPrice: 100,
    isFavorite: true,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'XL', '2XL', '3XL'],
  ),
];


List<Product> brandProducts = [
  Product(
    productName: 'Zara Hoodie',
    productImage:
    'https://images.unsplash.com/photo-1607957598810-191e891df4d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 150,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Sun Glasses',
    productImage:
        'https://images.unsplash.com/photo-1606659639419-8e5374a18522?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHphcmF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    productPrice: 100,
    isFavorite: true,
    avaliblePieces: 20,
    productColors: [],
    productSizes: [],
  ),
  Product(
    productName: 'Premium Jacket',
    productImage:
        'https://images.unsplash.com/photo-1627637454030-5ddd536e06e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 200,
    isFavorite: false,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Ice Watch',
    productImage:
        'https://images.unsplash.com/photo-1560024479-f513a5279041?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQyfHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 120,
    isFavorite: true,
    avaliblePieces: 25,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L'],
  ),
  Product(
    productName: 'Eternal Spring',
    productImage:
        'https://images.unsplash.com/photo-1593631595508-193348a18b9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 130,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: [],
    productSizes: [],
  ),
  Product(
    productName: 'Winter Jacket',
    productImage:
        'https://images.unsplash.com/photo-1610300682526-8c48f59bebf0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 170,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'BackPack',
    productImage:
        'https://images.unsplash.com/photo-1621426867697-43e9693282fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
    productPrice: 110,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Spring Dress',
    productImage:
        'https://images.unsplash.com/photo-1660036130490-b33c9962e36f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 180,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Modern Suit',
    productImage:
        'https://images.unsplash.com/photo-1632477574934-611a110c223f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=627&q=80',
    productPrice: 220,
    isFavorite: true,
    avaliblePieces: 20,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Air Jorden',
    productImage:
        'https://images.unsplash.com/photo-1642331746507-18a385de3b33?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTI3fHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 145,
    isFavorite: false,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['25', '30', '40', '45'],
  ),
  Product(
    productName: 'Zara Hoodie',
    productImage:
    'https://images.unsplash.com/photo-1607957598810-191e891df4d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 150,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Sun Glasses',
    productImage:
    'https://images.unsplash.com/photo-1606659639419-8e5374a18522?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHphcmF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    productPrice: 100,
    isFavorite: true,
    avaliblePieces: 20,
    productColors: [],
    productSizes: [],
  ),
  Product(
    productName: 'Premium Jacket',
    productImage:
    'https://images.unsplash.com/photo-1627637454030-5ddd536e06e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 200,
    isFavorite: false,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Ice Watch',
    productImage:
    'https://images.unsplash.com/photo-1560024479-f513a5279041?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQyfHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 120,
    isFavorite: true,
    avaliblePieces: 25,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L'],
  ),
  Product(
    productName: 'Eternal Spring',
    productImage:
    'https://images.unsplash.com/photo-1593631595508-193348a18b9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 130,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: [],
    productSizes: [],
  ),
  Product(
    productName: 'Winter Jacket',
    productImage:
    'https://images.unsplash.com/photo-1610300682526-8c48f59bebf0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 170,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'BackPack',
    productImage:
    'https://images.unsplash.com/photo-1621426867697-43e9693282fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
    productPrice: 110,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Spring Dress',
    productImage:
    'https://images.unsplash.com/photo-1660036130490-b33c9962e36f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 180,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Modern Suit',
    productImage:
    'https://images.unsplash.com/photo-1632477574934-611a110c223f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=627&q=80',
    productPrice: 220,
    isFavorite: true,
    avaliblePieces: 20,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Air Jorden',
    productImage:
    'https://images.unsplash.com/photo-1642331746507-18a385de3b33?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTI3fHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 145,
    isFavorite: false,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['25', '30', '40', '45'],
  ),
  Product(
    productName: 'Zara Hoodie',
    productImage:
    'https://images.unsplash.com/photo-1607957598810-191e891df4d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 150,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Sun Glasses',
    productImage:
    'https://images.unsplash.com/photo-1606659639419-8e5374a18522?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHphcmF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    productPrice: 100,
    isFavorite: true,
    avaliblePieces: 20,
    productColors: [],
    productSizes: [],
  ),
  Product(
    productName: 'Premium Jacket',
    productImage:
    'https://images.unsplash.com/photo-1627637454030-5ddd536e06e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 200,
    isFavorite: false,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Ice Watch',
    productImage:
    'https://images.unsplash.com/photo-1560024479-f513a5279041?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQyfHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 120,
    isFavorite: true,
    avaliblePieces: 25,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L'],
  ),
  Product(
    productName: 'Eternal Spring',
    productImage:
    'https://images.unsplash.com/photo-1593631595508-193348a18b9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 130,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: [],
    productSizes: [],
  ),
  Product(
    productName: 'Winter Jacket',
    productImage:
    'https://images.unsplash.com/photo-1610300682526-8c48f59bebf0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 170,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'BackPack',
    productImage:
    'https://images.unsplash.com/photo-1621426867697-43e9693282fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
    productPrice: 110,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Spring Dress',
    productImage:
    'https://images.unsplash.com/photo-1660036130490-b33c9962e36f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 180,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Modern Suit',
    productImage:
    'https://images.unsplash.com/photo-1632477574934-611a110c223f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=627&q=80',
    productPrice: 220,
    isFavorite: true,
    avaliblePieces: 20,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Air Jorden',
    productImage:
    'https://images.unsplash.com/photo-1642331746507-18a385de3b33?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTI3fHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 145,
    isFavorite: false,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['25', '30', '40', '45'],
  ),
  Product(
    productName: 'Zara Hoodie',
    productImage:
    'https://images.unsplash.com/photo-1607957598810-191e891df4d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 150,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Sun Glasses',
    productImage:
    'https://images.unsplash.com/photo-1606659639419-8e5374a18522?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHphcmF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    productPrice: 100,
    isFavorite: true,
    avaliblePieces: 20,
    productColors: [],
    productSizes: [],
  ),
  Product(
    productName: 'Premium Jacket',
    productImage:
    'https://images.unsplash.com/photo-1627637454030-5ddd536e06e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 200,
    isFavorite: false,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Ice Watch',
    productImage:
    'https://images.unsplash.com/photo-1560024479-f513a5279041?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQyfHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 120,
    isFavorite: true,
    avaliblePieces: 25,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L'],
  ),
  Product(
    productName: 'Eternal Spring',
    productImage:
    'https://images.unsplash.com/photo-1593631595508-193348a18b9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 130,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: [],
    productSizes: [],
  ),
  Product(
    productName: 'Winter Jacket',
    productImage:
    'https://images.unsplash.com/photo-1610300682526-8c48f59bebf0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 170,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'BackPack',
    productImage:
    'https://images.unsplash.com/photo-1621426867697-43e9693282fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
    productPrice: 110,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Spring Dress',
    productImage:
    'https://images.unsplash.com/photo-1660036130490-b33c9962e36f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 180,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Modern Suit',
    productImage:
    'https://images.unsplash.com/photo-1632477574934-611a110c223f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=627&q=80',
    productPrice: 220,
    isFavorite: true,
    avaliblePieces: 20,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Air Jorden',
    productImage:
    'https://images.unsplash.com/photo-1642331746507-18a385de3b33?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTI3fHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 145,
    isFavorite: false,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['25', '30', '40', '45'],
  ),
  Product(
    productName: 'Zara Hoodie',
    productImage:
    'https://images.unsplash.com/photo-1607957598810-191e891df4d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 150,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Sun Glasses',
    productImage:
    'https://images.unsplash.com/photo-1606659639419-8e5374a18522?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHphcmF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    productPrice: 100,
    isFavorite: true,
    avaliblePieces: 20,
    productColors: [],
    productSizes: [],
  ),
  Product(
    productName: 'Premium Jacket',
    productImage:
    'https://images.unsplash.com/photo-1627637454030-5ddd536e06e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 200,
    isFavorite: false,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Ice Watch',
    productImage:
    'https://images.unsplash.com/photo-1560024479-f513a5279041?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQyfHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 120,
    isFavorite: true,
    avaliblePieces: 25,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L'],
  ),
  Product(
    productName: 'Eternal Spring',
    productImage:
    'https://images.unsplash.com/photo-1593631595508-193348a18b9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 130,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: [],
    productSizes: [],
  ),
  Product(
    productName: 'Winter Jacket',
    productImage:
    'https://images.unsplash.com/photo-1610300682526-8c48f59bebf0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 170,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'BackPack',
    productImage:
    'https://images.unsplash.com/photo-1621426867697-43e9693282fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
    productPrice: 110,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Spring Dress',
    productImage:
    'https://images.unsplash.com/photo-1660036130490-b33c9962e36f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 180,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Modern Suit',
    productImage:
    'https://images.unsplash.com/photo-1632477574934-611a110c223f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=627&q=80',
    productPrice: 220,
    isFavorite: true,
    avaliblePieces: 20,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
  ),
  Product(
    productName: 'Air Jorden',
    productImage:
    'https://images.unsplash.com/photo-1642331746507-18a385de3b33?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTI3fHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 145,
    isFavorite: false,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['25', '30', '40', '45'],
  ),
];

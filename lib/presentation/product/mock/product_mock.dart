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
  final List<Review> reviews;
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
    required this.reviews,
  });
}

class Review {
  final String reviewerName;
  final String reviewerImage;
  final String reviewDescription;
  final num reviewRating;
  final String reviewDate;

  Review({
    required this.reviewerName,
    required this.reviewerImage,
    required this.reviewDescription,
    required this.reviewRating,
    required this.reviewDate,
  });
}

List<Product> offersList = [
  Product(
    productId: 0,
    productImage:
        'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=765&q=80',
    productName: 'Nike Sneakers',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    oldProductPrice: 200,
    productPrice: 150,
    isFavorite: true,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['25', '30', '40', '45'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
  Product(
    productId: 1,
    productImage:
        'https://images.unsplash.com/photo-1598554793905-075f7b355cd9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productName: 'White Shirt',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    oldProductPrice: 250,
    productPrice: 150,
    isFavorite: false,
    avaliblePieces: 20,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
  Product(
    productId: 2,
    productImage:
        'https://images.unsplash.com/photo-1595535373192-fc8935bacd89?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    productName: 'Chanel Perfume',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    oldProductPrice: 100,
    productPrice: 50,
    isFavorite: true,
    avaliblePieces: 10,
    productColors: [],
    productSizes: [],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
  Product(
    productId: 3,
    productImage:
        'https://images.unsplash.com/photo-1585728748176-455ac5eed962?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productName: 'Hijab',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    oldProductPrice: 300,
    productPrice: 250,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
  Product(
    productId: 4,
    productImage:
        'https://images.unsplash.com/photo-1542272604-787c3835535d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1026&q=80',
    productName: 'Jeans',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    oldProductPrice: 120,
    productPrice: 100,
    isFavorite: true,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'XL', '2XL', '3XL'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
];

List<Product> brandProducts = [
  Product(
    productId: 0,
    productName: 'Zara Hoodie',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    productImage:
        'https://images.unsplash.com/photo-1607957598810-191e891df4d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 150,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
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
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
  Product(
    productId: 2,
    productName: 'Premium Jacket',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    productImage:
        'https://images.unsplash.com/photo-1627637454030-5ddd536e06e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 200,
    isFavorite: false,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
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
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
  Product(
    productId: 4,
    productName: 'Eternal Spring',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    productImage:
        'https://images.unsplash.com/photo-1593631595508-193348a18b9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 130,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: [],
    productSizes: [],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
  Product(
    productId: 5,
    productName: 'Winter Jacket',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    productImage:
        'https://images.unsplash.com/photo-1610300682526-8c48f59bebf0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 170,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
  Product(
    productId: 6,
    productName: 'BackPack',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    productImage:
        'https://images.unsplash.com/photo-1621426867697-43e9693282fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
    productPrice: 110,
    isFavorite: false,
    avaliblePieces: 5,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
  Product(
    productId: 7,
    productName: 'Angles',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    productImage:
        'https://images.unsplash.com/photo-1660036130490-b33c9962e36f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    productPrice: 180,
    isFavorite: false,
    avaliblePieces: 10,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
  Product(
    productId: 8,
    productName: 'Alaska',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    productImage:
        'https://images.unsplash.com/photo-1632477574934-611a110c223f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=627&q=80',
    productPrice: 220,
    isFavorite: true,
    avaliblePieces: 20,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['S', 'M', 'L', 'XL', '2XL', '3XL'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
  Product(
    productId: 9,
    productName: 'Alexandria',
    productDescription:
        'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
    productImage:
        'https://images.unsplash.com/photo-1642331746507-18a385de3b33?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTI3fHx6YXJhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    productPrice: 145,
    isFavorite: false,
    avaliblePieces: 15,
    productColors: ['000000', 'FFFFFF', 'FF0000', '7E4919', 'FFF504'],
    productSizes: ['25', '30', '40', '45'],
    productRating: 4.9,
    rates: [0.9, 0.08, 0.01, 0.01, 0.0],
    reviews: [
      Review(
        reviewerName: 'Momen',
        reviewerImage: 'https://i.imgur.com/Aqp3jEl.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.9,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Youssef',
        reviewerImage: 'https://i.imgur.com/zfSjKqc.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 4.5,
        reviewDate: '11-11-2023',
      ),
      Review(
        reviewerName: 'Abdelwahab',
        reviewerImage: 'https://i.imgur.com/wpc5zcb.jpg',
        reviewDescription: 'Lorem ipsum dolor sit amet consectetur. Elit neque integer enim diam rhoncus rhoncus eu ut. Porttitor elementum arcu gravida adipiscing in. Consequat.',
        reviewRating: 0.0,
        reviewDate: '11-11-2023',
      ),
    ],
  ),
];

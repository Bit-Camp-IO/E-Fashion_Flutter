class CollectionMock {
  final String collectionPic;
  final String collectionName;
  final int offer;

  CollectionMock(
      {required this.collectionPic,
      required this.collectionName,
      required this.offer});
}

List<CollectionMock> collectionItems = [
  CollectionMock(
    collectionPic: 'https://images.unsplash.com/photo-1599309329365-0a9ed45a1da3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    collectionName: 'Summer',
    offer: 40,
  ),
  CollectionMock(
    collectionPic: 'https://images.unsplash.com/photo-1526153661472-c35c2f537cff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=736&q=80',
    collectionName: 'Winter',
    offer: 30,
  ),
  CollectionMock(
    collectionPic: 'https://images.unsplash.com/photo-1645499474229-ce6eb051f27a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=749&q=80',
    collectionName: 'Spring',
    offer: 35,
  ),
  CollectionMock(
    collectionPic: 'https://images.unsplash.com/photo-1583001810204-ac030157288f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    collectionName: 'Autumn',
    offer: 50,
  ),
];

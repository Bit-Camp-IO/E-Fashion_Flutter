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
    collectionPic: 'https://images.unsplash.com/photo-1485462537746-965f33f7f6a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
    collectionName: 'Winter',
    offer: 30,
  ),
  CollectionMock(
    collectionPic: 'https://images.unsplash.com/photo-1619919339651-989473d135e9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
    collectionName: 'Spring',
    offer: 35,
  ),
  CollectionMock(
    collectionPic: 'https://images.unsplash.com/photo-1636537843649-857a09b9000b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
    collectionName: 'Fall',
    offer: 50,
  ),
  CollectionMock(
    collectionPic: 'https://images.unsplash.com/photo-1680970476028-1b4b330e5a45?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80',
    collectionName: 'Hijab',
    offer: 30,
  ),
];

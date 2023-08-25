class Gender {
  final String name;
  final String picture;

  Gender({required this.name, required this.picture});
}

List<Gender> genders = [
  Gender(
    name: 'Women',
    picture:
        'https://images.unsplash.com/photo-1581338834647-b0fb40704e21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
  ),
  Gender(
      name: 'Men',
      picture:
          'https://images.unsplash.com/photo-1610384104075-e05c8cf200c3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80'),
];

class Filter {
  final String filterName;
  final String filterImageUrl;

  Filter({required this.filterName, required this.filterImageUrl});
}

List<Filter> filters = [
  Filter(
    filterName: 'Jeans',
    filterImageUrl:
        'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  ),
  Filter(
    filterName: 'Dress',
    filterImageUrl:
        'https://images.unsplash.com/flagged/photo-1576572093163-83b5ad089423?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
  ),
  Filter(
    filterName: 'T-Shirts',
    filterImageUrl:
        'https://images.unsplash.com/photo-1489987707025-afc232f7ea0f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  ),
  Filter(
    filterName: 'Blouse',
    filterImageUrl:
        'https://images.unsplash.com/photo-1578587018452-892bacefd3f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
  ),
  Filter(
    filterName: 'Perfume',
    filterImageUrl:
        'https://images.unsplash.com/photo-1627408727578-172381083156?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
  ),
  Filter(
    filterName: 'Shoes',
    filterImageUrl:
        'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80',
  ),
  Filter(
    filterName: 'Shorts',
    filterImageUrl: '',
  ),
  Filter(
    filterName: 'Socks',
    filterImageUrl: '',
  ),
  Filter(
    filterName: 'Sweatshirt',
    filterImageUrl: '',
  ),
  Filter(
    filterName: 'Vests',
    filterImageUrl: '',
  ),
  Filter(
    filterName: 'Suits',
    filterImageUrl: '',
  ),
  Filter(
    filterName: 'Sneakers',
    filterImageUrl: '',
  ),
  Filter(
    filterName: 'Jackets',
    filterImageUrl: '',
  ),
  Filter(
    filterName: 'Pants',
    filterImageUrl: '',
  ),
];

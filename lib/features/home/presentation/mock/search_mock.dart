import 'dart:ui';

class FilterColor {
  final String colorName;
  final Color color;

  FilterColor({required this.colorName, required this.color});
}

List<FilterColor> filterColors = [
  FilterColor(
    colorName: 'Red',
    color: const Color(0xFFFF0000),
  ),
  FilterColor(
    colorName: 'Blue',
    color: const  Color(0xFF0029FF),
  ),
  FilterColor(
    colorName: 'Black',
    color: const Color(0xFF000000),
  ),
  FilterColor(
    colorName: 'Yellow',
    color: const Color(0xFFFFF504),
  ),
  FilterColor(
    colorName: 'White',
    color: const Color(0xFFFFFFFF),
  ),
  FilterColor(
    colorName: 'Brown',
    color: const Color(0xFF8E4602),
  ),
];

List<String> filterSizes = [
  'S',
  'M',
  'L',
  'XL',
  '2XL',
  '3XL',
  '30',
  '35',
  '40',
  '45',
];
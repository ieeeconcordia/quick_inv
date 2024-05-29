enum PropertyType { none }

class Property {
  final String id;
  final String propertyName;
  final PropertyType propertyType;
  final String propertyUnit;

  Property(
      {required this.id,
      required this.propertyName,
      required this.propertyType,
      required this.propertyUnit});
}

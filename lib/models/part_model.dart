class Part {
  final String id;
  final String partName;
  final String partNumber;
  final int? quantity;
  final double? price;

  Part(
      {required this.id,
      required this.partName,
      required this.partNumber,
      this.quantity,
      this.price});

}

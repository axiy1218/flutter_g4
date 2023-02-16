class CryptoModel {
  final String name;
  final num? price;
  final num? precent;
  final num? color;
  final String? logo;
  const CryptoModel(
      {required this.name,
      required this.price,
      required this.logo,
      required this.precent,
      required this.color});
}

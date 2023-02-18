class DoctorTileModel {
  final String name;
  final String profession;
  final String image;
  final num rating;
  final bool isFavourite;
  final bool isOnline;

  const DoctorTileModel(
      {required this.image,
      required this.isOnline,
      required this.isFavourite,
      required this.name,
      required this.profession,
      required this.rating});

  DoctorTileModel copyWith(
          {String? image,
          bool? isOnline,
          bool? isFavourite,
          String? name,
          String? profession,
          num? rating}) =>
      DoctorTileModel(
          image: image ?? this.image,
          isOnline: isOnline ?? this.isOnline,
          isFavourite: isFavourite ?? this.isFavourite,
          name: name ?? this.name,
          profession: profession ?? this.profession,
          rating: rating ?? this.rating);
}

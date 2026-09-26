class GoogleOffice {
  const GoogleOffice({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.region,
    required this.address,
    required this.imageUrl,
    required this.description,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
  });

  final String id;
  final String name;
  final String city;
  final String country;
  final String region;
  final String address;
  final String imageUrl;
  final String description;
  final String phoneNumber;
  final double latitude;
  final double longitude;

  String get location => '$city, $country';
}
class User {
  int id;
  String name;
  String email;
  String phone;
  String website;
  String catchPhrase;
  String bs;
  String companyName;
  String latitude;
  String longitude;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
    required this.bs,
    required this.catchPhrase,
    required this.companyName,
    required this.latitude,
    required this.longitude,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      companyName: json['company']['name'],
      catchPhrase: json['company']['catchPhrase'],
      bs: json['company']['bs'],
      latitude: json['address']['geo']['lat'],
      longitude: json['address']['geo']['lng'],
    );
  }
}

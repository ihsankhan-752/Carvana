class ContactUsModel {
  String email;
  int phoneNumber;
  int whatsApp;
  String website;

  ContactUsModel({
    required this.email,
    required this.phoneNumber,
    required this.whatsApp,
    required this.website,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phoneNumber': phoneNumber,
      'whatsApp': whatsApp,
      'website': website,
    };
  }

  factory ContactUsModel.fromMap(Map<String, dynamic> map) {
    return ContactUsModel(
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as int,
      whatsApp: map['whatsApp'] as int,
      website: map['website'] as String,
    );
  }
}

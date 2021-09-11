// ignore_for_file: file_names

class User {
  String? id;
  String? name;
  String? role;
  bool? isActive;
  DateTime? dateOfBirth;
  DateTime? createdAt;
  String? email;
  String? password;
  String? phoneNumber;
  String? speciality;

  User({
    required this.id,
    required this.name,
    required this.role,
    this.dateOfBirth,
    this.createdAt,
    this.isActive,
    this.email,
    this.password,
    this.phoneNumber,
    this.speciality,
  });

  User.fromJson(Map<String, dynamic> json) {
      role =  json['role'];
      isActive =  json['isActive'];
      id =  json['_id'];
      name =  json['name'];
      dateOfBirth =  json['dateOfBirth'];
      createdAt =  json['createdAt'];
      email =  json['email'];
      password =  json['password'];
      phoneNumber =  json['phoneNumber'];
      speciality =  json['speciality'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['isActive'] = this.isActive;
    data['_id'] = this.id;
    data['name'] = this.name;
    data['dateOfBirth'] = this.dateOfBirth;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

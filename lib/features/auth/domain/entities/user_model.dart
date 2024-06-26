

class UserModel {

  String? uid;
  String? role;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? numberAndStreet;
  String? postalCodeAndCity;
  String? mobileNumber;
  String? imgUrl;


  UserModel({
    this.uid,
    this.role,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.numberAndStreet,
    this.postalCodeAndCity,
    this.mobileNumber,
    this.imgUrl,

  });



  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['uid'] = uid;
    map['role'] = role;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] =email;
    map['password'] =password;
    map['numberAndStreet'] =numberAndStreet;
    map['postalCodeAndCity'] =postalCodeAndCity;
    map['mobileNumber'] =mobileNumber;
    map['imgUrl'] =imgUrl;


    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map){
    uid = map['uid'];
    role = map['role'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    email = map['email'];
    password = map['password'];
    numberAndStreet = map['numberAndStreet'];
    postalCodeAndCity = map['postalCodeAndCity'];
    mobileNumber = map['mobileNumber'];
    imgUrl = map['imgUrl'];

  }



  UserModel copyWith({
    String? uid,
    String? role,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? numberAndStreet,
    String? postalCodeAndCity,
    String? mobileNumber,
    String? imgUrl,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      role: role ?? this.role,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      numberAndStreet: numberAndStreet ?? this.numberAndStreet,
      postalCodeAndCity: postalCodeAndCity ?? this.postalCodeAndCity,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      imgUrl: imgUrl ?? this.imgUrl,


    );
  }
}


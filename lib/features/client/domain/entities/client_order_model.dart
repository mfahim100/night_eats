
import 'cart_model.dart';

class ClientOrderModel {




  String? uid;
  String? orderId;
  String? name;
  String? email;
  int? status;
  String? numberAndStreet;
  String? postalCodeAndCity;
  String? phoneNumber;
  String? assignTo;
  double? lat;
  double? long;
  int? date;
  List<dynamic>? listOfCardModel;
  int? totalAmountOfAllProduct;


  ClientOrderModel({
    this.uid,
    this.orderId,
    this.name,
    this.email,
    this.status,
    this.numberAndStreet,
    this.postalCodeAndCity,
    this.phoneNumber,
    this.assignTo,
    this.lat,
    this.long,
    this.date,
    this.listOfCardModel,
    this.totalAmountOfAllProduct,
  });



  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['uid'] = uid;
    map['orderId'] = orderId;
    map['name'] = name;
    map['email'] = email;
    map['status'] = status;
    map['numberAndStreet'] = numberAndStreet;
    map['postalCodeAndCity'] = postalCodeAndCity;
    map['phoneNumber'] = phoneNumber;
    map['assignTo'] = assignTo;
    map['lat'] = lat;
    map['long'] = long;
    map['date'] = date;
    map['listOfCardModel'] = listOfCardModel;
    map['totalAmountOfAllProduct'] = totalAmountOfAllProduct;
    map['listOfCardModel'] =  listOfCardModel?.map((item) => item.toMap()).toList();
    return map;
  }




  ClientOrderModel.fromMap(Map<String, dynamic> map){
    uid = map['uid'];
    orderId = map['orderId'];
    name = map['name'];
    email = map['email'];
    status = map['status'];
    numberAndStreet = map['numberAndStreet'];
    postalCodeAndCity = map['postalCodeAndCity'];
    phoneNumber = map['phoneNumber'];
    assignTo = map['assignTo'];
    lat = map['lat'];
    long = map['long'];
    date = map['date'];
    listOfCardModel = map['listOfCardModel'];
    totalAmountOfAllProduct = map['totalAmountOfAllProduct'];
    if(map['listOfCardModel'] != null){
      print("____________");
      listOfCardModel = map['listOfCardModel'] != null
          ? List<dynamic>.from(map['listOfCardModel'].map((item) => CartModel.fromMap(item)))
          : null;
    }
  }


  ClientOrderModel copyWith({
    String? uid,
    String? orderId,
    String? name,
    String? email,
    int? status,
    String? numberAndStreet,
    String? postalCodeAndCity,
    String? phoneNumber,
    String? assignTo,
    double? lat,
    double? long,
    int? date,
    List<CartModel>? listOfCardModel,
    int? totalAmountOfAllProduct,

  }) {
    return ClientOrderModel(
      uid: uid ?? this.uid,
      orderId: orderId ?? this.orderId,
      name: name ?? this.name,
      email: email ?? this.email,
      status: status ?? this.status,
      numberAndStreet: numberAndStreet ?? this.numberAndStreet,
      postalCodeAndCity: postalCodeAndCity ?? this.postalCodeAndCity,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      assignTo: assignTo ?? this.assignTo,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      date: date ?? this.date,
      listOfCardModel: listOfCardModel ?? this.listOfCardModel,
      totalAmountOfAllProduct: totalAmountOfAllProduct ?? this.totalAmountOfAllProduct,



    );
  }




}



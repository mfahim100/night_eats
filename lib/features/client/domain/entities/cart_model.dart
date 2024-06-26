class CartModel {


  String? uid;
  String? itemID;
  String? itemName;
  String? itemPrice;
  String? itemDescription;
  String? itemImage;
  int? quantity;
  int? total;


  CartModel({
    this.uid,
    this.itemID,
    this.itemName,
    this.itemPrice,
    this.itemDescription,
    this.itemImage,
    this.quantity,
    this.total,
  });



  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['uid'] = uid;
    map['itemID'] = itemID;
    map['itemName'] = itemName;
    map['itemPrice'] = itemPrice;
    map['itemDescription'] = itemDescription;
    map['itemImage'] = itemImage;
    map['quantity'] = quantity;
    map['total'] = total;



    return map;
  }




  CartModel.fromMap(Map<String, dynamic> map){
    uid = map['uid'];
    itemID = map['itemID'];
    itemName = map['itemName'];
    itemPrice = map['itemPrice'];
    itemDescription = map['itemDescription'];
    itemImage = map['itemImage'];
    quantity = map['quantity'];
    total = map['total'];

  }


  CartModel copyWith({
    String? uid,
    String? itemID,
    String? itemName,
    String? itemPrice,
    String? itemDescription,
    String? itemImage,
    int? quantity,
    int? total,
  }) {
    return CartModel(
      uid: uid ?? this.uid,
      itemID: itemID ?? this.itemID,
      itemName: itemName ?? this.itemName,
      itemPrice: itemPrice ?? this.itemPrice,
      itemDescription: itemDescription ?? this.itemDescription,
      itemImage: itemImage ?? this.itemImage,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
    );

  }




}



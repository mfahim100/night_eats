class ItemModel {


  String? uid;
  String? itemID;
  String? itemName;
  String? itemPrice;
  String? itemDescription;
  String? itemImage;


  ItemModel({
    this.uid,
    this.itemID,
    this.itemName,
    this.itemPrice,
    this.itemDescription,
    this.itemImage,
  });



  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['uid'] = uid;
    map['itemID'] = itemID;
    map['itemName'] = itemName;
    map['itemPrice'] = itemPrice;
    map['itemDescription'] = itemDescription;
    map['itemImage'] = itemImage;


    return map;
  }




  ItemModel.fromMap(Map<String, dynamic> map){
    uid = map['uid'];
    itemID = map['itemID'];
    itemName = map['itemName'];
    itemPrice = map['itemPrice'];
    itemDescription = map['itemDescription'];
    itemImage = map['itemImage'];

  }


  ItemModel copyWith({
    String? uid,
    String? itemID,
    String? itemName,
    String? itemPrice,
    String? itemDescription,
    String? itemImage,
  }) {
    return ItemModel(
      uid: uid ?? this.uid,
      itemID: itemID ?? this.itemID,
      itemName: itemName ?? this.itemName,
      itemPrice: itemPrice ?? this.itemPrice,
      itemDescription: itemDescription ?? this.itemDescription,
      itemImage: itemImage ?? this.itemImage,

    );
  }




}



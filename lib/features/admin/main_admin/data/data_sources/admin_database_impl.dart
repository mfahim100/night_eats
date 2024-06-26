

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:night_eats/features/admin/main_admin/data/data_sources/admin_database_main.dart';
import 'package:night_eats/features/admin/main_admin/domain/entities/item_model.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';

import '../../../../auth/domain/entities/user_model.dart';

class AdminDatabaseImpl implements AdminDatabaseMain {



  final _db = FirebaseFirestore.instance;

  @override
  Future<String> insertNewItem(ItemModel itemModel) async {
    String message = '';

    try{

      await _db.collection('items').doc(itemModel.itemID).set(itemModel.toMap());
      print('Item has been Added');
      message = 'Success';

    }
    catch(e){
      print('the error in insertNewItem in AdminDatabaseImpl  //////!!!!! is $e');
      message = 'the error in insertNewItem in AdminDatabaseImpl $e';
    }

    return message;
  }



  @override
  Future<List<ItemModel>> getMyItems(String uid) async {
    List<ItemModel> mdl = [];
    try{
            final snapshot = await _db.collection('items').get();
            print(snapshot.docs);
            print('///////////////////////////////////////////////////////////////><><><><><><><><><><');
            for(var element in snapshot.docs){
              ItemModel mddl = ItemModel.fromMap(element.data());
              mdl.add(mddl);
            }
            print('Data Were Get Successfully');
    }

        catch(e){
      print('The error in getMyItems in AdminDatabaseImpl is $e');
        }
        return mdl;

  }

  @override
  Future<String> deleteItem(ItemModel itemModel) async {
    String message = '';
   try{
        _db.collection('items').doc(itemModel.itemID).delete();
        message = 'Success';
        print('Item is deleted AdminDatabaseImpl is');
   }

       catch(e){
     print('The problem in deleteItem in AdminDatabaseImpl is $e');
     message = 'Problem is $e';
       }

       return message;
  }

  @override
  Future<String> updateItem(ItemModel itemModel) async {
    String message = '';

    try{

      await _db.collection('items').doc(itemModel.itemID).update(itemModel.toMap());
      print('Item has been Added');
      message = 'Success';

    }
    catch(e){
      print('the error in updateItem in AdminDatabaseImpl  //////!!!!! is $e');
      message = 'the error in insertNewItem in AdminDatabaseImpl $e';
    }

    return message;
  }



  @override
  Future<List<ClientOrderModel>> getAllOrders() async {
    List<ClientOrderModel> mdl = [];
    try{
      final snapshot = await _db.collection('Orders').where('status', isEqualTo: 0).get();
      print(snapshot.docs);
      for(var element in snapshot.docs){
        ClientOrderModel mddl = ClientOrderModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('Data Were Get Successfully');
    }

    catch(e){
      print('The error in getAllOrders in AdminDatabaseImpl is $e');
    }
    return mdl;
  }


  @override
  Future<List<ClientOrderModel>> getOnTheWayOrder() async  {
    List<ClientOrderModel> mdl = [];
    try{
      final snapshot = await _db.collection('Orders').where('status', isEqualTo: 1).get();
      print(snapshot.docs);
      for(var element in snapshot.docs){
        ClientOrderModel mddl = ClientOrderModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('Data Were Get Successfully');
    }

    catch(e){
      print('The error in getOnTheWayOrder in AdminDatabaseImpl is $e');
    }
    return mdl;
  }




  @override
  Future<List<ClientOrderModel>> getRejectedOrder() async {
    List<ClientOrderModel> mdl = [];
    try{
      final snapshot = await _db.collection('Orders').where('status', isEqualTo: 2).get();
      print(snapshot.docs);
      for(var element in snapshot.docs){
        ClientOrderModel mddl = ClientOrderModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('Data Were Get Successfully');
    }

    catch(e){
      print('The error in getRejectedOrder in AdminDatabaseImpl is $e');
    }
    return mdl;
  }


  @override
  Future<List<ClientOrderModel>> getDeliveredOrders() async {
    List<ClientOrderModel> mdl = [];
    try{
      final snapshot = await _db.collection('Orders').where('status', isEqualTo: 3).get();
      print(snapshot.docs);
      for(var element in snapshot.docs){
        ClientOrderModel mddl = ClientOrderModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('Data Were Get Successfully');
    }

    catch(e){
      print('The error in getRejectedOrder in AdminDatabaseImpl is $e');
    }
    return mdl;
  }

  @override
  Future<String> updateOrder(ClientOrderModel model) async {
    String message = '';

    try{

      await _db.collection('Orders').doc(model.orderId).update({
        "status":model.status,
        "assignTo":model.assignTo,
        "long":model.long,
        "lat":model.lat,

      });
      print('Item has been Added');
      message = 'Success';

    }
    catch(e){
      print('the error in updateOrder in AdminDatabaseImpl  //////!!!!! is $e');
      message = 'the error in updateOrder in AdminDatabaseImpl $e';
    }

    return message;
  }




  @override
  Future<UserModel?> getUser(String uid)async {

    print("getUser");
    try{
      print("try");
      final snapshot = await _db.collection('users').doc(uid).get();
      print("snapshot : ${snapshot.id}");
      print("snapshot : ${snapshot.data().toString()}");
      UserModel mdl = UserModel.fromMap(snapshot.data()!);
      print("mdl : ${mdl.uid}");
      return mdl;
    }

    catch(e){
      print('The Error in get User is @@@@@@@ $e');
    }
    print("aFTER");
    return null;

  }

  @override
  Future<List<UserModel>> getAllDeliveryBoys() async {
    List<UserModel> mdl = [];
    try{
      final snapshot = await _db.collection('users').where('role', isEqualTo: 'delivery').get();
      print(snapshot.docs);
      for(var element in snapshot.docs){
        UserModel mddl = UserModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('Data Were Get Successfully');
    }

    catch(e){
      print('The error in getRejectedOrder in AdminDatabaseImpl is $e');
    }
    return mdl;
  }




}
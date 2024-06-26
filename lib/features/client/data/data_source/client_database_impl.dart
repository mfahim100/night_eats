import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:night_eats/features/client/domain/entities/cart_model.dart';
import 'package:night_eats/features/client/domain/entities/client_order_model.dart';
import '../../../admin/main_admin/domain/entities/item_model.dart';
import 'client_database_main.dart';

class ClientDatabaseImpl implements ClientDatabaseMain{


  final _db = FirebaseFirestore.instance;

  @override
  Future<String> addClientNewOrder(ClientOrderModel clientOrderModel) async {
    String message = '';

    try{

      await _db.collection('Orders').doc(clientOrderModel.orderId).set(clientOrderModel.toMap());
      print('Orders has been Added');
      message = 'Success';

    }
    catch(e){
      print('the error in Orders in ClientDatabaseImpl  //////!!!!! is $e');
      message = 'the error in Orders in ClientDatabaseImpl $e';
    }

    return message;
  }



  @override
  Future<List<ClientOrderModel>> clientGetAllOrders() async {
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
      print('The error in clientGetAllOrders in AdminDatabaseImpl is $e');
    }
    return mdl;
  }


  @override
  Future<List<ClientOrderModel>> clientGetOnTheWayOrder() async  {
    List<ClientOrderModel> mdl = [];
    String uid = FirebaseAuth.instance.currentUser!.uid;
    try{
      final snapshot = await _db.collection('Orders').where('status', isEqualTo: 1).where('uid', isEqualTo: uid).get();
      print(snapshot.docs);
      print('/////////////////////////////@@@@@@@@@@@@@@');

      for(var element in snapshot.docs){
        ClientOrderModel mddl = ClientOrderModel.fromMap(element.data());
        mdl.add(mddl);
        print('Data Were Get MotherPucking !@#(&*%%*%&*%( in the loop');
      }
      print('Data Were Get Successfully');
      print('Data Were Get MotherPucking !@#(&*%%*%&*%(');
    }

    catch(e){
      print('The error in clientGetOnTheWayOrder in ClientDatabaseImpl is $e');
    }
    return mdl;
  }




  @override
  Future<List<ClientOrderModel>> clientGetRejectedOrder() async {
    List<ClientOrderModel> mdl = [];
    String uid = FirebaseAuth.instance.currentUser!.uid;

    try{
      final snapshot = await _db.collection('Orders').where('status', isEqualTo: 2).where('uid', isEqualTo: uid).get();
      print(snapshot.docs);
      for(var element in snapshot.docs){
        ClientOrderModel mddl = ClientOrderModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('Data Were Get Successfully');
    }

    catch(e){
      print('The error in clientGetRejectedOrder in AdminDatabaseImpl is $e');
    }
    return mdl;
  }


  @override
  Future<List<ClientOrderModel>> clientGetDeliveredOrders() async {
    List<ClientOrderModel> mdl = [];
    String uid = FirebaseAuth.instance.currentUser!.uid;
    try{
      final snapshot = await _db.collection('Orders').where('status', isEqualTo: 3).where('uid', isEqualTo: uid).get();
      print(snapshot.docs);
      for(var element in snapshot.docs){
        ClientOrderModel mddl = ClientOrderModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('Data Were Get Successfully');
    }

    catch(e){
      print('The error in clientGetDeliveredOrders in AdminDatabaseImpl is $e');
    }
    return mdl;
  }



  @override
  Future<List<ItemModel>> clientGetMyItem(String uid) async {
    List<ItemModel> mdl = [];
    try{
      final snapshot = await _db.collection('items').get();
      print(snapshot.docs);
      print('///////////////////////////////////////////////////////////////><><><><><><><><><>< clientGetMyItem');
      for(var element in snapshot.docs){
        ItemModel mddl = ItemModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('Data Were Get Successfully clientGetMyItem');
    }

    catch(e){
      print('The error in getMyItems in clientGetMyItem is $e');
    }
    return mdl;

  }

  @override
  Future<String> addToCart(CartModel cartModel) async {
    String message = '';
    String uid = FirebaseAuth.instance.currentUser!.uid;

    try{
      await _db.collection('users').doc(uid).collection('Cart').doc(cartModel.itemID).set(cartModel.toMap());
      print('Orders has been Added yo cart');
      message = 'Success';

    }
    catch(e){
      print('the error in Orders in addToCart  //////!!!!! is $e');
      message = 'the error in Orders in addToCart $e';
    }

    return message;
  }

  @override
  Future<List<CartModel>> clientGetAllCartData()async  {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    List<CartModel> mdl = [];
    try{
      final snapshot = await _db.collection('users').doc(uid).collection('Cart').get();
      print(snapshot.docs);
      for(var element in snapshot.docs){
        CartModel mddl = CartModel.fromMap(element.data());
        mdl.add(mddl);
      }
      print('Data Were Get Successfully getAllCartData');
    }

    catch(e){
      print('The error in clientGetAllCartData in AdminDatabaseImpl is $e');
    }
    return mdl;
  }

  @override
  Future<String> deleteCartData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    String message = '';

    try{
      final snapshot = await _db.collection('users').doc(uid).collection('Cart').get();
      print(snapshot.docs);
      for(var element in snapshot.docs) {
        await _db.collection('users').doc(uid).collection('Cart').doc(element.id).delete();
      }
      print('Orders has been Deleted from cart');
      message = 'Success';

    }
    catch(e){
      print('the error in deleteCartData in ClientdatabaseIMPL  //////!!!!! is $e');
      message = 'the error in Orders in addToCart $e';
    }

    return message;
  }

  @override
  Future<String> deleteCurrentItem(CartModel cartModel)async {

    String message = '';
    String uid = FirebaseAuth.instance.currentUser!.uid;

    try{
      await _db.collection('users').doc(uid).collection('Cart').doc(cartModel.itemID).delete();
      print('Orders has been Added yo cart');
      message = 'Success';

    }
    catch(e){
      print('the error in Orders in addToCart  //////!!!!! is $e');
      message = 'the error in Orders in addToCart $e';
    }

    return message;

  }








}
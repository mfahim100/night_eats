
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:night_eats/features/delivery/data/data_source/delivery_database_main.dart';

import '../../../client/domain/entities/client_order_model.dart';

class DeliveryDatabaseImpl implements DeliveryDatabaseMain{


  final _db = FirebaseFirestore.instance;

  @override
  Future<List<ClientOrderModel>> deliveryGetAllOrders() async {
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
  Future<List<ClientOrderModel>> deliveryGetOnTheWayOrder() async  {
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
      print('The error in getOnTheWayOrder in DeliveryDatabaseImpl is $e');
    }
    return mdl;
  }




  @override
  Future<List<ClientOrderModel>> deliveryGetRejectedOrder() async {
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
  Future<List<ClientOrderModel>> deliveryGetDeliveredOrders() async {
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

}
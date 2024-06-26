import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';




class NotificationServices {

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  void requestPermissionNotification() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User Granted Permission');
      }
    }
    else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User Granted Provisional Permission');
      }
    }
    else {
      if (kDebugMode) {
        print('User denied');
      }
    }
  }


  void initLocalNotification(BuildContext context,
      RemoteMessage message) async {
    var androidInitializationSettings = const AndroidInitializationSettings(
        '@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (payload) {
          handlePages(context, message);
        }
    );
  }


  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
        Random.secure().nextInt(1000000).toString(),
        'High Important Notification',
        importance: Importance.max
    );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      androidNotificationChannel.id.toString(),
      androidNotificationChannel.name.toString(),
      channelDescription: 'Channel  Description',
      playSound: true,
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails
    );

    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(
          1,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails
      );
    }
    );
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print('This is Message Data${message.data.toString()}');
      }
      initLocalNotification(context, message);
      showNotification(message);
    });
  }

  Future<String?> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token;
  }


  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      if (kDebugMode) {
        print('$event refresh');
      }
    });
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    RemoteMessage? initializeMessage = await FirebaseMessaging.instance
        .getInitialMessage();

    if (initializeMessage != null) {
      handlePages(context, initializeMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handlePages(context, event);
    });
  }



  void handlePages(BuildContext context, RemoteMessage message) {
    if (message.data['type'] == 'newSignal') {
      ///Route any type of page

    }


  }








  void sendNotification(String tokenId, title, body) async {
    var data = {
      'to': tokenId,
      'priority': 'high',
      'notification': {
        'title': title,
        'body': body,
      },
      'data': {
        'type': 'airDrop',
        'id': '12345'
      }
    };
    await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
          'Authorization': 'key = AAAAJcSPBnE:APA91bHGkgzRnHHzEEgg8fHHIC6b0B8Hwbz9gTXaRKYuCxDrRgWyvyPveAOdVawV0vyjWIPCKgjk5o_ICpEAUTpFORW2ArkmH6BcWMe_jT2N19W7QLHQ5pJn2odLCM37JXu_QraVgRiX'
        }

    );
  }


  //
  // void sendAirDropNotification(String title, body, List<String> userToken) async {
  //   for (var i in userToken) {
  //     var data = {
  //       'to': i,
  //       'priority': 'high',
  //       'notification': {
  //         'title': title,
  //         'body': body,
  //       },
  //       'data': {
  //         'type': 'airDrop',
  //         'id': '12345'
  //       }
  //     };
  //     await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //         body: jsonEncode(data),
  //         headers: {
  //           'Content-Type': 'application/json ; charset=UTF-8',
  //           'Authorization': 'key = AAAAJcSPBnE:APA91bHGkgzRnHHzEEgg8fHHIC6b0B8Hwbz9gTXaRKYuCxDrRgWyvyPveAOdVawV0vyjWIPCKgjk5o_ICpEAUTpFORW2ArkmH6BcWMe_jT2N19W7QLHQ5pJn2odLCM37JXu_QraVgRiX'
  //         }
  //
  //     );
  //   }
  // }







  void sendUserApproveNotification(String title, body,userToken) async {
    var data = {
      'to': userToken,
      'priority': 'high',
      'notification': {
        'title': title,
        'body': body,
      },
      'data': {
        'type': 'approveUser',
        'id': '12345'
      }
    };
    await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json ; charset=UTF-8',
          'Authorization': 'key = AAAAJcSPBnE:APA91bHGkgzRnHHzEEgg8fHHIC6b0B8Hwbz9gTXaRKYuCxDrRgWyvyPveAOdVawV0vyjWIPCKgjk5o_ICpEAUTpFORW2ArkmH6BcWMe_jT2N19W7QLHQ5pJn2odLCM37JXu_QraVgRiX'
        }

    );
  }






}
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:grocery/data/models/notification_request.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class FirebaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final String url = "https://fcm.googleapis.com/fcm/send";
  FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();
  final onNotifications = BehaviorSubject<String?>();

  Future<void> saveToken(String gmail) async {
    try {
      final fcmToken = await _firebaseMessaging.getToken();

      await _firebaseFirestore
          .collection('Users')
          .doc(gmail)
          .set({'token': fcmToken});
    } catch (e) {
      log('save token error: $e');
    }
  }

  Future<String?> getFCMToken(String gmail) async {
    try {
      DocumentSnapshot doc =
          await _firebaseFirestore.collection('Users').doc(gmail).get();
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      String fcmToken = data['token'];

      return fcmToken;
    } catch (e) {
      log('getFCMToken error: $e');
      return null;
    }
  }

  Future init({bool initScheduled = false}) async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();

    const settings = InitializationSettings(
      android: android,
      iOS: ios,
    );

    await notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) async {
        onNotifications.add(details.payload);
      },
    );
  }

  Future<void> registerNotification() async {
    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    await init();

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channed id',
      'channel name',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      // TODO: handle the received notifications
      // For handling the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        String title = message.data['title'];
        String content = message.data['content'];

        await notifications.show(
          message.data.hashCode,
          title,
          content,
          platformChannelSpecifics,
        );
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future<void> sendNotification(NotificationRequest notificationRequest) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAA9Nu0_EI:APA91bHonA-BSkaYkOW2AEOaSb_MN7ye74TEhqovf-l5c8q1JZCFgaE9Hc6lFS1pkfPLOmymxCUzgYUVfJ1U5ThuLvl_s5BQuQF5bCCoK3bqwWwsHMnioV0LjN9u_BYYWtEW9Qe8UZn7',
      };
      final response = await http.post(
        Uri.parse(url),
        body: notificationRequest.toJson(),
        headers: headers,
      );
      log('response from send notification: $response');
    } catch (e) {
      log('send notification error: $e');
    }
  }
}

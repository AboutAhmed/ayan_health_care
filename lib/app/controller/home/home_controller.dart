import 'dart:async';

import 'package:ayan_healthcare/app/models/doctot_list_model.dart';
import 'package:ayan_healthcare/app/models/login_model.dart' as login_model;
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/server/fetch_api.dart';
import 'package:ayan_healthcare/app/ui/widgets/dialogs/loading_spinner.dart';
import 'package:ayan_healthcare/assets/styles/strings/app_constants.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:ayan_healthcare/helper/preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var searchController = TextEditingController();
  var showSuffix = false.obs;
  final RxInt unreadChats = RxInt(0);
  late StreamSubscription streamSubscription;
  final Map<String, StreamSubscription> roomSubscriptions = {};
  final Set<String> roomsWithUnseenMessages = {};
  User? firebaseUser = FirebaseAuth.instance.currentUser;
  var doctorListModel = DoctotListModel().obs; // Correct model type

  // Variables to hold user details
  login_model.User? appUser;
  String username = '';
  String name = '';
  String phone = '';
  String email = '';
  String mrNo = '';

  @override
  void onInit() {
    super.onInit();
    fetchDoctorsList();
    // Fetch user details from preferences
    fetchUserDetails();
    // Initialize Firebase Messaging
    _initializeFirebaseMessaging();
  }

  @override
  void onClose() {
    searchController.dispose();
    streamSubscription.cancel(); // Cancel the stream subscription
    super.onClose();
  }

  Future<void> fetchDoctorsList() async {
    try {
      Map<String, dynamic> params = {
        "MasterUsername":
            "DM20210915052434" // Pass required parameters if needed
      };
      var response = await ApiFetch.doctorsList(params);
      if (response != null) {
        doctorListModel.value = response; // Update observable model
      }
    } catch (e) {
      Debug.log("Error fetching doctors list: $e");
    }
  }

  void fetchUserDetails() {
    final preferences = Get.find<Preferences>();
    username = preferences.getString(Keys.username) ?? '';
    name = preferences.getString(Keys.name) ?? '';
    phone = preferences.getString(Keys.phone) ?? '';
    email = preferences.getString(Keys.email) ?? '';
    mrNo = preferences.getString(Keys.mrNo) ?? '';
  }

  void onClear() {
    searchController.clear();
  }

  void onSearch() {
    Debug.log("Searching for: ${searchController.text}");
    searchController.addListener(() {
      showSuffix.value = searchController.text.isNotEmpty;
    });
  }

  Future<void> initializeRoom() async {
    // Initialize any necessary services or data for the room
    // This could include fetching initial messages, user data, etc.
    Debug.log("Room initialized for user: $username");
  }

  Future<void> createRoom(String doctorUserName) async {
    // Show loading spinner while the room is being created
    Get.dialog(
      const LoadingSpinner(),
      barrierDismissible: true,
    );

    // Initialize the room
    await initializeRoom();

    // Create a new chat room
    // final room = await FirebaseChatCore.instance.createRoom({
    //   'id': doctorUsername,
    // });

    // Listen for changes in the rooms
    streamSubscription =
        FirebaseChatCore.instance.rooms().listen((rooms) async {
      String? userID = FirebaseAuth.instance.currentUser?.uid;

      if (userID != null) {
        for (var room in rooms) {
          // Cancel previous subscription if exists
          roomSubscriptions[room.id]?.cancel();

          // Subscribe to message updates for the room
          roomSubscriptions[room.id] = FirebaseFirestore.instance
              .collection('rooms')
              .doc(room.id)
              .collection('messages')
              .snapshots()
              .listen((messagesSnapshot) {
            // Check for unseen messages
            bool hasUnseenMessages = messagesSnapshot.docs.any((doc) {
              var data = doc.data();
              var status = data['status'];
              return status != 'seen' && data['senderId'] != userID;
            });

            // Update the list of rooms with unseen messages
            if (hasUnseenMessages) {
              roomsWithUnseenMessages.add(room.id);
            } else {
              roomsWithUnseenMessages.remove(room.id);
            }

            // Update the count of unread chats
            unreadChats.value = roomsWithUnseenMessages.length;
          });
        }
      }
      Debug.log("Unread::: ${unreadChats.value}");
    });

    // Fetch user details from preferences
    String userName = Get.find<Preferences>().getString(Keys.username)!;
    String? imagePath = Get.find<Preferences>().getString(Keys.image);

    // Get custom Firebase Auth token
    // String? token = await ApiFetch.getCustomFirebaseAuthToken("&username=$userName");

    // if (token == null || token.isEmpty) {
    //   Toaster.showToast("Unable to get token, try again");
    //   return;
    // }

    // Get FCM token for push notifications
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    Debug.log("FCM::: $fcmToken");

    // Sign in with the custom token
    // final userCredential = await FirebaseAuth.instance.signInWithCustomToken(token);
    // final user = FirebaseChatCore.instance
    //     .getFirebaseFirestore()
    //     .collection('users')
    //     .doc(userCredential.user!.uid);

    // Check if the user exists in Firestore
    // if (!(await user.get()).exists) {
    //   // Create a new user in Firestore
    //   await FirebaseChatCore.instance.createUser InFirestore({
    //     'firstName': userName,
    //     'id': userCredential.user!.uid,
    //     'imageUrl': imagePath,
    //     'role': 'user',
    //     'metadata': {
    //       Keys.token: fcmToken,
    //     },
    //   });
    // } else {
    //   // Update existing user information
    //   await user.update({
    //     'firstName': userName,
    //     'updatedAt': DateTime.now(),
    //     'token': fcmToken,
    //     'imageUrl': imagePath,
    //     'metadata': {
    //       Keys.token: fcmToken,
    //     },
    //   });
    // }

    // Close the loading dialog
    Get.back();

    // Navigate to the chat room
    Get.toNamed(
      AppRoutes.chatRoom,
      // arguments: room,
    );
  }

  void _initializeFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground messages
      Debug.log("Message received: ${message.notification?.title}");
      // Show a notification or update the UI as needed
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle when the app is opened from a notification
      Debug.log("Message clicked! ${message.data}");
    });
  }
}

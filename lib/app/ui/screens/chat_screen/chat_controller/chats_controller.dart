import 'package:ayan_healthcare/app/controller/home/home_controller.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:ayan_healthcare/helper/crypto_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';

class ChatsController extends GetxController {
  final RxList<types.Room> rooms = <types.Room>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await initializeChats();
  }

  Future<void> initializeChats() async {
    isLoading.value = true;
    try {
      await Get.find<HomeController>().initializeRoom();
      Debug.log("Chats::: ${Get.find<HomeController>().unreadChats}");
      await fetchRooms();
    } catch (e) {
      Debug.log('Error initializing chats: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchRooms() async {
    try {
      var roomSnapshot =
          await FirebaseFirestore.instance.collection('rooms').get();

      rooms.value = roomSnapshot.docs
          .map((doc) => types.Room.fromJson(doc.data()))
          .toList();
    } catch (e) {
      Debug.log('Error fetching rooms: $e');
    }
  }

  void handlePressed(types.Room room) async {
    Get.toNamed(
      AppRoutes.chatRoom,
      arguments: room,
    );
  }

  Future<String?> getMessage(types.Room room) async {
    try {
      var messageSnapshot = await FirebaseFirestore.instance
          .collection('rooms')
          .doc(room.id)
          .collection('messages')
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();

      if (messageSnapshot.docs.isNotEmpty) {
        var messageData = messageSnapshot.docs.first.data();

        if (messageData['type'] == 'image') {
          return "Photo";
        } else if (messageData['type'] == 'text') {
          var decrypted = CryptoHelper.decryption(messageData['text']);
          return decrypted.isEmpty ? messageData['text'] : decrypted;
        }
      }
    } catch (e) {
      Debug.log('Error getting message: $e');
    }

    return null;
  }
}

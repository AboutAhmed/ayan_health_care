import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../assets/styles/my_colors.dart';
import '../../../../../helper/crypto_helper.dart';
import '../../../widgets/dialogs/loading_progress.dart';
import '../../../widgets/images_widgets/image_picker_bottom_sheet.dart';
import '../chat_controller/chat_room_controller.dart';
import '../widget/chat_screen_app_bar_widget.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatRoomController());
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        // backgroundColor: const Color(0xffF5F5F5),
        appBar: const ChatAppBar(),
        body: StreamBuilder<List<types.Message>>(
          stream: FirebaseChatCore.instance.messages(controller.room),
          builder: (context, snapshot) {
            final decryptedMessages = snapshot.data?.map((msg) {
              if (msg is types.TextMessage) {
                var decrypted = CryptoHelper.decryption(msg.text);
                return msg.copyWith(text: decrypted == "" ? msg.text : decrypted);
              } else {
                return msg;
              }
            }).toList();
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingProgress();
            }
            return Obx(() {
              return Chat(

                customDateHeaderText: controller.formatTime,
                isAttachmentUploading: controller.isAttachmentUploading.value,
                messages: decryptedMessages ?? [],
                onAttachmentPressed: () {
                  Get.bottomSheet(
                    ImagePickerBottomSheet(
                      onCameraTap: () async {
                        Get.back();
                        controller.onImageSelection(
                            imageSource: ImageSource.camera);
                      },
                      onGalleryTap: () async {
                        Get.back();
                        controller.onImageSelection();
                      },
                      isShow: false,
                    ),
                  );
                },
                theme: const DefaultChatTheme(
                  inputTextCursorColor: Colors.white,
                  primaryColor: AppColors.primaryColor,
                  sentEmojiMessageTextStyle: TextStyle(
                    fontSize: 30,
                  ),
                ),
                onMessageTap: controller.handleMessageTap,
                showUserAvatars: true,
                onPreviewDataFetched: controller.handlePreviewDataFetched,
                onSendPressed: controller.handleSendPressed,
                user: types.User(
                  id: FirebaseChatCore.instance.firebaseUser?.uid ?? '',
                ),
              );
            });
          },
        ),
      ),
    );
  }
}

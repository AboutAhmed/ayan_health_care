import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/assets/styles/my_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';
import 'package:ayan_healthcare/generated/l10n.dart'; // Import your localization file

import '../../../../../helper/crypto_helper.dart';
import '../../../widgets/dialogs/loading_progress.dart';
import '../chat_controller/chats_controller.dart';

class Chats extends StatelessWidget {
  const Chats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatsController());
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).my_chats), // Use localization
        ),
        body: StreamBuilder<List<types.Room>>(
          stream: FirebaseChatCore.instance.rooms(
            orderByUpdatedAt: true,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingProgress();
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                    "You don't have any chat"), // You can also localize this
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              itemBuilder: (context, index) {
                final room = snapshot.data![index];

                return CustomCard(
                  margin: const EdgeInsets.only(
                    bottom: 12,
                  ),
                  onPressed: () {
                    // controller.handlePressed(room);
                  },
                  child: ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: room.imageUrl ?? "",
                      width: 45,
                      imageBuilder: (_, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      placeholder: (_, __) => const CircleAvatar(
                        backgroundImage: AssetImage(MyImages.imageNotFound),
                      ),
                      errorWidget: (_, __, ___) => const CircleAvatar(
                        backgroundImage: AssetImage(MyImages.imageNotFound),
                      ),
                    ),
                    title: Text(
                      room.name ?? "",
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: FutureBuilder<String?>(
                      future: controller.getMessage(room),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text(''.trim());
                        } else if (snapshot.hasError) {
                          return Text(''.trim());
                        } else {
                          if (snapshot.data != null) {
                            return Text(
                              snapshot.data!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            );
                          } else {
                            return Text(''.trim());
                          }
                        }
                      },
                    ),
                    trailing: SizedBox(
                      width: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              DateTime.fromMillisecondsSinceEpoch(
                                room.updatedAt ??
                                    DateTime.now().millisecondsSinceEpoch,
                              ).customFormat.toString(),
                              style: Get.textTheme.bodySmall,
                            ),
                          ),
                          StreamBuilder<List<types.Message>>(
                            stream: FirebaseChatCore.instance.messages(room),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return SizedBox.fromSize();
                              }
                              String userID =
                                  FirebaseAuth.instance.currentUser!.uid;
                              int length = snapshot.data!.where((element) {
                                return element.author.id != userID &&
                                    (element.status)?.name !=
                                        types.Status.seen.name;
                              }).length;

                              if (length == 0) {
                                return const SizedBox.shrink();
                              }

                              return Container(
                                width: 25,
                                height: 25,
                                padding: const EdgeInsets.all(2),
                                margin: const EdgeInsets.only(
                                  top: 4,
                                ),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  length.toString(),
                                  style: Get.textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget? getLastMessage(types.Message? message) {
    if (message == null) return null;

    if (message.type.name == types.MessageType.text.name) {
      var decrypted =
          CryptoHelper.decryption((message as types.TextMessage).text);
      return Text(
        decrypted == "" ? message.text : decrypted,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    } else if (message.type.name == types.MessageType.image.name) {
      return const Row(
        children: [
          Icon(
            Icons.photo_rounded,
            size: 20,
          ),
          Text("Photo"),
        ],
      );
    } else if (message.type.name == types.MessageType.file.name) {
      return const Row(
        children: [
          Icon(
            Icons.attachment_rounded,
            size: 20,
          ),
          Text("Attachment"),
        ],
      );
    }
    return null;
  }
}

extension DateTimeExtension on DateTime {
  String customFormat() {
    // Define your custom date format here
    return "${this.day}/${this.month}/${this.year}";
  }
}

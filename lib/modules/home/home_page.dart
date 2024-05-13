import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/theme/styles.dart';
import 'package:mobileapp/modules/home/home_controller.dart';
import 'package:mobileapp/widgets/wrap_page.dart';

class HomePage extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return WrapPage(
        child: Column(
      children: [
        Container(
          padding: padding(all: 12),
          child: Row(
            children: [
              Spacer(),
              GestureDetector(onTap: controller.onCreateRoom, child: Icon(Icons.add)),
            ],
          ),
        ),
        Expanded(
            child: Obx(() => controller.chatRooms.value == null
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemCount: controller.chatRooms.value!.length,
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final room = controller.chatRooms.value![index];
                      return _buildChatRoom(room);
                    })))
      ],
    ));
  }

  Widget _buildChatRoom(ChatRoom room) {
    return Padding(
      padding: padding(all: 12),
      child: Row(
        children: [
          Text(room.roomId),
        ],
      ),
    );
  }
}

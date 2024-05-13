import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/component/component.dart';
import 'package:mobileapp/common/theme/styles.dart';
import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/modules/add_chat/add_chat_controller.dart';
import 'package:mobileapp/widgets/wrap_page.dart';

class AddChatPage extends GetWidget<AddChatController> {
  @override
  Widget build(BuildContext context) {
    return WrapPage(
        child: Column(
      children: [
        Container(
          padding: padding(all: 12),
          child: Row(
            children: [
              GestureDetector(onTap: Get.back, child: Icon(Icons.arrow_back)),
              Spacer(),
              GestureDetector(onTap: controller.onCreate, child: Icon(Icons.add)),
            ],
          ),
        ),
        Expanded(
            child: Obx(() => controller.otherUser.value == null
                ? Center(child: CircularProgressIndicator())
                : ValueListenableBuilder(
                    valueListenable: controller.notifier,
                    builder: (context, _, __) => ListView.separated(
                        itemCount: controller.otherUser.value!.length,
                        separatorBuilder: (context, index) => SizedBox(height: 6),
                        itemBuilder: (context, index) {
                          final account = controller.otherUser.value![index];
                          final selected = controller.selectedUser.contains(account.id);
                          return _buildUser(account, selected);
                        }),
                  )))
      ],
    ));
  }

  Widget _buildUser(Account account, bool isSelected) {
    return Row(
      children: [
        Checkbox(value: isSelected, onChanged: (value) => controller.onUpdateUserSelected(account.id)),
        SizedBox(width: 12.w),
        Expanded(child: Text(account.email ?? '', style: Component.textStyle.largeMedium))
      ],
    );
  }
}

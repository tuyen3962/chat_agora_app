import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/component/component.dart';
import 'package:mobileapp/common/theme/styles.dart';
import 'package:mobileapp/modules/signin/signin_controller.dart';
import 'package:mobileapp/utils/image_paths.dart';
import 'package:mobileapp/widgets/primary_button.dart';
import 'package:mobileapp/widgets/svg_image_custom.dart';
import 'package:mobileapp/widgets/text_field_custom.dart';
import 'package:mobileapp/widgets/wrap_page.dart';

class SignInPage extends GetWidget<SignInController> {
  @override
  Widget build(BuildContext context) {
    return WrapPage(
        child: Padding(
      padding: padding(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),
          SvgImageCustom(imagePath: ImagePaths.logo, width: 114.w, height: 114.h, fit: BoxFit.cover),
          SizedBox(height: 19.h),
          Text('로그인 정보를 입력해주세요 :)', style: Component.textStyle.largeMedium),
          Spacer(),
          TextFieldCustom(labelText: '아이디(이메일)', controller: controller.emailCtrl),
          SizedBox(height: 12.h),
          Obx(
            () => TextFieldCustom(
              labelText: '아이디(이메일)',
              controller: controller.passCtrl,
              isPassword: controller.isObscure.value,
              suffix: GestureDetector(
                  onTap: controller.onChangeObscure,
                  child: Icon(controller.isObscure.value ? Icons.remove_red_eye : Icons.energy_savings_leaf)),
            ),
          ),
          SizedBox(height: 12.h),
          Align(alignment: Alignment.centerRight, child: Text('비밀번호를 잊으셨나요?', style: Component.textStyle.largeBold)),
          SizedBox(height: 12.h),
          PrimaryButton(title: '로그인', onPressed: controller.signIn),
          SizedBox(height: 12.h),
        ],
      ),
    ));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/data/service/account_service.dart';
import 'package:uni_links/uni_links.dart';
import 'package:mobileapp/data/service/notification_service/notification_service.dart';

class MainController extends GetxController {
  final AccountService accountService;
  final NotificationService notificationService;

  MainController({
    required this.accountService,
    required this.notificationService,
  });

  late PageController pageController;

  var doubleBackToExitPressedOnce = false;

  int value = 0;

  Rx<int> selectedIndex = Rx(0);

  late StreamSubscription _uniLinksSub;

  Future<bool> onWillPop() async {
    if (doubleBackToExitPressedOnce) {
      // onShowExitDialog();
      return false;
    }
    doubleBackToExitPressedOnce = true;
    Future.delayed(Duration(seconds: 2), () {
      doubleBackToExitPressedOnce = false;
    });
    return false;
  }

  onPageChange(int index) {
    selectedIndex.value = index;
  }

  onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  _initUniLinks() async {
    try {
      final initialLink = await getInitialLink(); // deep link nhấn khi app đang bị killed, gọi duy nhất 1 lần
      if (initialLink != null) {
        _handleDeepLinks(initialLink);
      }
      _uniLinksSub = linkStream.listen((String? link) {
        if (link != null) {
          _handleDeepLinks(link);
        }
      });
    } catch (err) {
      print("err: $err");
    }
  }

  _handleDeepLinks(String link) async {
    print("link: $link");
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);

    _initUniLinks();

    // notificationService.checkTerminatedNotification();
    notificationService.init();
    notificationService.checkTerminatedNotification(); // check noti nhấn vào khi app đang bị kill
  }

  @override
  void onClose() {
    selectedIndex.close();
    _uniLinksSub.cancel();

    super.onClose();
  }
}

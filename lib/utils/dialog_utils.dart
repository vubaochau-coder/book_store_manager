import 'package:flutter/material.dart';

import '../widgets/dialogs/dialog_loading.dart';

class DialogUtils {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static bool isShowDialog = false;
  static bool hasShowRecommendDialogUserSignup = false;

  static void showLoading() {
    if (navigatorKey.currentContext != null) {
      isShowDialog = true;
      showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (context) {
          return const DialogLoading();
        },
      ).then((value) => isShowDialog = false);
    }
  }

  static void hideLoading() {
    if (navigatorKey.currentContext != null) {
      if (isShowDialog) {
        Navigator.pop(navigatorKey.currentContext!);
        isShowDialog = false;
      }
    }
  }
}

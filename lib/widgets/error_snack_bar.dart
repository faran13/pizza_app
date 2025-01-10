import 'package:flutter/cupertino.dart';
import 'package:pizza_app/export.dart';

class ErrorSnackBar {
  static void show({
    required BuildContext context,
    required String text,
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(
            CupertinoIcons.clear_thick_circled,
            color: ColorName.white,
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              text,
              maxLines: 4,
              style: TextStyle(
                fontSize: sizes.fontRatio * 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

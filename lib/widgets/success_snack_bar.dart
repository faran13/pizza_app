import 'package:pizza_app/export.dart';

class SuccessSnackBar {
  static void show({
    required BuildContext context,
    required String text,
  }) {
    final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        backgroundColor: ColorName.secondaryColor,
        content: Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalValue(8),
            vertical: verticalValue(8),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: ColorName.secondaryColor,
          ),
          child: Center(
            child: Text(
              text,
              style: textStyles.semiBold.copyWith(
                fontSize: sizes.fontRatio * 16,
                color: ColorName.white,
                height: 0.3,
              ),
              overflow: TextOverflow.visible,
            ),
          ),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

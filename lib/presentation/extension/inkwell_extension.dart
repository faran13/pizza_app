import '../../export.dart';

extension InkWellExtension on InkWell {
  Widget inkWellRippleEffect({
    required Function onTap,
    required Widget child,
  }) {
    return InkWell(
      onTap: () => onTap() ?? () {},
      splashColor: ColorName.transparentColor,
      focusColor: ColorName.transparentColor,
      hoverColor: ColorName.transparentColor,
      highlightColor: ColorName.transparentColor,
      child: child,
    );
  }
}

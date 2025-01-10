import 'package:pizza_app/export.dart';

class ActionButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final String leadingIcon;
  final bool? isLoading;

  const ActionButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.leadingIcon,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
        vertical: verticalValue(6),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.secondaryColor),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            leadingIcon,
            width: sizes.widthRatio * 20,
            height: sizes.heightRatio * 20,
          ),
          horizontalSpacer(5),
          Text(
            label,
            style: textStyles.medium.copyWith(
              color: ColorName.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

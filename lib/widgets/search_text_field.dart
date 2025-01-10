import '../export.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField(
      {required this.focusNode,
      required this.search,
      required this.radius,
      required this.onFieldSubmitted,
      this.onChanged,
      Key? key,
      this.onTapSearch,
      this.hintText = 'Search',
      this.onTap,
      this.customBorderRadius,
      this.suffixIcon,
      this.height,
      this.contentPadding,
      this.prefixIconPadding,
      this.readOnly,
      this.boxShadow})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController search;
  final double radius;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final Function? onTapSearch;
  final Function? onTap;
  final String? hintText;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? customBorderRadius;
  final double? height;
  final bool? readOnly;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? prefixIconPadding;

  final denyEmojiRegex = RegExp(
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: ColorName.white,
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: ColorName.greyShade.withOpacity(0.2),
                offset: const Offset(0, 0),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
        borderRadius: customBorderRadius ?? BorderRadius.circular(radius),
      ),
      child: TextFormField(
        readOnly: readOnly ?? false,
        onTap: () {
          onTap?.call();
        },

        inputFormatters: [
          FilteringTextInputFormatter.deny(denyEmojiRegex),
        ],
        controller: search,
        style: textStyles.medium.copyWith(
          fontSize: sizes.fontRatio * 12,
        ),
        enabled: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIconConstraints: BoxConstraints(
            minHeight: sizes.heightRatio * 15,
            minWidth: sizes.widthRatio * 15,
          ),
          prefixIcon: const InkWell().inkWellRippleEffect(
            onTap: onTapSearch ?? () {},
            child: Container(
              padding: prefixIconPadding ??
                  EdgeInsets.symmetric(
                    horizontal: horizontalValue(16),
                  ),
              child: SvgPicture.asset(
                Assets.svg.icSearch,
                height: sizes.heightRatio * 13,
                width: sizes.widthRatio * 13,
                colorFilter: const ColorFilter.mode(
                  ColorName.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintStyle: textStyles.regular.copyWith(
            fontSize: sizes.fontRatio * 14,
            color: ColorName.greyShade,
          ),
          contentPadding: contentPadding,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,

        autovalidateMode: AutovalidateMode.onUserInteraction,
        //  validator: (value) => validation(value!),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:pizza_app/export.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      child: Row(
        children: [
          Text(
            appConstants.fastFood,
            style: textStyles.regular.copyWith(
              fontSize: sizes.fontRatio * 30,
            ),
          ),
          const Spacer(),
          const InkWell().inkWellRippleEffect(
            onTap: () {
              CartBottomSheet.show(
                context: context,
              );
            },
            child: Icon(
              CupertinoIcons.cart_fill,
              color: ColorName.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

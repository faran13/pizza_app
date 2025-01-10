import 'dart:ui';

import 'package:pizza_app/export.dart';

class CartBottomSheet {
  static void show({
    required final BuildContext context,
  }) {
    showBottomSheet(
      context: context,
      backgroundColor: ColorName.transparentColor,
      enableDrag: false,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: CartWidget(),
        );
      },
    );
  }
}

class CartWidget extends StatefulWidget {
  const CartWidget({
    super.key,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  void initState() {
    context.read<HomeBloc>().add(
          UpdateGrandTotal(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizes.height * 0.90,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: ColorName.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpacer(16),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(20),
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Spacer(),
                  Text(
                    'Your Cart',
                    textAlign: TextAlign.center,
                    style: textStyles.bold.copyWith(
                      fontSize: sizes.fontRatio * 20,
                      color: ColorName.black,
                    ),
                  ),
                  const Spacer(),
                  const InkWell().inkWellRippleEffect(
                    child: SvgPicture.asset(
                      Assets.svg.icClose,
                      width: sizes.widthRatio * 24,
                      height: sizes.heightRatio * 24,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            verticalSpacer(10),
            Container(
              width: double.infinity,
              height: 1,
              color: ColorName.black.withOpacity(0.2),
            ),
            verticalSpacer(20),
            Orders(),
            verticalSpacer(16),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              return state.cart.isEmpty
                  ? const SizedBox.shrink()
                  : CheckoutButton();
            }),
            verticalSpacer(16),
          ],
        ),
      ),
    );
  }
}

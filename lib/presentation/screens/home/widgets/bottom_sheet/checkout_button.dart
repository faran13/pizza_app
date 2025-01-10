import 'package:pizza_app/export.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: verticalValue(16),
        horizontal: horizontalValue(8),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
        vertical: verticalValue(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell().inkWellRippleEffect(
              onTap: () {
                SuccessSnackBar.show(
                  context: context,
                  text: appConstants.success,
                );
                context.read<HomeBloc>().add(
                      ClearCart(),
                    );
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(8),
                  vertical: verticalValue(12),
                ),
                decoration: BoxDecoration(
                  color: ColorName.black,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      appConstants.checkout,
                      style: textStyles.bold.copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: ColorName.white,
                      ),
                    ),
                    horizontalSpacer(16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

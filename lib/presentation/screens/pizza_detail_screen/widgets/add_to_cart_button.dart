import 'package:pizza_app/export.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.isDeal,
  });

  final bool isDeal;

  @override
  Widget build(BuildContext context) {
    final homeState = context.read<HomeBloc>().state;
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
                if (isDeal &&
                    homeState.selectedPizza != null &&
                    homeState.selectedPizza!.toppingCount !=
                        homeState.selectedPizza!.numberOfToppings) {
                  ErrorSnackBar.show(
                    context: context,
                    text: appConstants.error,
                  );

                  return;
                }
                context.read<HomeBloc>().add(
                      AddToCart(),
                    );
                context.read<HomeBloc>().add(
                      SetToDefault(),
                    );
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(8),
                  vertical: verticalValue(12),
                ),
                decoration: BoxDecoration(
                  color: isDeal &&
                          homeState.selectedPizza != null &&
                          homeState.selectedPizza!.toppingCount !=
                              homeState.selectedPizza!.numberOfToppings
                      ? ColorName.greyShade
                      : ColorName.black,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      appConstants.addToCard,
                      style: textStyles.bold.copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: ColorName.white,
                      ),
                    ),
                    horizontalSpacer(16),
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                      return Text(
                        state.selectedPizza!.basePrice != 0
                            ? '(\$ ${state.selectedPizza?.basePrice ?? 0})'
                            : '',
                        style: textStyles.bold.copyWith(
                          fontSize: sizes.fontRatio * 14,
                          color: ColorName.white,
                        ),
                      );
                    }),
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

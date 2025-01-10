import 'package:pizza_app/export.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Column(
        children: [
          if (state.cart.isEmpty) ...[
            Text(
              'Your Cart is empty',
              style: textStyles.bold.copyWith(
                fontSize: sizes.fontRatio * 18,
              ),
            ),
          ],
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.cart.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(20),
                  vertical: verticalValue(10),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: horizontalValue(16),
                ),
                decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: ColorName.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: sizes.widthRatio * 100,
                      height: sizes.heightRatio * 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(state.cart[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    horizontalSpacer(16),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.cart[index].name}',
                            style: textStyles.bold.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: ColorName.black,
                            ),
                          ),
                          SizedBox(
                            width: sizes.widthRatio * 140,
                            child: Wrap(
                              spacing: 8.0,
                              children: [
                                ...state.cart[index].toppings.map(
                                  (topping) => Text(
                                    topping.optionName,
                                    style: textStyles.medium.copyWith(
                                      fontSize: sizes.fontRatio * 10,
                                      color: ColorName.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          verticalSpacer(12),
                          Row(
                            children: [
                              Text(
                                '\$',
                                style: textStyles.bold.copyWith(
                                  fontSize: sizes.fontRatio * 12,
                                  color: ColorName.primaryColor,
                                ),
                              ),
                              Text(
                                '${double.parse(state.cart[index].basePrice.toString()).toStringAsFixed(2)}',
                                style: textStyles.bold.copyWith(
                                  fontSize: sizes.fontRatio * 20,
                                  color: ColorName.black,
                                ),
                              ),
                              horizontalSpacer(20),
                              Container(
                                height: sizes.heightRatio * 30,
                                decoration: BoxDecoration(
                                  color:
                                      ColorName.secondaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: BlocBuilder<HomeBloc, HomeState>(
                                  builder: (context, state) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            if ((state.selectedPizza
                                                        ?.quantity ??
                                                    0) >
                                                0) {
                                              context.read<HomeBloc>().add(
                                                    OnPizzaQuantityChange(
                                                        quantity: (state
                                                                .cart[index]
                                                                .quantity) -
                                                            1,
                                                        id: state
                                                            .cart[index].id),
                                                  );
                                            }
                                          },
                                        ),
                                        Text(
                                          '${state.cart[index].quantity}',
                                          style: textStyles.regular.copyWith(
                                            fontSize: sizes.fontRatio * 14,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            context.read<HomeBloc>().add(
                                                  OnPizzaQuantityChange(
                                                    quantity: (state.cart[index]
                                                            .quantity) +
                                                        1,
                                                    id: state.cart[index].id,
                                                  ),
                                                );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          verticalSpacer(16),
          state.cart.isEmpty ? const SizedBox.shrink() : SubTotal(),
        ],
      );
    });
  }
}

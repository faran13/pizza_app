import 'package:domain/domain/entity/export.dart';
import 'package:pizza_app/export.dart';

import 'export.dart';

class PizzaDetailScreen extends StatefulWidget {
  const PizzaDetailScreen({
    super.key,
    required this.pizza,
  });

  final Pizza pizza;

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        body: Container(
          color: ColorName.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailAppBar(image: state.selectedPizza?.image ?? ''),
              verticalSpacer(16),
              PizzaDescription(
                rating: state.selectedPizza?.rating ?? 0,
                basePrice: state.selectedPizza?.basePrice ?? 0,
                name: state.selectedPizza?.name ?? '',
                calories: state.selectedPizza?.calories ?? '',
                isDeal: state.selectedPizza?.isDeal ?? false,
              ),
              verticalSpacer(16),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    PizzaSizeSelector(
                      pizzaId: state.selectedPizza?.id ?? '',
                      isDeal: state.selectedPizza?.isDeal ?? false,
                    ),
                    verticalSpacer(16),
                    PizzaToppingsSelector(
                      toppings: state.vegetarian,
                      optionName: 'Vegetarian Toppings',
                      onToppingSelected: (topping) {
                        context.read<HomeBloc>().add(
                              OnVegetarianToppingSelected(
                                topping: topping,
                                isDeal: state.selectedPizza?.isDeal ?? false,
                                chipId: topping.id,
                              ),
                            );
                      },
                      isDeal: state.selectedPizza?.isDeal ?? false,
                      numberOfToppings:
                          state.selectedPizza?.numberOfToppings ?? 0,
                    ),
                    verticalSpacer(16),
                    PizzaToppingsSelector(
                      toppings: state.nonVegetarian,
                      optionName: 'Non-Vegetarian Toppings',
                      onToppingSelected: (topping) {
                        context.read<HomeBloc>().add(
                              OnNonVegetarianToppingSelected(
                                topping: topping,
                                isDeal: state.selectedPizza?.isDeal ?? false,
                                chipId: topping.id,
                              ),
                            );
                      },
                      isDeal: state.selectedPizza?.isDeal ?? false,
                      numberOfToppings:
                          state.selectedPizza?.numberOfToppings ?? 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddToCartButton(
          isDeal: state.selectedPizza?.isDeal ?? false,
        ),
      );
    });
  }
}

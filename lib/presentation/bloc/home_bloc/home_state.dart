part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeStatus status;
  final List<Pizza> listOfPizza;
  final List<Pizza> deals;
  final List<PizzaSizes> pizzaSizes;
  final List<Toppings> vegetarian;
  final List<Toppings> nonVegetarian;
  final Pizza? selectedPizza;
  final List<Pizza> cart;
  final String grandTotal;
  final String totalQuantity;

  const HomeState({
    this.status = HomeStatus.init,
    this.listOfPizza = const [],
    this.deals = const [],
    this.pizzaSizes = const [],
    this.nonVegetarian = const [],
    this.vegetarian = const [],
    this.selectedPizza,
    this.cart = const [],
    this.grandTotal = '',
    this.totalQuantity = '',
  });

  HomeState copyWith({
    HomeStatus? status,
    List<Pizza>? listOfPizza,
    List<Pizza>? deals,
    List<PizzaSizes>? pizzaSizes,
    List<Toppings>? vegetarian,
    List<Toppings>? nonVegetarian,
    Pizza? selectedPizza,
    List<Pizza>? cart,
    String? grandTotal,
    String? totalQuantity,
  }) {
    return HomeState(
      status: status ?? this.status,
      listOfPizza: listOfPizza ?? this.listOfPizza,
      deals: deals ?? this.deals,
      pizzaSizes: pizzaSizes ?? this.pizzaSizes,
      vegetarian: vegetarian ?? this.vegetarian,
      nonVegetarian: nonVegetarian ?? this.nonVegetarian,
      selectedPizza: selectedPizza ?? this.selectedPizza,
      cart: cart ?? this.cart,
      grandTotal: grandTotal ?? this.grandTotal,
      totalQuantity: totalQuantity ?? this.totalQuantity,
    );
  }

  @override
  List<Object?> get props => [
        status,
        listOfPizza,
        deals,
        pizzaSizes,
        vegetarian,
        nonVegetarian,
        selectedPizza,
        cart,
        grandTotal,
        totalQuantity,
      ];
}

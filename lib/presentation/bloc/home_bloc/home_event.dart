part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitPizzaList extends HomeEvent {}

class OnPizzaSizeSelected extends HomeEvent {
  final PizzaSizes pizzaSize;
  final String id;

  OnPizzaSizeSelected({
    required this.pizzaSize,
    required this.id,
  });
}

class OnVegetarianToppingSelected extends HomeEvent {
  final Toppings topping;
  final bool isDeal;
  final String chipId;

  OnVegetarianToppingSelected({
    required this.topping,
    required this.isDeal,
    required this.chipId,
  });
}

class OnNonVegetarianToppingSelected extends HomeEvent {
  final Toppings topping;
  final bool isDeal;
  final String chipId;

  OnNonVegetarianToppingSelected({
    required this.topping,
    required this.isDeal,
    required this.chipId,
  });
}

class AddToCart extends HomeEvent {}

class RemoveFromCart extends HomeEvent {
  final Pizza pizza;

  RemoveFromCart({
    required this.pizza,
  });
}

class OnPizzaQuantityChange extends HomeEvent {
  final int quantity;
  final String id;

  OnPizzaQuantityChange({
    required this.quantity,
    required this.id,
  });
}

class SelectedPizza extends HomeEvent {
  final Pizza pizza;
  final bool isDeal;

  SelectedPizza({
    required this.pizza,
    required this.isDeal,
  });
}

class SetToDefault extends HomeEvent {}

class UpdateGrandTotal extends HomeEvent {}

class ClearCart extends HomeEvent {}

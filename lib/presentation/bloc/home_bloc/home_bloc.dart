import 'package:domain/domain/export.dart';

import '../../../export.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeScreenUseCase homeScreenUseCase;

  HomeBloc({
    required this.homeScreenUseCase,
  }) : super(const HomeState()) {
    on<InitPizzaList>(_initPizzaList);
    on<OnPizzaSizeSelected>(_onPizzaSizeSelected);
    on<OnVegetarianToppingSelected>(_onVegetarianToppingSelected);
    on<OnNonVegetarianToppingSelected>(_onNonVegetarianToppingSelected);
    on<SetToDefault>(_setToDefault);
    on<AddToCart>(_addToCart);
    on<OnPizzaQuantityChange>(_onPizzaQuantityChange);
    on<SelectedPizza>(_selectedPizza);
    on<UpdateGrandTotal>(_updateGrandTotal);
    on<ClearCart>(_onCartPressed);
  }

  void _onCartPressed(
    ClearCart event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        selectedPizza: homeScreenUseCase.selectedPizza = null,
        cart: homeScreenUseCase.cart = [],
      ),
    );
  }

  void _updateGrandTotal(
    UpdateGrandTotal event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        grandTotal: homeScreenUseCase.grandTotal(),
        totalQuantity: homeScreenUseCase.totalQuantity(),
      ),
    );
  }

  void _selectedPizza(
    SelectedPizza event,
    Emitter<HomeState> emit,
  ) {
    homeScreenUseCase.addToCart(
      event.pizza,
      event.isDeal,
    );
    emit(
      state.copyWith(
        selectedPizza: homeScreenUseCase.selectedPizza,
        pizzaSizes: homeScreenUseCase.pizzaSizes,
      ),
    );
  }

  void _onPizzaQuantityChange(
    OnPizzaQuantityChange event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
      ),
    );
    homeScreenUseCase.onPizzaQuantityChange(
      quantity: event.quantity,
      id: event.id,
    );
    emit(
      state.copyWith(
        cart: homeScreenUseCase.cart,
        selectedPizza: homeScreenUseCase.selectedPizza,
        grandTotal: homeScreenUseCase.grandTotal(),
        totalQuantity: homeScreenUseCase.totalQuantity(),
        status: HomeStatus.init,
      ),
    );
  }

  void _addToCart(
    AddToCart event,
    Emitter<HomeState> emit,
  ) {
    homeScreenUseCase.selectedPizza = null;
    emit(
      state.copyWith(
        cart: homeScreenUseCase.cart,
      ),
    );
  }

  void _setToDefault(
    SetToDefault event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        pizzaSizes: [],
        vegetarian: [],
        nonVegetarian: [],
        status: HomeStatus.loading,
      ),
    );
    homeScreenUseCase.setToDefault();
    emit(
      state.copyWith(
        pizzaSizes: homeScreenUseCase.pizzaSizes,
        vegetarian: homeScreenUseCase.vegetarian,
        nonVegetarian: homeScreenUseCase.nonVegetarian,
        selectedPizza: null,
        status: HomeStatus.init,
      ),
    );
  }

  void _onNonVegetarianToppingSelected(
    OnNonVegetarianToppingSelected event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        nonVegetarian: [],
        status: HomeStatus.loading,
      ),
    );

    final nonVegetarian = homeScreenUseCase.onNonVegetarianToppingsSelect(
      topping: event.topping,
      isDeal: event.isDeal,
      id: state.selectedPizza!.id,
      chipId: event.chipId,
    );

    homeScreenUseCase.updateCart(
      id: state.selectedPizza!.id,
    );
    emit(
      state.copyWith(
        nonVegetarian: nonVegetarian,
        selectedPizza: homeScreenUseCase.selectedPizza,
        status: HomeStatus.init,
      ),
    );
  }

  void _onVegetarianToppingSelected(
    OnVegetarianToppingSelected event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        vegetarian: [],
        status: HomeStatus.loading,
      ),
    );

    final vegetarian = homeScreenUseCase.onVegetarianToppingsSelect(
      topping: event.topping,
      isDeal: event.isDeal,
      id: state.selectedPizza!.id,
      chipId: event.chipId,
    );
    homeScreenUseCase.updateCart(
      id: state.selectedPizza!.id,
    );
    emit(
      state.copyWith(
        vegetarian: vegetarian,
        selectedPizza: homeScreenUseCase.selectedPizza,
        cart: homeScreenUseCase.cart,
        status: HomeStatus.init,
      ),
    );
  }

  void _onPizzaSizeSelected(
    OnPizzaSizeSelected event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        pizzaSizes: [],
        status: HomeStatus.loading,
      ),
    );
    final pizzaSizes = homeScreenUseCase.onSizeSelect(
      selectedPizzaSize: event.pizzaSize,
    );

    homeScreenUseCase.updateCart(
      id: state.selectedPizza!.id,
    );
    emit(
      state.copyWith(
        pizzaSizes: pizzaSizes,
        selectedPizza: homeScreenUseCase.selectedPizza,
      ),
    );
  }

  void _initPizzaList(
    InitPizzaList event,
    Emitter<HomeState> emit,
  ) {
    homeScreenUseCase.initPizzas();
    homeScreenUseCase.initializePizzaDetails();
    homeScreenUseCase.initPizzaDeals();

    var pizza = _addImages();
    var deals = List<Pizza>.from(homeScreenUseCase.listOfPizzaDeals);
    for (var i = 0; i < deals.length; i++) {
      deals[i] = deals[i].copyWith(
        image: Assets.jpg.icDeal.path,
      );
    }
    emit(
      state.copyWith(
        listOfPizza: pizza,
        pizzaSizes: homeScreenUseCase.pizzaSizes,
        vegetarian: homeScreenUseCase.vegetarian,
        nonVegetarian: homeScreenUseCase.nonVegetarian,
        deals: deals,
      ),
    );
  }

  List<Pizza> _addImages() {
    var listOfPizza = List<Pizza>.from(
      homeScreenUseCase.listOfPizza,
    );
    final pizzaImageMap = {
      "Pakistani Hot": Assets.jpg.icPakistaniHot.path,
      "BBQ Chicken": Assets.jpg.icBbqChicken.path,
      "Margherita Pizza": Assets.jpg.icMargheritaPizza.path,
      "Beef Pizza": Assets.jpg.icBeef.path,
    };

    for (var i = 0; i < listOfPizza.length; i++) {
      final imagePath = pizzaImageMap[listOfPizza[i].name];
      listOfPizza[i] = listOfPizza[i].copyWith(
        image: imagePath ?? '',
      );
    }

    return listOfPizza;
  }
}

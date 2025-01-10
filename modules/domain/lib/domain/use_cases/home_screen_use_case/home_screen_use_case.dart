import 'dart:math';
import '../../../export.dart';

class HomeScreenUseCase {
  var listOfPizza = <Pizza>[];
  var listOfPizzaDeals = <Pizza>[];
  var pizzaSizes = <PizzaSizes>[];
  var vegetarian = <Toppings>[];
  var nonVegetarian = <Toppings>[];
  var cart = <Pizza>[];
  Pizza? selectedPizza;

  void addToCart(
    Pizza pizza,
    bool isDeal,
  ) {
    selectedPizza = pizza;
    if (isDeal) {
      var sizes = List<PizzaSizes>.from(pizzaSizes);
      for (var i = 0; i < sizes.length; i++) {
        if (sizes[i].size == pizza.size) {
          sizes[i] = sizes[i].copyWith(
            isSelected: true,
          );
        }
      }
      pizzaSizes = sizes;
    }
    var found = false;
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].id == pizza.id) {
        found = true;
        break;
      }
    }
    if (!found) {
      cart.add(pizza);
    }
  }

  String grandTotal() {
    var total = 0.0;
    for (var i = 0; i < cart.length; i++) {
      total += cart[i].basePrice;
    }
    return total.toStringAsFixed(2);
  }

  String totalQuantity() {
    var quantity = 0;
    for (var i = 0; i < cart.length; i++) {
      quantity += cart[i].quantity;
    }
    return quantity.toString();
  }

  void updateCart({required String id}) {
    var temp = List<Pizza>.from(cart);
    for (var i = 0; i < temp.length; i++) {
      if (temp[i].id == id) {
        final size = _getCurrentSize();
        final toppings = _getCurrentToppings(
          isDeal: temp[i].isDeal,
        );
        final calculatedBasePrice = calculatePizzaBasePrice(
          isDeal: temp[i].isDeal,
          price: temp[i].basePrice,
        );
        selectedPizza = selectedPizza?.copyWith(
          size: size,
          toppings: toppings,
          basePrice: calculatedBasePrice,
          toppingCount: _calculateToppingCount(
            nonVegetarian: nonVegetarian,
            vegetarian: vegetarian,
            isDeal: temp[i].isDeal,
            size: temp[i].size,
          ),
        );
        temp[i] = temp[i].copyWith(
          size: size,
          toppings: toppings,
          basePrice: calculatedBasePrice,
        );
      }
    }
    cart = temp;
  }

  void onPizzaQuantityChange({
    required int quantity,
    required String id,
  }) {
    var temp = List<Pizza>.from(cart);
    for (var i = 0; i < temp.length; i++) {
      if (temp[i].id == id) {
        if ((temp[i].quantity + quantity) - 1 == 0) {
          temp.removeAt(i);
          break;
        } else {
          if (temp[i].quantity > quantity) {
            temp[i] = temp[i].copyWith(
              quantity: quantity,
              basePrice:
                  temp[i].basePrice - (temp[i].basePrice / temp[i].quantity),
            );
          }
          if (temp[i].quantity < quantity) {
            temp[i] = temp[i].copyWith(
              quantity: quantity,
              basePrice:
                  temp[i].basePrice + (temp[i].basePrice / temp[i].quantity),
            );
          }
        }
      }
    }
    cart = temp;
  }

  double calculatePizzaBasePrice({
    required bool isDeal,
    required double price,
  }) {
    if (isDeal) {
      if (selectedPizza!.size == 'Large') {
        var temp = List<PizzaSizes>.from(pizzaSizes);
        var currentPrice = 0.0;
        var basePrice = 0.0;
        for (var i = 0; i < temp.length; i++) {
          if (temp[i].size == selectedPizza!.size) {
            currentPrice = temp[i].price;
            break;
          }
        }
        for (var i = 0; i < vegetarian.length; i++) {
          if (vegetarian[i].isSelected) {
            basePrice += vegetarian[i].price;
          }
        }
        for (var i = 0; i < nonVegetarian.length; i++) {
          if (nonVegetarian[i].isSelected &&
              (nonVegetarian[i].optionName == 'Pepperoni' ||
                  nonVegetarian[i].optionName == 'Barbecue Chicken')) {
            var price = nonVegetarian[i].price;
            basePrice += price * 2;
          } else {
            if (nonVegetarian[i].isSelected) {
              basePrice += nonVegetarian[i].price;
            }
          }
        }
        return (currentPrice + basePrice) * 0.5;
      }

      return price;
    }
    var basePrice = 0.0;
    for (var i = 0; i < pizzaSizes.length; i++) {
      if (pizzaSizes[i].isSelected) {
        basePrice += pizzaSizes[i].price;
      }
    }
    for (var i = 0; i < vegetarian.length; i++) {
      if (vegetarian[i].isSelected) {
        basePrice += vegetarian[i].price;
      }
    }
    for (var i = 0; i < nonVegetarian.length; i++) {
      if (nonVegetarian[i].isSelected) {
        basePrice += nonVegetarian[i].price;
      }
    }
    return basePrice;
  }

  List<Toppings> _getCurrentToppings({required bool isDeal}) {
    var toppings = <Toppings>[];
    if (isDeal) {}
    for (var i = 0; i < vegetarian.length; i++) {
      if (vegetarian[i].isSelected) {
        toppings.add(vegetarian[i]);
      }
    }
    for (var i = 0; i < nonVegetarian.length; i++) {
      if (nonVegetarian[i].isSelected) {
        toppings.add(nonVegetarian[i]);
      }
    }
    return toppings;
  }

  String _getCurrentSize() {
    for (var i = 0; i < pizzaSizes.length; i++) {
      if (pizzaSizes[i].isSelected) {
        return pizzaSizes[i].size;
      }
    }
    return '';
  }

  List<PizzaSizes> onSizeSelect({required PizzaSizes selectedPizzaSize}) {
    final temp = List<PizzaSizes>.from(pizzaSizes);
    final updatedPizzaSizes = temp.map((pizzaSize) {
      if (pizzaSize.size == selectedPizzaSize.size) {
        return pizzaSize.copyWith(isSelected: true);
      } else {
        return pizzaSize.copyWith(isSelected: false);
      }
    }).toList();
    return pizzaSizes = updatedPizzaSizes;
  }

  List<Toppings> onVegetarianToppingsSelect({
    required Toppings topping,
    required bool isDeal,
    required String id,
    required String chipId,
  }) {
    if (isDeal) {
      var deals = List<Pizza>.from(listOfPizzaDeals);
      Pizza? currentDeal;
      for (var i = 0; i < deals.length; i++) {
        if (deals[i].id == id) {
          currentDeal = deals[i];
          break;
        }
      }
      if (currentDeal != null) {
        final temp = List<Toppings>.from(vegetarian);
        final toppingCount = _calculateToppingCount(
          nonVegetarian: nonVegetarian,
          vegetarian: vegetarian,
          isDeal: currentDeal.isDeal,
          size: currentDeal.size,
        );
        if (currentDeal.numberOfToppings != toppingCount) {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i].optionName == topping.optionName) {
              temp[i] = temp[i].copyWith(
                isSelected: !temp[i].isSelected,
              );
            }
          }
          return vegetarian = temp;
        } else {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i].isSelected && temp[i].id == chipId) {
              temp[i] = temp[i].copyWith(isSelected: false);
            }
          }
          return vegetarian = temp;
        }
      }
    }
    final temp = List<Toppings>.from(vegetarian);
    for (var i = 0; i < temp.length; i++) {
      if (temp[i].optionName == topping.optionName) {
        temp[i] = temp[i].copyWith(
          isSelected: !temp[i].isSelected,
        );
      }
    }
    return vegetarian = temp;
  }

  List<Toppings> onNonVegetarianToppingsSelect({
    required Toppings topping,
    required bool isDeal,
    required String id,
    required String chipId,
  }) {
    if (isDeal) {
      var deals = List<Pizza>.from(listOfPizzaDeals);
      Pizza? currentDeal;
      for (var i = 0; i < deals.length; i++) {
        if (deals[i].id == id) {
          currentDeal = deals[i];
          break;
        }
      }
      if (currentDeal != null) {
        final temp = List<Toppings>.from(nonVegetarian);
        final toppingCount = _calculateToppingCount(
          nonVegetarian: nonVegetarian,
          vegetarian: vegetarian,
          isDeal: currentDeal.isDeal,
          size: currentDeal.size,
        );
        if (currentDeal.numberOfToppings != toppingCount) {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i].optionName == topping.optionName) {
              temp[i] = temp[i].copyWith(
                isSelected: !temp[i].isSelected,
              );
            }
          }
          var count = 0;
          if (currentDeal.size == 'Large') {
            for (var j = 0; j < nonVegetarian.length; j++) {
              if ((nonVegetarian[j].optionName == 'Pepperoni' ||
                      nonVegetarian[j].optionName == 'Barbecue Chicken') &&
                  nonVegetarian[j].id == chipId) {
                count = 2;
                break;
              }
            }
          }
          if (toppingCount + count > currentDeal.numberOfToppings) {
            return nonVegetarian;
          } else {
            return nonVegetarian = temp;
          }
        } else {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i].isSelected && temp[i].id == chipId) {
              temp[i] = temp[i].copyWith(isSelected: false);
            }
          }
          return nonVegetarian = temp;
        }
      }
    }
    final temp = List<Toppings>.from(nonVegetarian);
    for (var i = 0; i < temp.length; i++) {
      if (temp[i].optionName == topping.optionName) {
        temp[i] = temp[i].copyWith(
          isSelected: !temp[i].isSelected,
        );
      }
    }
    return nonVegetarian = temp;
  }

  void setToDefault() {
    pizzaSizes = [];
    vegetarian = [];
    nonVegetarian = [];
    initializePizzaDetails();
  }

  void initializePizzaDetails() {
    pizzaSizes.add(
      PizzaSizes(
        size: 'Small',
        price: 5.0,
        isSelected: false,
      ),
    );
    pizzaSizes.add(
      PizzaSizes(
        size: 'Medium',
        price: 7,
        isSelected: false,
      ),
    );
    pizzaSizes.add(
      PizzaSizes(
        size: 'Large',
        price: 8,
        isSelected: false,
      ),
    );
    pizzaSizes.add(
      PizzaSizes(
        size: 'Extra Large',
        price: 9,
        isSelected: false,
      ),
    );

    ///vegetarian toppings
    vegetarian.add(
      Toppings(
        id: generateRandomId(16),
        optionName: 'Tomatoes',
        price: 1,
        isSelected: false,
      ),
    );
    vegetarian.add(
      Toppings(
        id: generateRandomId(16),
        optionName: 'Onions',
        price: 0.50,
      ),
    );
    vegetarian.add(
      Toppings(
        id: generateRandomId(16),
        optionName: 'Bell Pepper',
        price: 1,
      ),
    );
    vegetarian.add(
      Toppings(
        id: generateRandomId(16),
        optionName: 'Mushrooms',
        price: 1.20,
      ),
    );
    vegetarian.add(
      Toppings(
        id: generateRandomId(16),
        optionName: 'Pineapple',
        price: 0.75,
      ),
    );

    ///non-vegetarian toppings
    nonVegetarian.add(
      Toppings(
        id: generateRandomId(16),
        optionName: 'Sausage',
        price: 1,
        isSelected: false,
      ),
    );
    nonVegetarian.add(
      Toppings(
        id: generateRandomId(16),
        optionName: 'Pepperoni',
        price: 2,
      ),
    );
    nonVegetarian.add(
      Toppings(
        id: generateRandomId(16),
        optionName: 'Barbecue Chicken',
        price: 3,
      ),
    );
  }

  void initPizzaDeals() {
    listOfPizzaDeals.add(
      Pizza(
        id: generateRandomId(16),
        name: '1 medium pizza with 2 toppings',
        size: 'Medium',
        basePrice: 5,
        totalSum: 0,
        numberOfToppings: 2,
        toppings: [],
        image: '',
        isLiked: false,
        calories: '270',
        rating: 3.2,
        isDeal: true,
      ),
    );
    listOfPizzaDeals.add(
      Pizza(
        id: generateRandomId(16),
        name: '2 medium pizza with 4 toppings',
        size: 'Medium',
        basePrice: 9,
        totalSum: 0,
        numberOfToppings: 4,
        toppings: [],
        image: '',
        isLiked: true,
        calories: '320',
        rating: 4.1,
        isDeal: true,
      ),
    );
    listOfPizzaDeals.add(
      Pizza(
        id: generateRandomId(16),
        name: '1 large pizza with 4 toppings (pepperoni & barbecue = 2 each)',
        size: 'Large',
        basePrice: 0,
        totalSum: 0,
        numberOfToppings: 4,
        toppings: [],
        image: '',
        isLiked: true,
        calories: '210',
        rating: 4.3,
        isDeal: true,
      ),
    );
  }

  void initPizzas() {
    listOfPizza.add(
      Pizza(
        id: generateRandomId(16),
        name: 'Pakistani Hot',
        size: '',
        basePrice: 0,
        totalSum: 0,
        toppings: [],
        image: '',
        isLiked: false,
        calories: '270',
        rating: 3.2,
      ),
    );
    listOfPizza.add(
      Pizza(
        id: generateRandomId(16),
        name: 'BBQ Chicken',
        size: '',
        basePrice: 0,
        totalSum: 0,
        toppings: [],
        image: '',
        isLiked: true,
        calories: '320',
        rating: 4.1,
      ),
    );
    listOfPizza.add(
      Pizza(
        id: generateRandomId(16),
        name: 'Margherita Pizza',
        size: '',
        basePrice: 0,
        totalSum: 0,
        toppings: [],
        image: '',
        isLiked: true,
        calories: '210',
        rating: 4.3,
      ),
    );
    listOfPizza.add(
      Pizza(
        id: generateRandomId(16),
        name: 'Beef Pizza',
        size: '',
        basePrice: 0,
        totalSum: 0,
        toppings: [],
        image: '',
        isLiked: false,
        calories: '200',
        rating: 3.2,
      ),
    );
  }

  String generateRandomId(int length) {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  int _calculateToppingCount({
    required List<Toppings> vegetarian,
    required List<Toppings> nonVegetarian,
    required bool isDeal,
    required String size,
  }) {
    if (!isDeal ||
        size == 'Medium' ||
        size == 'Small' ||
        size == 'Extra Large') {
      return _getCurrentToppings(isDeal: isDeal).length;
    }
    const toppingWeights = {
      "Pepperoni": 2,
      "Barbecue Chicken": 2,
    };

    int vegetarianCount =
        vegetarian.where((topping) => topping.isSelected).fold<int>(
              0,
              (sum, topping) => sum + 1,
            );

    int nonVegetarianCount = nonVegetarian
        .where((topping) => topping.isSelected)
        .fold<int>(0, (sum, topping) {
      int weight = toppingWeights[topping.optionName] ?? 1;
      return sum + weight;
    });

    int totalToppingCount = vegetarianCount + nonVegetarianCount;

    return totalToppingCount;
  }
}

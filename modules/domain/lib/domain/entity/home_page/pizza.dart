import '../../../export.dart';

part 'pizza.freezed.dart';

@freezed
class Pizza with _$Pizza {
  const factory Pizza({
    required String name,
    required String size,
    required double basePrice,
    required double totalSum,
    required List<Toppings> toppings,
    @Default(1) int toppingCount,
    @Default(0) numberOfToppings,
    @Default(false) isDeal,
    @Default('') String id,
    @Default(1) int quantity,
    @Default('') String image,
    @Default(false) bool isLiked,
    @Default('') String calories,
    @Default(0.0) double rating,
  }) = _Pizza;
}

import '../../../export.dart';

part 'toppings.freezed.dart';

@freezed
class Toppings with _$Toppings {
  const factory Toppings({
    required String id,
    required String optionName,
    @Default(false) bool isSelected,
    required double price,
  }) = _Toppings;
}

import '../../../export.dart';

part 'pizza_sizes.freezed.dart';

@freezed
class PizzaSizes with _$PizzaSizes {
  const factory PizzaSizes({
    required String size,
    @Default(false) bool isSelected,
    required double price,
  }) = _PizzaSizes;
}

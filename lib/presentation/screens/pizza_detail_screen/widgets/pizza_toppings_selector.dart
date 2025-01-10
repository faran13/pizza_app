import 'package:domain/domain/entity/export.dart';
import 'package:pizza_app/export.dart';

class PizzaToppingsSelector extends StatelessWidget {
  const PizzaToppingsSelector({
    super.key,
    required this.toppings,
    required this.onToppingSelected,
    required this.numberOfToppings,
    required this.isDeal,
    required this.optionName,
  });

  final int numberOfToppings;
  final bool isDeal;
  final List<Toppings> toppings;
  final Function(Toppings) onToppingSelected;
  final String optionName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(16),
            ),
            child: Text(
              optionName,
              style: textStyles.medium.copyWith(
                fontSize: sizes.fontRatio * 18,
              ),
            ),
          ),
          verticalSpacer(8),
          SizedBox(
            height: verticalValue(30),
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                left: horizontalValue(16),
              ),
              scrollDirection: Axis.horizontal,
              itemCount: toppings.length,
              separatorBuilder: (context, index) {
                return horizontalSpacer(8);
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // if (isDeal) {
                    //   final homeState = context.read<HomeBloc>().state;
                    //   for (var i = 0; i < toppings.length; i++) {
                    //     if (numberOfToppings ==
                    //             (homeState.selectedPizza!.toppingCount) &&
                    //         !toppings[index].isSelected) {
                    //       ErrorSnackBar.show(
                    //         context: context,
                    //         text: appConstants.toppingError,
                    //       );
                    //       return;
                    //     }
                    //   }
                    // }

                    onToppingSelected(toppings[index]);
                  },
                  child: Container(
                    height: sizes.widthRatio * 30,
                    width: sizes.widthRatio * 100,
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalValue(16),
                      vertical: verticalValue(8),
                    ),
                    decoration: BoxDecoration(
                      color: toppings[index].isSelected
                          ? ColorName.secondaryColor
                          : ColorName.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: toppings[index].isSelected
                            ? ColorName.secondaryColor
                            : ColorName.greyShade,
                      ),
                    ),
                    child: Text(
                      toppings[index].optionName,
                      textAlign: TextAlign.center,
                      style: textStyles.medium.copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: toppings[index].isSelected
                            ? ColorName.white
                            : ColorName.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

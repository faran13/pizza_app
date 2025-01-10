import 'package:pizza_app/export.dart';

class PizzaSizeSelector extends StatelessWidget {
  const PizzaSizeSelector({
    super.key,
    required this.pizzaId,
    required this.isDeal,
  });

  final String pizzaId;
  final bool isDeal;

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
              'Size',
              style: textStyles.medium.copyWith(
                fontSize: sizes.fontRatio * 18,
              ),
            ),
          ),
          verticalSpacer(8),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return SizedBox(
                height: verticalValue(32),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    left: horizontalValue(16),
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.pizzaSizes.length,
                  separatorBuilder: (context, index) {
                    return horizontalSpacer(8);
                  },
                  itemBuilder: (context, index) {
                    var size = state.pizzaSizes[index];
                    return InkWell(
                      onTap: () {
                        if (isDeal) {
                          ErrorSnackBar.show(
                            context: context,
                            text: appConstants.dealError,
                          );

                          return;
                        }
                        context.read<HomeBloc>().add(
                              OnPizzaSizeSelected(
                                pizzaSize: size,
                                id: pizzaId,
                              ),
                            );
                      },
                      child: Container(
                        height: sizes.widthRatio * 30,
                        width: sizes.widthRatio * 100,
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalValue(16),
                          vertical: verticalValue(8),
                        ),
                        decoration: BoxDecoration(
                          color: size.isSelected
                              ? ColorName.secondaryColor
                              : ColorName.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: size.isSelected
                                ? ColorName.secondaryColor
                                : ColorName.greyShade,
                          ),
                        ),
                        child: Text(
                          size.size,
                          textAlign: TextAlign.center,
                          style: textStyles.medium.copyWith(
                            fontSize: sizes.fontRatio * 14,
                            color: size.isSelected
                                ? ColorName.white
                                : ColorName.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

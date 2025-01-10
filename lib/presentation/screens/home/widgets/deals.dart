import 'package:pizza_app/export.dart';

class Deals extends StatelessWidget {
  const Deals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
        vertical: verticalValue(16),
      ),
      color: ColorName.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            appConstants.deals,
            style: textStyles.bold.copyWith(
              fontSize: sizes.fontRatio * 18,
            ),
          ),
          verticalSpacer(8),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemCount: state.deals.length,
                itemBuilder: (context, index) {
                  return const InkWell().inkWellRippleEffect(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const InkWell().inkWellRippleEffect(
                          onTap: () {
                            context.read<HomeBloc>().add(
                                  SelectedPizza(
                                    pizza: state.deals[index],
                                    isDeal: true,
                                  ),
                                );
                            Navigator.pushNamed(
                              context,
                              AppRoutes.pizzaDetailScreen,
                              arguments: state.listOfPizza[index],
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  state.deals[index].image,
                                  height: sizes.widthRatio * 160,
                                  width: sizes.widthRatio * 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: horizontalValue(4),
                                    vertical: verticalValue(4),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorName.white,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(8),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                state.deals[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: textStyles.medium.copyWith(
                                  fontSize: sizes.fontRatio * 14,
                                ),
                              ),
                            ),
                            horizontalSpacer(16),
                            SvgPicture.asset(
                              state.deals[index].isLiked
                                  ? Assets.svg.icHeartFilled
                                  : Assets.svg.icHeart,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

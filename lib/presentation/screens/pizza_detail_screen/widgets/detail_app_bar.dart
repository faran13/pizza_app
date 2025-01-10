import 'package:pizza_app/export.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: sizes.widthRatio * 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: sizes.heightRatio * 50,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell().inkWellRippleEffect(
                    onTap: () {
                      context.read<HomeBloc>().add(SetToDefault());
                      context.read<HomeBloc>().add(ClearCart());
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: ColorName.white,
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: ColorName.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

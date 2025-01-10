import 'package:pizza_app/export.dart';

class ReceiptDetail extends StatelessWidget {
  const ReceiptDetail({
    super.key,
    required this.heading,
    required this.price,
  });

  final String heading;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: textStyles.medium.copyWith(
            fontSize: sizes.fontRatio * 16,
            color: ColorName.black,
          ),
        ),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Text(
              price,
              style: textStyles.bold.copyWith(
                fontSize: sizes.fontRatio * 16,
                color: ColorName.black,
              ),
            );
          },
        ),
      ],
    );
  }
}

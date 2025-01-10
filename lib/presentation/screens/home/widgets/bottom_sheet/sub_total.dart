import 'package:pizza_app/export.dart';

class SubTotal extends StatelessWidget {
  const SubTotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(20),
        vertical: verticalValue(10),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              ReceiptDetail(
                heading: appConstants.quantity,
                price: state.totalQuantity,
              ),
              verticalSpacer(8),
              ReceiptDetail(
                heading: appConstants.grandTotal,
                price:
                    '\$ ${state.grandTotal.isNotEmpty ? double.parse(state.grandTotal).toStringAsFixed(2) : 0.00}',
              ),
            ],
          );
        },
      ),
    );
  }
}

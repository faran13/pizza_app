import 'package:pizza_app/export.dart';

class PizzaDescription extends StatelessWidget {
  const PizzaDescription({
    super.key,
    required this.rating,
    required this.basePrice,
    required this.name,
    required this.calories,
    required this.isDeal,
  });

  final String name;
  final double rating;
  final String calories;
  final double basePrice;
  final bool isDeal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: textStyles.bold.copyWith(
              fontSize: isDeal ? sizes.fontRatio * 24: sizes.fontRatio*30,
            ),
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                itemSize: sizes.fontRatio * 22,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(
                  horizontal: 1,
                ),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              horizontalSpacer(8),
              Text(
                '(${rating})',
                style: textStyles.medium.copyWith(
                  fontSize: sizes.fontRatio * 14,
                ),
              ),
              const Spacer(),
              Text(
                '${calories} calories',
                style: textStyles.medium.copyWith(
                  fontSize: sizes.fontRatio * 12,
                ),
              ),
            ],
          ),
          Text(
            '\$${basePrice}',
            style: textStyles.bold.copyWith(
              fontSize: sizes.fontRatio * 20,
            ),
          ),
        ],
      ),
    );
  }
}

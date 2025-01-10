import 'package:flutter/cupertino.dart';

import '../../../export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchText = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacer(60),
          HomeAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(16),
            ),
            child: Text(
              appConstants.fastDelivery,
              style: textStyles.bold.copyWith(
                fontSize: sizes.fontRatio * 40,
              ),
            ),
          ),
          verticalSpacer(16),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(16),
            ),
            child: SearchTextField(
              focusNode: focusNode,
              search: searchText,
              radius: 30,
              hintText: appConstants.search,
              onChanged: (value) {},
              onFieldSubmitted: (String value) {},
            ),
          ),
          verticalSpacer(16),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                Deals(),
                verticalSpacer(16),
                PizzaWidget(),
                verticalSpacer(16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

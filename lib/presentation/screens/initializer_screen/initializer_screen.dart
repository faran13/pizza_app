import '../../../export.dart';

class InitializerScreen extends StatefulWidget {
  const InitializerScreen({Key? key}) : super(key: key);

  @override
  State<InitializerScreen> createState() => _InitializerScreenState();
}

class _InitializerScreenState extends State<InitializerScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.homeScreen,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return Scaffold(
      backgroundColor: ColorName.primaryColor.withOpacity(0.8),
      key: _scaffoldKey,
      body: Container(
        width: double.infinity,
        color: ColorName.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: sizes.widthRatio * 40,
              width: sizes.widthRatio * 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  Assets.png.appIcon.path,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            verticalSpacer(8),
            Text(
              appConstants.tagLine,
              style: textStyles.medium.copyWith(
                fontSize: 18,
                color: ColorName.white,
              ),
            ),
            verticalSpacer(24),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: LinearProgressIndicator(
                color: ColorName.primaryColor.withOpacity(0.8),
                backgroundColor: ColorName.white,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

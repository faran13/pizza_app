import 'package:domain/domain/entity/export.dart';
import 'package:pizza_app/export.dart';
import 'package:pizza_app/presentation/screens/pizza_detail_screen/pizza_detail_screen.dart';

class AppRoutes {
  static const initializer = '/';
  static const homeScreen = '/homeScreen';
  static const pizzaDetailScreen = '/pizzaDetailScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    _currentRoute = settings.name;
    switch (settings.name) {
      case initializer:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const InitializerScreen(),
        );
      case homeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const HomeScreen(),
        );
      case pizzaDetailScreen:
        final selectedPizza = settings.arguments as Pizza;
        return MaterialPageRoute<dynamic>(
          builder: (_) => PizzaDetailScreen(
            pizza: selectedPizza,
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static bool isCurrent(String newRoute) {
    return newRoute == _currentRoute;
  }

  static String? _currentRoute;

  static String? getCurrentRouteName() => _currentRoute;

  static Future<void> setCurrent(String route) async {
    _currentRoute = route;
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}

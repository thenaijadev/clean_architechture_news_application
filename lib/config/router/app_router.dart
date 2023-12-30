import 'package:clean_news_application/config/router/routes.dart';
import 'package:clean_news_application/core/widgets/error_screen.dart';
import 'package:clean_news_application/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.landing:
        return MaterialPageRoute(
          builder: (_) => const DailyNews(),
        );

      // case Routes.registration:
      //   return MaterialPageRoute(
      //     builder: (_) => const RegistrationScreen(),
      //   );
      // case Routes.login:
      //   return MaterialPageRoute(
      //     builder: (_) => const LoginScreen(),
      //   );

      // case Routes.home:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   );

      // case Routes.soups:
      //   var data = routeSettings.arguments as List<MealItemModel>;
      //   return MaterialPageRoute(
      //     builder: (_) => SoupsScreen(mealList: data),
      //   );

      // case Routes.meats:
      //   var data = routeSettings.arguments as List<MealItemModel>;

      //   return MaterialPageRoute(
      //     builder: (_) => MeatScreen(mealList: data),
      //   );

      // case Routes.drinks:
      //   var data = routeSettings.arguments as List<MealItemModel>;

      //   return MaterialPageRoute(
      //     builder: (_) => DrinksScreen(mealList: data),
      //   );
      // case Routes.cart:
      //   return MaterialPageRoute(
      //     builder: (_) => const CartScreen(),
      //   );
      // case Routes.payment:
      //   return MaterialPageRoute(
      //     builder: (_) => const AddNewCardScreen(),
      //   );
      // case Routes.foodType:
      //   var data = routeSettings.arguments as Food;
      //   return MaterialPageRoute(
      //     builder: (_) => FoodTypeScreen(
      //       food: data,
      //     ),
      //   );
      // case Routes.verifyPhoneNo:
      //   return MaterialPageRoute(
      //     builder: (_) => const PhoneNumberScreen(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}

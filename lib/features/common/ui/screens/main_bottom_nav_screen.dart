import 'package:ecommerce/features/cart/ui/screens/cart_list_screen.dart';
import 'package:ecommerce/features/category/ui/screens/category_list_screen.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/bottom-nav-screen ';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  // final MainButtomNavController bottomNavController =
  //     Get.find<MainButtomNavController>();

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainButtomNavController>(builder: (bottomNavController) {
      return Scaffold(
        body: _screens[bottomNavController.selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: bottomNavController.selectedIndex,
          onDestinationSelected: bottomNavController.changeIndex,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.category), label: 'Catagories'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.favorite_border), label: 'Wish'),
          ],
        ),
      );
    });
  }
}

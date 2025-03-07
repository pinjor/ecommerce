import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce/features/common/ui/widgets/category_item_widget.dart';
import 'package:ecommerce/features/common/ui/widgets/product_item_widget.dart';
import 'package:ecommerce/features/home/ui/widgets/appbar_icon_button.dart';
import 'package:ecommerce/features/home/ui/widgets/home_carousle_slider.dart';
import 'package:ecommerce/features/home/ui/widgets/home_section_header.dart';
import 'package:ecommerce/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 16.0,
              ),
              ProductSearchBar(
                controller: _searchBarController,
              ),
              SizedBox(
                height: 16,
              ),
              HomeCarouselSlider(),
              SizedBox(
                height: 16,
              ),
              HomeScetionHeader(
                title: 'Category',
                onTap: () {
                  Get.find<MainButtomNavController>().moveToCategory();
                },
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getCategoryList(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              HomeScetionHeader(
                title: 'Popular',
                onTap: () {},
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              HomeScetionHeader(
                title: 'Special',
                onTap: () {},
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              HomeScetionHeader(
                title: 'New',
                onTap: () {},
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CategoryItemWidget(),
        ),
      );
    }
    return categoryList;
  }

  List<Widget> _getProductList() {
    List<Widget> productList = [];
    for (int i = 0; i < 10; i++) {
      productList.add(
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ProductItemWidget(),
        ),
      );
    }
    return productList;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(assetsPath.nav_logo_svg),
      actions: [
        AppbarIconButton(
          icon: Icons.person_2_outlined,
          onTap: () {},
        ),
        SizedBox(
          width: 6.0,
        ),
        AppbarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        SizedBox(
          width: 6.0,
        ),
        AppbarIconButton(
          icon: Icons.notifications_active_sharp,
          onTap: () {},
        ),
      ],
    );
  }
}

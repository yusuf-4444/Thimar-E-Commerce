import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:thimar_app/core/constants/assets.dart';
import 'package:thimar_app/features/home/presentation/views/home_view.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  late PersistentTabController controller;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 0);
    controller.addListener(() {
      setState(() {
        selectedIndex = controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar Demo',
      home: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: HomeView(),
            item: ItemConfig(
              icon: selectedIndex == 0
                  ? SvgPicture.asset(Assets.imagesVuesaxBoldHome)
                  : SvgPicture.asset(Assets.imagesVuesaxOutlineHome),
              title: "Home",
            ),
          ),
          // PersistentTabConfig(
          //   screen: YourSecondScreen(),
          //   item: ItemConfig(icon: Icon(Icons.message), title: "Messages"),
          // ),
          // PersistentTabConfig(
          //   screen: YourThirdScreen(),
          //   item: ItemConfig(icon: Icon(Icons.settings), title: "Settings"),
          // ),
        ],
        navBarBuilder: (navBarConfig) =>
            Style1BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}

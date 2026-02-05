import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:thimar_app/core/constants/assets.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';
import 'package:thimar_app/features/cart/presentation/views/cart_shopping_view.dart';
import 'package:thimar_app/features/categories/presentation/views/categories_view.dart';
import 'package:thimar_app/features/home/presentation/views/home_view.dart';
import 'package:thimar_app/features/my_account/presentation/views/my_account_view.dart';
import 'package:thimar_app/l10n/l10n.dart';

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
    controller = PersistentTabController(initialIndex: selectedIndex);
    controller.addListener(() {
      setState(() {
        print(controller.index);
        selectedIndex = controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: controller,
      tabs: [
        PersistentTabConfig(
          screen: HomeView(),
          item: ItemConfig(
            activeForegroundColor: AppColors.primaryColor,
            activeColorSecondary: Colors.grey[100],
            icon: selectedIndex == 0
                ? CircleAvatar(
                    radius: 17.r,
                    backgroundColor: AppColors.primaryColor,
                    child: SvgPicture.asset(Assets.imagesVuesaxBoldHome),
                  )
                : SvgPicture.asset(Assets.imagesVuesaxOutlineHome),
            title: AppLocalizations.of(context)!.home,
            textStyle: AppTextStyles.semibold12,
          ),
        ),
        PersistentTabConfig(
          screen: CategoriesView(),
          item: ItemConfig(
            activeForegroundColor: AppColors.primaryColor,

            activeColorSecondary: Colors.grey[100],

            icon: selectedIndex == 1
                ? CircleAvatar(
                    radius: 17.r,
                    backgroundColor: AppColors.primaryColor,
                    child: SvgPicture.asset(Assets.imagesVuesaxBoldProducts),
                  )
                : SvgPicture.asset(Assets.imagesVuesaxOutlineProducts),
            title: AppLocalizations.of(context)!.categories,
            textStyle: AppTextStyles.semibold12,
          ),
        ),
        PersistentTabConfig(
          screen: CartShoppingView(),
          item: ItemConfig(
            activeForegroundColor: AppColors.primaryColor,
            activeColorSecondary: Colors.grey[100],
            icon: selectedIndex == 2
                ? CircleAvatar(
                    radius: 17.r,
                    backgroundColor: AppColors.primaryColor,
                    child: SvgPicture.asset(
                      Assets.imagesVuesaxBoldShoppingCart,
                    ),
                  )
                : SvgPicture.asset(Assets.imagesVuesaxOutlineShoppingCart),
            title: AppLocalizations.of(context)!.cartShopping,
            textStyle: AppTextStyles.semibold12.copyWith(fontSize: 10.sp),
          ),
        ),
        PersistentTabConfig(
          screen: MyAccountView(),
          item: ItemConfig(
            activeForegroundColor: AppColors.primaryColor,
            activeColorSecondary: Colors.grey[100],
            icon: selectedIndex == 3
                ? CircleAvatar(
                    radius: 17.r,
                    backgroundColor: AppColors.primaryColor,
                    child: SvgPicture.asset(Assets.imagesVuesaxBoldUser),
                  )
                : SvgPicture.asset(Assets.imagesVuesaxOutlineUser),
            title: AppLocalizations.of(context)!.myAccount,
            textStyle: AppTextStyles.semibold12,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: Style2BottomNavBar(
          height: 70.h,
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
        ),
      ),
    );
  }
}

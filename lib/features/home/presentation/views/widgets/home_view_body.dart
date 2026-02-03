import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:thimar_app/core/constants/assets.dart';
import 'package:thimar_app/core/utils/app_colors.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';
import 'package:thimar_app/features/home/presentation/views/widgets/custom_carousel_item.dart';
import 'package:thimar_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:thimar_app/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:thimar_app/features/home/presentation/views/widgets/top_selling_header.dart';
import 'package:thimar_app/l10n/l10n.dart';

class HomeviewBody extends StatelessWidget {
  const HomeviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Gap(16.h),
                const CustomHomeAppBar(),
                Gap(16.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomSearchTextField(
                    hint: AppLocalizations.of(context)!.searchOn,
                  ),
                ),
                Gap(16.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      4,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: const CustomCarouselItem(),
                      ),
                    ),
                  ),
                ),
                Gap(12.h),
                const TopSellingHeader(),
                Gap(8.h),
              ],
            ),
          ),
          const ThimarItemGrideView(),
        ],
      ),
    );
  }
}

class ThimarItem extends StatelessWidget {
  const ThimarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: Colors.grey[100],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8.h,
            right: 8.w,
            child: Icon(Icons.favorite_border_outlined, color: Colors.black),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Gap(17.h),
                Spacer(),
                Center(child: Image.asset(Assets.imagesWatermelonTest)),
                Spacer(),
                ListTile(
                  title: Text(
                    "بطيخ أحمر",
                    style: AppTextStyles.semibold13.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "30 جنيه ",
                          style: AppTextStyles.semibold13.copyWith(
                            color: Color(0xffF4A91F),
                          ),
                        ),
                        TextSpan(
                          text: "/ كيلو",
                          style: AppTextStyles.regular13.copyWith(
                            color: Color.fromARGB(255, 247, 187, 75),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThimarItemGrideView extends StatelessWidget {
  const ThimarItemGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.h,
        childAspectRatio: 163.w / 214.h,
      ),
      itemCount: 10,
      itemBuilder: (builder, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: const ThimarItem(),
        );
      },
    );
  }
}

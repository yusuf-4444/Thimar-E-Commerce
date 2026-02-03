import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:thimar_app/core/constants/assets.dart';
import 'package:thimar_app/core/utils/app_text_styles.dart';
import 'package:thimar_app/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:thimar_app/l10n/l10n.dart';

class CustomCarouselItem extends StatelessWidget {
  const CustomCarouselItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32.w;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342.w / 180.h,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                right: itemWidth * .4,
                child: SvgPicture.asset(
                  Assets.imagesPageViewItem2Image,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: itemWidth * .5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(Assets.imagesFeaturedItemBackground),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.h),
                      Text(
                        AppLocalizations.of(context)!.eidOffers,
                        style: AppTextStyles.regular13.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        AppLocalizations.of(context)!.discount25,
                        style: AppTextStyles.bold19.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 11.h),
                      Spacer(),
                      FeaturedItemButton(onPressed: () {}),
                      SizedBox(height: 29.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

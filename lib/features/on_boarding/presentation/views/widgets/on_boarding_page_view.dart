import 'package:flutter/material.dart';
import 'package:thimar_app/core/constants/assets.dart';
import 'package:thimar_app/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:thimar_app/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          image: Assets.imagesPageViewItem1Image,
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
          title: Row(
            children: [
              Text(S.of(context).),
              Text("ثمار", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          subTitle:
              "اكتشف تجربة تسوق فريدة مع ثمار. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
        ),
        Container(color: Colors.green),
        Container(color: Colors.blue),
      ],
    );
  }
}

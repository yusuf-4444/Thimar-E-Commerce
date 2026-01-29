import 'package:flutter/material.dart';
import 'package:thimar_app/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.style = const TextStyle(color: Colors.white),
    this.isEnabled = true,
  });

  final String text;
  final void Function()? onTap;
  final TextStyle? style;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isEnabled ? AppColors.primaryColor : AppColors.gray400,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: isEnabled ? onTap : null,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(text, style: style),
      ),
    );
  }
}

import 'package:cleanar_base_app/core/presentation/styles/app_colors.dart';
import 'package:cleanar_base_app/core/presentation/styles/text_style.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: AppColors.secondaryColor,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 13,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: AppTextStyle.eButton,
        ),
      ),
    );
  }
}

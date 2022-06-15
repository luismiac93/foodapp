import 'package:flutter/material.dart';

import '/core/presentation/widgets/custom_elevated_button.dart';
import '/core/presentation/styles/app_colors.dart';
import '/core/presentation/styles/text_style.dart';
import '/core/presentation/widgets/custom_text_form_field.dart';
import '/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.l10n.welcome,
              style: AppTextStyle.title,
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.welcome,
              style: AppTextStyle.subtitle,
            ),
            const SizedBox(height: 64),
            // CustomTextFormField(),
            const SizedBox(height: 16),
            // CustomTextFormField(),
            const SizedBox(height: 32),
            // CustomElevatedButton(),
          ],
        ),
      ),
    );
  }
}

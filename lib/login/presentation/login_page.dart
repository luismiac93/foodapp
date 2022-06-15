import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '/core/presentation/routes/router.gr.dart';
import '/core/presentation/styles/app_colors.dart';
import '/core/presentation/widgets/custom_elevated_button.dart';
import '/core/presentation/styles/text_style.dart';
import '/core/presentation/widgets/custom_text_form_field.dart';
import '/l10n/l10n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
              context.l10n.login,
              style: AppTextStyle.subtitle,
            ),
            const SizedBox(height: 64),
            CustomTextFormField(
              hintText: context.l10n.email,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: context.l10n.password,
              onChanged: (value) {},
            ),
            const SizedBox(height: 32),
            CustomElevatedButton(
              onPress: () {},
              text: context.l10n.login,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.l10n.youDoNotHaveAnAccountYet),
                TextButton(
                  onPressed: () {
                    context.pushRoute(const RegisterRoute());
                  },
                  child: Text(
                    context.l10n.registerHere,
                    style: AppTextStyle.textButton,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

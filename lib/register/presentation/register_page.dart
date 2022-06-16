import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/home/appplication/home_provider.dart';
import '/core/domain/user.dart';
import '/core/shared/providers.dart';
import '/register/application/register_provider.dart';
import '/register/application/register_state.dart';
import '/core/presentation/routes/router.gr.dart';
import '/core/presentation/widgets/custom_elevated_button.dart';
import '/core/presentation/styles/text_style.dart';
import '/core/presentation/widgets/custom_text_form_field.dart';
import '/l10n/l10n.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    ref.listen<RegisterState>(registerNotifierProvider, (previous, next) {
      next.maybeWhen(
          orElse: () {},
          data: (user) {
            ref.read(userProvider.state).state = user;
            context.replaceRoute(const HomeRoute());
          },
          error: (error) {
            print(error);
          });
    });

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
              context.l10n.register,
              style: AppTextStyle.subtitle,
            ),
            const SizedBox(height: 64),
            CustomTextFormField(
              hintText: context.l10n.name,
              onChanged: (value) {
                ref.read(nameProvider.state).state = value;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              textInputType: TextInputType.emailAddress,
              hintText: context.l10n.email,
              onChanged: (value) {
                ref.read(emailProvider.state).state = value;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              obscureText: true,
              hintText: context.l10n.password,
              onChanged: (value) {
                ref.read(passwordProvider.state).state = value;
              },
            ),
            const SizedBox(height: 32),
            CustomElevatedButton(
              onPress: ref.watch(nameProvider.state).state.isEmpty ||
                      ref.watch(emailProvider.state).state.isEmpty ||
                      ref.watch(passwordProvider.state).state.isEmpty
                  ? null
                  : () {
                      final name = ref.read(nameProvider.state).state;
                      final email = ref.read(emailProvider.state).state;
                      final password = ref.read(passwordProvider.state).state;
                      final user =
                          User(name: name, email: email, password: password);
                      ref
                          .read(registerNotifierProvider.notifier)
                          .register(user);
                    },
              text: context.l10n.register,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.l10n.youHaveAnAccountYet),
                TextButton(
                  onPressed: () {
                    context.pushRoute(const LoginRoute());
                  },
                  child: Text(
                    context.l10n.loginHere,
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

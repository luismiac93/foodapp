import 'package:cleanar_base_app/home/appplication/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/presentation/widgets/custom_elevated_button.dart';
import '/core/presentation/styles/app_colors.dart';
import '/core/presentation/styles/text_style.dart';
import '/core/presentation/widgets/custom_text_form_field.dart';
import '/l10n/l10n.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final user = ref.watch(userProvider);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: size.width,
          child: Column(
            children: [
              Text(
                context.l10n.welcome,
                style: AppTextStyle.title,
              ),
              const SizedBox(height: 16),
              if (user != null)
                Text(
                  user.name,
                  style: AppTextStyle.subtitle,
                ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: context.l10n.city,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

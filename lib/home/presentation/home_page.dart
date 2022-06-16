import 'dart:async';

import 'package:cleanar_base_app/core/shared/providers.dart';
import 'package:cleanar_base_app/home/appplication/home_provider.dart';
import 'package:cleanar_base_app/home/presentation/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/presentation/widgets/custom_elevated_button.dart';
import '/core/presentation/styles/app_colors.dart';
import '/core/presentation/styles/text_style.dart';
import '/core/presentation/widgets/custom_text_form_field.dart';
import '/l10n/l10n.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  ///Controller to debounce
  Timer? _debounce;

  ///City change
  void _onCityChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      ref.read(characterNotifierProvider.notifier).getCharacters(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(characterNotifierProvider);
    final size = MediaQuery.of(context).size;
    final user = ref.watch(userProvider);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: size.width,
          child: SingleChildScrollView(
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
                  onChanged: _onCityChanged,
                ),
                const SizedBox(height: 16),
                state.when(
                    initial: () => const SizedBox(),
                    loading: () => const SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                    data: (characters) {
                      return ListView.builder(
                         physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: characters.length,
                        itemBuilder: (context, index) {
                          final character = characters[index];
                          return CharacterCard(character: character);
                        },
                      );
                    },
                    error: (error) => const SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

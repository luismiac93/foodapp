import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/presentation/styles/app_colors.dart';
import '/example/presentation/widgets/character_card.dart';
import '/example/shared/providers.dart';
import '/example/presentation/widgets/MyHeader.dart';

class ExamplePage extends ConsumerStatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends ConsumerState<ExamplePage> {
  @override
  void initState() {
    Future.microtask(
        () => ref.read(exampleNotifierProvider.notifier).getExample());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(exampleNotifierProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: MyHeader(),
            ),
            state.when(
                initial: () => const SliverToBoxAdapter(),
                loading: () => const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                data: (characters) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: characters.length,
                      (context, index) {
                        final character = characters[index];
                        return CharacterCard(character: character);
                      },
                    ),
                  );
                },
                error: (error) => const SliverToBoxAdapter()),
          ],
        ),
      ),
    );
  }
}

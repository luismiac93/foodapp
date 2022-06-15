import 'package:flutter/material.dart';

import '/core/presentation/styles/app_colors.dart';
import '/example/domain/character.dart';

///Character card
class CharacterCard extends StatelessWidget {
  ///Constructor
  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  ///Character
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Divider(color: AppColors.secondaryColor, thickness: 2,)),
                Text(
                  character.species,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              border: Border.all(
                color: AppColors.secondaryColor,
                width: 3,
              ),
            ),
            child: Image.network(
              character.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
    ;
  }
}

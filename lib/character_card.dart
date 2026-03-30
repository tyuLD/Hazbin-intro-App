import 'package:flutter/material.dart';

class CharacterInfo {
  const CharacterInfo({
    required this.name,
    required this.description,
    required this.imagePath,
  });

  final String name;
  final String description;
  final String imagePath;
}

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required List<CharacterInfo> characters,
  }) : _characters = characters;

  final List<CharacterInfo> _characters;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      scrollDirection: Axis.horizontal,
      itemCount: _characters.length,
      separatorBuilder: (context, index) => const SizedBox(width: 12),
      itemBuilder: (BuildContext context, int index) {
        final CharacterInfo character = _characters[index];
        return SizedBox(
          width: 250,
          child: Card(
            color: const Color(0xFF2A1616),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double imageHeight = constraints.maxHeight * 0.6;
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          character.imagePath,
                          height: imageHeight,
                          width: double.infinity,
                        ),
                      ),
                      Text(
                        character.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          character.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_music_app/Theme/theme.dart';
import 'package:my_music_app/app_setting.dart';

List<Widget> artistList(List<dynamic> artists) {
  return List.generate(
    artists.length,
    (index) => ArtistBox(artist: artists[index]),
  );
}

class ArtistBox extends StatelessWidget {
  final dynamic artist;
  const ArtistBox({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  artist.thumbnails[AppController.getQuality()].url,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              artist.name,
              style: TextStyle(
                color: ThemeClass.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

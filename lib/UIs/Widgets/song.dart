import 'package:flutter/material.dart';
import 'package:my_music_app/Theme/theme.dart';
import 'package:my_music_app/app_setting.dart';
import 'package:my_music_app/UIs/responsive.dart';
import 'dart:math';

List<Widget> songList({required List<dynamic> songs, int? length}) {
  if (length != null) {
    length = min(length, songs.length);
  } else {
    length = songs.length;
  }
  return List.generate(length, (index) => SongBar(song: songs[index]));
}

class SongBar extends StatelessWidget {
  const SongBar({super.key, required this.song});

  final dynamic song;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Responsive.getPixelForHeight(1)),
      padding: EdgeInsets.all(Responsive.getPixel(3)),
      decoration: BoxDecoration(
        color: ThemeClass.textColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Responsive.getPixel(3)),
      ),
      child: Row(
        children: [
          Container(
            width: Responsive.getPixel(14),
            height: Responsive.getPixel(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Responsive.getPixel(2)),
              image: DecorationImage(
                image: NetworkImage(
                  song
                      .thumbnails[AppSetting.getQualityForThumbnail(
                        song.thumbnails.length,
                      )]
                      .url,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: Responsive.getPixelForWidth(3)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song.name,
                  style: TextStyle(
                    color: ThemeClass.textColor,
                    fontSize: Responsive.getPixel(4),
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: Responsive.getPixel(1)),
                Text(
                  song.artist.name,
                  style: TextStyle(
                    color: ThemeClass.textColor.withOpacity(0.7),
                    fontSize: Responsive.getPixel(3),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: Responsive.getPixelForWidth(2)),
          Text(
            song.duration ?? "",
            style: TextStyle(
              color: ThemeClass.textColor.withOpacity(0.7),
              fontSize: Responsive.getPixel(3),
            ),
          ),
        ],
      ),
    );
  }
}

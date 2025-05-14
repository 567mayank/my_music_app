import 'package:flutter/material.dart';
import 'package:my_music_app/Theme/theme.dart';
import 'package:my_music_app/app_setting.dart';
import 'package:my_music_app/responsive.dart';
import 'dart:math';

Widget artistList(List<dynamic> artists, {int? length}) {
  if (length != null) {
    length = min(length, artists.length);
  } else {
    length = artists.length;
  }
  return SizedBox(
    height: Responsive.getPixelForHeight(20),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: length,
      itemBuilder: (context, index) => ArtistBox(artist: artists[index]),
    ),
  );
}

class ArtistBox extends StatelessWidget {
  final dynamic artist;
  const ArtistBox({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.getPixelForWidth(30),
      margin: EdgeInsets.symmetric(horizontal: Responsive.getPixelForWidth(3)),
      child: Column(
        children: [
          Container(
            width: Responsive.getPixelForWidth(30),
            height: Responsive.getPixelForHeight(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  artist
                      .thumbnails[AppSetting.getQualityForThumbnail(
                        artist.thumbnails.length,
                      )]
                      .url,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: Responsive.getPixelForHeight(.2)),
          Text(
            artist.name,
            style: TextStyle(
              color: ThemeClass.textColor,
              fontSize: Responsive.getPixel(5),
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

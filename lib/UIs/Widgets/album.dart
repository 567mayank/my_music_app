import 'package:flutter/material.dart';
import 'package:my_music_app/Theme/theme.dart';
import 'package:my_music_app/app_setting.dart';
import 'dart:math';
import 'package:my_music_app/UIs/responsive.dart';

List<Widget> albumList({
  required List<dynamic> albums,
  int rowCount = 1,
  int columnCount = 1,
}) {
  albums = albums.sublist(0, min(albums.length, rowCount * columnCount));
  final double margin = Responsive.getPixelUsingPercentage(
    percentage: 0.02,
    width: true,
  );
  final double sizeOfBox =
      (Responsive.getScreenWidth() -
          (margin * 2) -
          (margin * (columnCount - 1))) /
      columnCount;
  Widget sizedBoxInbetweenBoxes = SizedBox(width: margin);
  Widget sizedBoxStartOrEndBoxes = SizedBox(width: margin);
  List<Widget> rows = [];
  for (int i = 0; i < rowCount; i++) {
    List<Widget> rowChildren = [];
    rowChildren.add(sizedBoxStartOrEndBoxes);
    for (int j = 0; j < columnCount; j++) {
      int index = i * columnCount + j;
      if (index < albums.length) {
        rowChildren.add(AlbumBox(album: albums[index], sizeOfBox: sizeOfBox));
        if (j < columnCount - 1) {
          rowChildren.add(sizedBoxInbetweenBoxes);
        }
      }
    }
    rowChildren.add(sizedBoxStartOrEndBoxes);
    rows.add(
      Row(mainAxisAlignment: MainAxisAlignment.start, children: rowChildren),
    );
  }
  return rows;
}

class AlbumBox extends StatelessWidget {
  final dynamic album;
  final double sizeOfBox;

  const AlbumBox({super.key, required this.album, required this.sizeOfBox});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement onTap
      },
      child: Container(
        width: sizeOfBox,
        height: sizeOfBox,
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: sizeOfBox,
              height: sizeOfBox * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(
                    album.thumbnails[AppController.getQuality()].url,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              album.name,
              style: TextStyle(
                color: ThemeClass.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              "${album.artist.name} • ${album.year}",
              style: TextStyle(
                color: ThemeClass.textColor.withOpacity(0.7),
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

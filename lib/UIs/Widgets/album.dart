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
    percentage: 2,
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
    rows.add(SizedBox(height: margin));
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
        // height: sizeOfBox,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: sizeOfBox,
              height: sizeOfBox,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Responsive.getPixel(
                    5,
                    parentHeight: sizeOfBox,
                    parentWidth: sizeOfBox,
                  ),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    album
                        .thumbnails[AppSetting.getQualityForThumbnail(
                          album.thumbnails.length,
                        )]
                        .url,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: Responsive.getPixelUsingPercentage(
                percentage: 2,
                height: true,
                parentHeight: sizeOfBox,
                parentWidth: sizeOfBox,
              ),
            ),
            Text(
              album.name,
              style: TextStyle(
                color: ThemeClass.textColor,
                fontSize: Responsive.getPixel(
                  8,
                  parentHeight: sizeOfBox,
                  parentWidth: sizeOfBox,
                ),
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: Responsive.getPixelUsingPercentage(
                percentage: 0.1,
                height: true,
                parentHeight: sizeOfBox,
                parentWidth: sizeOfBox,
              ),
            ),
            Text(
              "${album.artist.name} • ${album.year}",
              style: TextStyle(
                color: ThemeClass.textColor.withOpacity(0.7),
                fontSize: Responsive.getPixel(
                  6,
                  parentHeight: sizeOfBox,
                  parentWidth: sizeOfBox,
                ),
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

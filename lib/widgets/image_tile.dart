import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImageTile extends StatelessWidget {
  final String imageSource;
  final int index;
  final double extent;

  const ImageTile({
    super.key,
    required this.imageSource,
    required this.index,
    required this.extent,
  });

  @override
  Widget build(BuildContext context) {
    showSnackBarMessage(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)));
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      height: extent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageSource,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.7),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Art Style ${index + 1}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        final Directory? downloadsDir =
                        await getDownloadsDirectory();
                        if (downloadsDir == null) {
                          throw Exception("failed to get download directory");
                        }
                        const String appName = "mkbhd_panels";
                        final String appDownloadsDirPath =
                            "${downloadsDir.path}/$appName";
                        final Directory appDownloadsDir =
                        await Directory(appDownloadsDirPath).create();
                        final String filename =
                            "${const Uuid().v5(Uuid.NAMESPACE_URL,
                            imageSource)}.jpg";
                        final path = "${appDownloadsDir.path}/$filename";
                        final file = File(path);
                        final res = await get(Uri.parse(imageSource));
                        file.writeAsBytes(res.bodyBytes);
                        showSnackBarMessage("File saved as ${file.path}");
                      } catch (e) {
                        showSnackBarMessage("Error : ${e.toString()}");
                      }
                    },
                    child: const Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

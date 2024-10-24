import 'package:flutter/material.dart';

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
                    "Art Style ${index+1}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: (){
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

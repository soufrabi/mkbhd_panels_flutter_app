import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mkbhd_panels/widgets/image_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return ImageTile(
            imageSource: "https://picsum.photos/seed/${index+1}/500/1000",
            index: index,
            extent: ( (index & 1) == 0 ) ? 300 : 150,
          );
        },
      ),
    );
  }
}

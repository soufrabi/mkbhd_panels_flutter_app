import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mkbhd_panels/widgets/image_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                snap: true,
                title: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                bottom: const TabBar(tabs: [
                  Tab(
                    text: "Suggested",
                  ),
                  Tab(
                    text: "Liked",
                  ),
                  Tab(
                    text: "Library",
                  ),
                ]),
              )
            ];
          },
          body: TabBarView(
            children: [
              // Tab 1
              MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return ImageTile(
                    imageSource:
                        "https://picsum.photos/seed/${index + 1}/500/1000",
                    index: index,
                    extent: ((index & 1) == 0) ? 300 : 150,
                  );
                },
              ),
              // Tab 2
              const SizedBox(),
              // Tab 3
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

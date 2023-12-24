import 'package:aniku/common/style.dart';
import 'package:aniku/widgets/costum_app_bar.dart';
import 'package:flutter/material.dart';

class CustomSliiverAppBar extends StatelessWidget {
  final double size;
  final String url;
  final String title;
  final String genres;
  final Widget body;
  const CustomSliiverAppBar(
      {super.key,
      required this.size,
      required this.url,
      required this.title,
      required this.genres,
      required this.body});

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;

    return NestedScrollView(
      headerSliverBuilder: (context, isScrolled) => [
        SliverAppBar(
          expandedHeight: size,
          flexibleSpace: CustomAppBar(
            body: Stack(
              children: [
                FlexibleSpaceBar(
                  background: Image.network(
                    url,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, error, _) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
                FlexibleSpaceBar(
                  background: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: sizes.width * 0.05,
                        vertical: sizes.height * 0.07),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: sizes.height * 0.04,
                              color: ColorApp.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            genres,
                            style: const TextStyle(color: ColorApp.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
      body: body,
    );
  }
}

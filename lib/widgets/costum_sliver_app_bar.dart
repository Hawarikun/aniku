import 'package:aniku/common/style.dart';
import 'package:aniku/core/config/routes.dart';
import 'package:aniku/core/model/anime.dart' as model;
import 'package:aniku/widgets/costum_app_bar.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final double size;
  final String url;
  final String title;
  final String genres;
  final Widget body;
  final model.Anime anime;

  const CustomSliverAppBar({
    super.key,
    required this.size,
    required this.url,
    required this.title,
    required this.genres,
    required this.body,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;

    return NestedScrollView(
      headerSliverBuilder: (context, isScrolled) => [
        SliverAppBar(
          pinned: true,
          expandedHeight: size,
          flexibleSpace: CustomAppBar(
            body: InkWell(
              onTap: () {
                AppRoutes.goRouter.pushNamed(AppRoutes.detail, extra: anime);
              },
              child: Stack(
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
                    background: Align(
                      alignment: Alignment.bottomLeft,
                      child: Stack(children: [
                        Container(
                          height: size / 1.5,
                          width: sizes.width,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(175, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(sizes.width * 0.05,
                              sizes.height * 0.12, sizes.width * 0.25, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
      body: body,
    );
  }
}

class CustomDetailSliverAppBar extends StatelessWidget {
  final double size;
  final String url;
  final Widget body;

  const CustomDetailSliverAppBar(
      {super.key, required this.size, required this.url, required this.body});

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;

    return NestedScrollView(
      headerSliverBuilder: (context, isScrolled) => [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: size,
          flexibleSpace: CustomDetailAppBar(
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
                  background: Container(
                    height: size / 1.5,
                    width: sizes.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(100, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      body: body,
    );
  }
}

import 'dart:math';

import 'package:aniku/common/style.dart';
import 'package:aniku/core/config/text_size.dart';
import 'package:aniku/features/anime_now/persentation/controller/anime_now.dart';
import 'package:aniku/features/anime_now/persentation/view/anime_now.dart';
import 'package:aniku/features/top_anime/persentation/controller/top_anime.dart';
import 'package:aniku/features/top_anime/persentation/view/top_anime_index.dart';
import 'package:aniku/widgets/costum_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final keywordProv = StateProvider.autoDispose<String>((ref) => "");
final keywordConProv = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

class HomeFragment extends ConsumerWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final keyword = ref.watch(keywordProv);
    final topAnime = ref.watch(topAnimeControllerProv(TopAnimeParams()));
    final animeNow = ref.watch(animeNowControllerProv(AnimeNowParams()));
    return Scaffold(
      body: topAnime.when(
        data: (topAnimeDatum) {
          final index = Random().nextInt(topAnimeDatum.length);
          final datum = topAnimeDatum[index];
          final genres = datum.genres!.map((genres) => genres.name).join(', ');

          return CustomSliverAppBar(
            anime: datum,
            url: datum.images?['jpg']!.largeImageUrl ?? "",
            size: size.height * 0.425,
            title: datum.title ?? "",
            genres: genres,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.05,
                        size.height * 0.025, size.width * 0.05, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Anime",
                          style: TextStyle(
                              fontSize: size.height * h1,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See all",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorApp.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.25,
                    child: topAnime.when(
                      data: (topAnimeDatum) {
                        return topAnimeDatum.isNotEmpty
                            ? MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return TopAnimeIndexCard(
                                        topAnime: topAnimeDatum[index]);
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: size.height * 0.3,
                                    );
                                  },
                                  itemCount: topAnimeDatum.length > 10
                                      ? 10
                                      : topAnimeDatum.length,
                                ),
                              )
                            : Column(
                                children: [
                                  Icon(
                                    Icons.data_object_rounded,
                                    size: size.width * 0.25,
                                  ),
                                  Text(
                                    "Tidak ada layanan dengan keyword $keyword",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                ],
                              );
                      },
                      error: (error, stackTrace) {
                        return Center(
                          child: Text(error.toString()),
                        );
                      },
                      loading: () {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const TopAnimeIndexSCard();
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: size.height * 0.3,
                            );
                          },
                          itemCount: 10,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.05,
                        size.height * 0.025, size.width * 0.05, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Season Anime",
                          style: TextStyle(
                              fontSize: size.height * h1,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See all",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorApp.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.25,
                    child: animeNow.when(
                      data: (animeNowDatum) {
                        return animeNowDatum.isNotEmpty
                            ? MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                removeBottom: true,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return AnimeNowIndexCard(
                                      animeNow: animeNowDatum[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: size.height * 0.3,
                                    );
                                  },
                                  itemCount: animeNowDatum.length > 10
                                      ? 10
                                      : animeNowDatum.length,
                                ),
                              )
                            : Column(
                                children: [
                                  Icon(
                                    Icons.data_object_rounded,
                                    size: size.width * 0.25,
                                  ),
                                  Text(
                                    "Tidak ada layanan dengan keyword $keyword",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                ],
                              );
                      },
                      error: (error, stackTrace) {
                        return Center(
                          child: Text(error.toString()),
                        );
                      },
                      loading: () {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const TopAnimeIndexSCard();
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: size.height * 0.3,
                            );
                          },
                          itemCount: 10,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

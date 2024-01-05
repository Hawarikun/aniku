import 'package:aniku/common/style.dart';
import 'package:aniku/core/config/routes.dart';
import 'package:aniku/core/model/anime.dart';
import 'package:flutter/material.dart';

class TopAnimeIndexCard extends StatelessWidget {
  const TopAnimeIndexCard({super.key, required this.topAnime});

  final Anime topAnime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.025, 0, 0),
      child: InkWell(
        onTap: () {
          AppRoutes.goRouter.pushNamed(AppRoutes.detail, extra: topAnime);
        },
        child: Container(
          width: size.width * 0.35,
          height: size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.025),
            color: ColorApp.disable,
            image: DecorationImage(
              image: NetworkImage(topAnime.images?['jpg']!.imageUrl ?? ""),
              fit: BoxFit.fill,
              onError: (ctx, error) => const Center(child: Icon(Icons.error)),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(size.width * 0.0125),
                  decoration: BoxDecoration(
                    color: ColorApp.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    topAnime.score.toString() ?? "-",
                    style: TextStyle(
                      fontSize: size.height * 0.0175,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopAnimeIndexSCard extends StatelessWidget {
  const TopAnimeIndexSCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.025, 0, 0),
      child: Container(
        width: size.width * 0.35,
        height: size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * 0.025),
          color: ColorApp.disable,
        ),
      ),
    );
  }
}

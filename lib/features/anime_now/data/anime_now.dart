import 'package:aniku/core/apis/anime_now.dart';
import 'package:aniku/core/helper/api.dart';
import 'package:aniku/core/model/anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeNowRepository {
  AnimeNowRepository(this.api);

  final AnimeNowApi api;

  Future<List<Anime>> index({String? keyword, int? limit}) async {
    return await ApiHelper().getData(
      uri: api.index(),
      builder: (data) {
        return List.generate(
          data['data'].length,
          (index) => Anime.fromJson(
            data['data'][index],
          ),
        );
      },
    );
  }
}

final animeNowRepoProv = Provider(
  (ref) {
    final api = AnimeNowApi();
    return AnimeNowRepository(
      api,
    );
  },
);

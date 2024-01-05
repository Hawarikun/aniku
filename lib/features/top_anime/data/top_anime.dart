import 'package:aniku/core/apis/top_anime.dart';
import 'package:aniku/core/helper/api.dart';
import 'package:aniku/core/model/anime.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopAnimeRepository {
  TopAnimeRepository(this.api);

  final TopAnimeApi api;

  Future<List<Anime>> index({String? keyword, int? limit}) async {
    return await ApiHelper().getData(
      uri: api.index(),
      header: ApiHelper.header(),
      builder: (data) {
        return List.generate(data["data"].length, (index) {
          return Anime.fromJson(
            data['data'][index],
          );
        });
      },
    );
  }
}

final topAnimeRepoProv = Provider((ref) {
  final api = TopAnimeApi();
  return TopAnimeRepository(
    api,
  );
});

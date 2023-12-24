import 'package:aniku/core/apis/top_anime.dart';
import 'package:aniku/core/helper/api.dart';
import 'package:aniku/features/top_anime/domain/top_anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopAnimeRepository {
  TopAnimeRepository(this.api);

  final TopAnimeApi api;

  Future<List<TopAnime>> index({String? keyword, int? limit}) async {
    return await ApiHelper().getData(
      uri: api.index(
        keyword: keyword,
        limit: limit,
      ),
      header: ApiHelper.header(),
      builder: (data) {
        // print(data["data"].length);
        // print(data['pagination']);
        return List.generate(data["data"].length, (index) {

          return TopAnime.fromJson(
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

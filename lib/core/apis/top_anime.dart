import 'package:aniku/core/helper/api.dart';

class TopAnimeApi {
  Uri index({String? keyword, int? limit}) {
    return ApiHelper.buildUri(
      endpoint: "top/anime",
    );
  }
}

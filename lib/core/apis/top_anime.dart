import 'package:aniku/core/helper/api.dart';

class TopAnimeApi {
  Uri index() {
    return ApiHelper.buildUri(
      endpoint: "top/anime",
    );
  }
}

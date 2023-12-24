import 'package:aniku/core/helper/api.dart';

class AnimeNowApi {
  Uri index() {
    return ApiHelper.buildUri(
      endpoint: "seasons/now",
    );
  }
}

import 'package:aniku/features/anime_now/data/anime_now.dart';
import 'package:aniku/features/anime_now/domain/anime_now.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeNowController
    extends StateNotifier<AsyncValue<List<Now>>> {
  AnimeNowController(this.repo, this.params)
      : super(const AsyncValue.loading()) {
    index();
  }

  final AnimeNowRepository repo;
  final AnimeNowParams params;

  Future index() async {
    state = const AsyncValue.loading();
    try {
      final response = await repo.index(
        keyword: params.keyword,
        limit: params.limit,
      );
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class AnimeNowParams extends Equatable {
  const AnimeNowParams({
    this.keyword,
    this.limit,
  });

  final String? keyword;
  final int? limit;

  @override
  List<Object?> get props => [keyword, limit];
}


final animeNowControllerProv = AutoDisposeStateNotifierProviderFamily<
    AnimeNowController, AsyncValue<List<Now>>, AnimeNowParams>((
  ref,
  params,
) {
  final repository = ref.read(animeNowRepoProv);
  return AnimeNowController(
    repository,
    params,
  );
});

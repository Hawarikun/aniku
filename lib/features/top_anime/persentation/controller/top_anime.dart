import 'package:aniku/features/top_anime/data/top_anime.dart';
import 'package:aniku/features/top_anime/domain/top_anime.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopAnimeController extends StateNotifier<AsyncValue<List<TopAnime>>> {
  TopAnimeController(this.repo, this.params)
      : super(const AsyncValue.loading()) {
    index();
  }

  final TopAnimeRepository repo;
  final TopAnimeParams params;

  Future index() async {
    state = const AsyncValue.loading();
    try {
      final response = await repo.index(
        keyword: params.keyword,
        limit: params.limit,
      );
      state = AsyncValue.data(response);
    } catch (e, s) {
      print(e);

      state = AsyncValue.error(e, s);
    }
  }
}

class TopAnimeParams extends Equatable {
  const TopAnimeParams({
    this.keyword,
    this.limit,
  });

  final String? keyword;
  final int? limit;

  @override
  List<Object?> get props => [keyword, limit];
}

final topAnimeControllerProv = AutoDisposeStateNotifierProviderFamily<
    TopAnimeController, AsyncValue<List<TopAnime>>, TopAnimeParams>((
  ref,
  params,
) {
  final repository = ref.read(topAnimeRepoProv);
  return TopAnimeController(
    repository,
    params,
  );
});

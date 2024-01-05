import 'package:aniku/core/model/anime.dart';
import 'package:aniku/features/top_anime/data/top_anime.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopAnimeController extends StateNotifier<AsyncValue<List<Anime>>> {
  TopAnimeController(this.repo, this.params)
      : super(const AsyncValue.loading()) {
    index();
  }

  final TopAnimeRepository repo;
  final TopAnimeParams params;

  Future index() async {
    print(await repo.index());
    state = const AsyncValue.loading();
    try {
      final response = await repo.index();
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class TopAnimeParams extends Equatable {
  @override
  List<Object?> get props => [];
}

final topAnimeControllerProv = AutoDisposeStateNotifierProviderFamily<
    TopAnimeController, AsyncValue<List<Anime>>, TopAnimeParams>((
  ref,
  params,
) {
  final repository = ref.read(topAnimeRepoProv);
  return TopAnimeController(
    repository,
    params,
  );
});

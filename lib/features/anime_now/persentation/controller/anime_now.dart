import 'package:aniku/core/model/anime.dart';
import 'package:aniku/features/anime_now/data/anime_now.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeNowController extends StateNotifier<AsyncValue<List<Anime>>> {
  AnimeNowController(this.repo, this.params)
      : super(const AsyncValue.loading()) {
    index();
  }

  final AnimeNowRepository repo;
  final AnimeNowParams params;

  Future index() async {
    state = const AsyncValue.loading();
    try {
      final response = await repo.index();
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class AnimeNowParams extends Equatable {
  @override
  List<Object?> get props => [];
}

final animeNowControllerProv = AutoDisposeStateNotifierProviderFamily<
    AnimeNowController, AsyncValue<List<Anime>>, AnimeNowParams>((
  ref,
  params,
) {
  final repository = ref.read(animeNowRepoProv);
  return AnimeNowController(
    repository,
    params,
  );
});

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:reels/features/reels/data/models/reels_response/reel_model.dart';
import 'package:reels/features/reels/data/repositories_impl/reels_repo.dart';

part 'get_reels_state.dart';

@injectable
class GetReelsCubitt extends Cubit<GetReelsState> {
  GetReelsCubitt(this._reelsRepo) : super(GetReelsInitial());
  final ReelsRepo _reelsRepo;
  Future<void> getReels() async {
    emit(GetReelsLoading());
    final response = await _reelsRepo.getReels();
    response.fold(
      (failure) => emit(GetReelsFailed(failure.message)),
      (reel) => emit(GetReelsSucces(reel)),
    );
  }
}

part of 'get_reels_cubit.dart';

@immutable
sealed class GetReelsState {}

final class GetReelsInitial extends GetReelsState {}
class GetReelsLoading extends GetReelsState {}
class GetReelsSucces extends GetReelsState {
  final List<ReelModel> reel;

  GetReelsSucces(this.reel);
}
class GetReelsFailed extends GetReelsState {
  final String message;

  GetReelsFailed(this.message);
}

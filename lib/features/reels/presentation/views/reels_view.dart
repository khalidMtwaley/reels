import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels_viewer/reels_viewer.dart';
import 'package:reels/core/di/service_locator.dart';
import 'package:reels/features/reels/presentation/blocs/cubit/get_reels_cubit.dart';

class ReelsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetReelsCubitt, GetReelsState>(
        builder: (context, state) {
          if (state is GetReelsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetReelsSucces) {
            final reelsList = state.reel.map((reel) {
              return ReelModel(
                reel.video ?? '',
                reel.size ?? 'Unknown ',
                profileUrl: 'https://via.placeholder.com/150',
                likeCount: 2000,
                isLiked: true,
              );
            }).toList();

            return ReelsViewer(
              reelsList: reelsList,
              appbarTitle: 'Instagram Reels',
              onShare: (url) {
                print('Shared reel url ==> $url');
              },
              onLike: (url) {
                print('Liked reel url ==> $url');
              },
              onFollow: () {
                print('======> Clicked on follow <======');
              },
              onComment: (comment) {
                print('Comment on reel ==> $comment');
              },
              onClickMoreBtn: () {
                print('======> Clicked on more option <======');
              },
              onClickBackArrow: () {
                print('======> Clicked on back arrow <======');
              },
              onIndexChanged: (index) {
                print('======> Current Index ======> $index <========');
              },
              showProgressIndicator: true,
              showVerifiedTick: true,
              showAppbar: false,
            );
          } else if (state is GetReelsFailed) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('unhandled errorrrrrrrrrrr'));
        },
      ),
    );
  }
}

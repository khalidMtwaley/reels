import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:reels/core/error/exception.dart';
import 'package:reels/core/error/failure.dart';
import 'package:reels/features/reels/data/data_sources/reels_data_source.dart';
import 'package:reels/features/reels/data/models/reels_response/reel_model.dart';

abstract class ReelsRepo {
  Future<Either<Failure, List<ReelModel>>> getReels();
}

@Singleton(as: ReelsRepo)
class ReelsRepoImpl implements ReelsRepo {
  final ReelsDataSource _dataSource;

  ReelsRepoImpl(this._dataSource);
  @override
  Future<Either<Failure, List<ReelModel>>> getReels() async {
    try {
      final response = await _dataSource.getReels();
      if (response.data != null) {
        return Right(response.data!);
      } else {
        return const Left((Failure()));
      }
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}

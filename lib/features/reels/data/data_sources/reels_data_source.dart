import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:reels/core/constants/constants';
import 'package:reels/core/error/dio_excption_handler.dart';
import 'package:reels/features/reels/data/models/reels_response/reels_response.dart';

abstract class ReelsDataSource {
  Future<ReelsResponse> getReels();
}
@Singleton(as: ReelsDataSource)
class ReelsDataSourceImpl with DioExceptionHandlerS implements ReelsDataSource {
  final Dio _dio;

  ReelsDataSourceImpl(this._dio);
  @override
  Future<ReelsResponse> getReels() {
    return apifunction(() async {
      final response = await _dio.get(APIConstants.getReelsEndPoint);
      return ReelsResponse.fromJson(response.data);
    });
    
  }
}

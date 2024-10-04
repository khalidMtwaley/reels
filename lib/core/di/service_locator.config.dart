// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:reels/core/di/Api_helper.dart' as _i945;
import 'package:reels/features/reels/data/data_sources/reels_data_source.dart'
    as _i665;
import 'package:reels/features/reels/data/repositories_impl/reels_repo.dart'
    as _i1052;
import 'package:reels/features/reels/presentation/blocs/cubit/get_reels_cubit.dart'
    as _i97;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiHelper = _$ApiHelper();
    gh.lazySingleton<_i361.Dio>(() => apiHelper.dio);
    gh.singleton<_i665.ReelsDataSource>(
        () => _i665.ReelsDataSourceImpl(gh<_i361.Dio>()));
    gh.singleton<_i1052.ReelsRepo>(
        () => _i1052.ReelsRepoImpl(gh<_i665.ReelsDataSource>()));
    gh.factory<_i97.GetReelsCubitt>(
        () => _i97.GetReelsCubitt(gh<_i1052.ReelsRepo>()));
    return this;
  }
}

class _$ApiHelper extends _i945.ApiHelper {}

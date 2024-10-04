import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/core/bloc_observer/app_bloc_observer.dart';
import 'package:reels/core/di/service_locator.dart';
import 'package:reels/features/reels/presentation/blocs/cubit/get_reels_cubit.dart';
import 'package:reels/features/reels/presentation/views/reels_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetReelsCubitt>(
          create: (context) => sl.get<GetReelsCubitt>()..getReels(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false, home: ReelsListWidget()),
    );
  }
}

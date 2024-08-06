import 'package:api_test/repositories/user_repo.dart';
import 'package:api_test/screens/profile_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_test/cache/cache_helper.dart';
import 'package:api_test/core/api/dio_consumer.dart';
import 'package:api_test/cubit/user_cubit.dart';
import 'package:api_test/screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(UserRepo(api: DioConsumer(dio: Dio()))),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CacheHelper().getData(key: 'loged') == true
          ? const ProfileScreen()
          : const SignInScreen(),
    );
  }
}

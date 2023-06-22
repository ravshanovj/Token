import 'package:access_token_practice/core/router/router.dart';
import 'package:access_token_practice/cubit/login_states.dart';
import 'package:access_token_practice/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => RegisterCubit(),
    ),
    BlocProvider(
      create: (context) => LoginCubit(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      onGenerateRoute: RouteGenerator.router.onGenerate,
      debugShowCheckedModeBanner: false,
      initialRoute: 'register',
    );
  }
}

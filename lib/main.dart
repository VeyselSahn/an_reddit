import 'package:an_reddit/screen/main_page/viewmodel/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core_shelf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: MaterialApp(
        title: 'Reddit Task',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) =>
            NavigationRoute.instance.generateRoute(settings),
        navigatorKey: NavigationService.instance.navigatorKey,
        theme: DefaultTheme.instance.theme,
      ),
    );
  }
}

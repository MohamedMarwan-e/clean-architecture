import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Core/utils/bloc_observer.dart';
import 'Core/utils/service_locator.dart';
import 'Features/Movies/Presentation/Views/movies_screen.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = CustomBlocObserver();
  runApp(
      ScreenUtilInit(
          designSize: const Size(428, 926),
          useInheritedMediaQuery: true,
          builder: (context, child) => child!,
          child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MoviesScreen(),
    );
  }
}
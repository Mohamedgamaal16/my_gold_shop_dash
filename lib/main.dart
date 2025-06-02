import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_gold_dashboard/core/routes/router_configuration.dart';
import 'package:my_gold_dashboard/core/service/cubit/network_cubit/network_cubit.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => NetworkCubit(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My Gold Dashboard',
      theme: ThemeData(
        fontFamily: "PlusJakartaSans",
      ),
      routerConfig: router,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/banner/cubit/cubit/banner_cubit.dart';
import 'package:my_gold_dashboard/Features/banner/screen/banner_screen_body.dart';
import 'package:my_gold_dashboard/Features/settings/widget/setting_appbar.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannerCubit()..loadBanners(),
      child: Scaffold(
        backgroundColor: AppColors.colorsBackground,
        appBar: buildAppBar(),
        body: const BannerScreenBody(),
      ),
    );
  }
}

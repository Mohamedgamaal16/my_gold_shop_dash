import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/settings/cubit/cubit/setting_cubit.dart';
import 'package:my_gold_dashboard/Features/settings/screen/setting_screen_body.dart';
import 'package:my_gold_dashboard/Features/settings/widget/setting_appbar.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';

class SystemSettingsScreen extends StatelessWidget {
  const SystemSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit()..loadAdmins(),
      child: Scaffold(
        backgroundColor: AppColors.colorsBackground,
        appBar: buildAppBar(),
        body: const SystemSettingsScreenBody(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/settings/cubit/cubit/setting_cubit.dart';
import 'package:my_gold_dashboard/Features/settings/helper/setting_helper.dart';
import 'package:my_gold_dashboard/Features/settings/model/admin_model.dart';
import 'package:my_gold_dashboard/Features/settings/widget/add_admin_form.dart';
import 'package:my_gold_dashboard/Features/settings/widget/add_admin_list.dart';
import 'package:my_gold_dashboard/core/shared_widget/loading_indicator.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class SystemSettingsScreenBody extends StatelessWidget {
  const SystemSettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingCubit, SettingState>(
      listenWhen: (previous, current) => current is! AdminsLoaded,
      listener: (context, state) {
        if (state is SettingInitial) {
          context.read<SettingCubit>().loadAdmins();
        } else if (state is AdminError) {
          showSnackBar(context, state.message, Colors.red, Icons.error);
        } else if (state is AdminAdded) {
          showSnackBar(
            context,
            'Admin added successfully',
            Colors.green,
            Icons.check_circle,
          );
        } else if (state is AdminDeleted) {
          showSnackBar(
            context,
            'Admin deleted successfully',
            Colors.green,
            Icons.check_circle,
          );
        } else if (state is AdminUpdated) {
          showSnackBar(
            context,
            'Admin updated successfully',
            Colors.green,
            Icons.check_circle,
          );
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'System Settings',
              style: AppTextStyles.heading4(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            AddAdminForm(
              onAddAdmin: ({
                required String name,
                required String phoneNumber,
                required PermissionLevel permission,
              }) {
                context.read<SettingCubit>().addAdmin(
                  name: name,
                  phoneNumber: phoneNumber,
                  permission: permission,
                );
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                if (state is AdminLoading) {
                  return LoadingIndicator();
                }

                List<Admin> admins = [];
                if (state is AdminsLoaded) {
                  admins = state.admins;
                } else {
                  admins = context.read<SettingCubit>().admins;
                }

                return AdminList(
                  admins: admins,
                  onDeleteAdmin:
                      (index) => showDeleteConfirmationDialog(context, index),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

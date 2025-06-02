import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/settings/model/admin_model.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_text_field.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class AddAdminForm extends StatefulWidget {
  final Function({
    required String name,
    required String phoneNumber,
    required PermissionLevel permission,
  })
  onAddAdmin;

  const AddAdminForm({super.key, required this.onAddAdmin});

  @override
  State<AddAdminForm> createState() => _AddAdminFormState();
}

class _AddAdminFormState extends State<AddAdminForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  PermissionLevel? selectedPermission;

  void _handleAddAdmin() {
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        selectedPermission != null) {
      widget.onAddAdmin(
        name: nameController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        permission: selectedPermission!,
      );

      // Clear form
      _clearForm();
    }
  }

  void _clearForm() {
    nameController.clear();
    phoneController.clear();
    setState(() {
      selectedPermission = null;
    });
  }

  String _getPermissionText(PermissionLevel permission) {
    switch (permission) {
      case PermissionLevel.orderManagement:
        return 'Order Management';
      case PermissionLevel.customerManagement:
        return 'Customer Management';
      case PermissionLevel.merchantManagement:
        return 'Merchant Management';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.colorsSurface,
       
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add New Admin', style: AppTextStyles.bodyL(context)),
          const SizedBox(height: 24),
          _buildTextField(
            label: 'Name',
            controller: nameController,
            hintText: 'Enter the Admin name',
          ),
          const SizedBox(height: 20),
          _buildTextField(
            label: 'Phone Number',
            controller: phoneController,
            hintText: 'Enter the Admin Phone number',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),
          _buildPermissionDropdown(),
          const SizedBox(height: 24),
          _buildAddButton(),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodyL(context)),
        const SizedBox(height: 8),

        CustomTextField(
          hintText: hintText,
          controller: controller,
          borderRadius: 0,
          width: MediaQuery.sizeOf(context).width * 0.4,
        ),
      ],
    );
  }

  Widget _buildPermissionDropdown() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Permission Level', style: AppTextStyles.bodyL(context)),
          const SizedBox(height: 8),
          DropdownButtonFormField<PermissionLevel>(
            value: selectedPermission,
            decoration: InputDecoration(
              hintText: 'Select Permission level',
              hintStyle: AppTextStyles.bodyS(
                context,
              ).copyWith(color: AppColors.greyScaleMediumGrey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF3B82F6)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            items:
                PermissionLevel.values.map((permission) {
                  return DropdownMenuItem(
                    value: permission,
                    child: Text(_getPermissionText(permission)),
                  );
                }).toList(),
            onChanged: (value) {
              setState(() {
                selectedPermission = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    final isFormValid =
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        selectedPermission != null;

    return ElevatedButton(
      onPressed: isFormValid ? _handleAddAdmin : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.colorsPrimary2,
        foregroundColor: AppColors.colorsSurface,
        disabledBackgroundColor: AppColors.colorsBackground,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.person_add,
            size: 18,
            color:
                isFormValid ? AppColors.colorsSurface : AppColors.colorsSecText,
          ),
          SizedBox(width: 8),
          Text(
            'Add',
            style: AppTextStyles.bodyM(
              context,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}

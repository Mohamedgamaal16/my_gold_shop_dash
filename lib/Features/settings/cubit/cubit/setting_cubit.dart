import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_gold_dashboard/Features/settings/model/admin_model.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  List<Admin> _admins = [
    Admin(
      name: 'James Jone',
      phoneNumber: '+966 55 123 4567',
      permission: PermissionLevel.orderManagement,
      addedOn: DateTime(2025, 4, 20),
    ),
    Admin(
      name: 'Sarah Ahmed',
      phoneNumber: '+966 55 123 4567',
      permission: PermissionLevel.customerManagement,
      addedOn: DateTime(2025, 4, 15),
    ),
    Admin(
      name: 'Michael Ibrahim',
      phoneNumber: '+966 55 123 4567',
      permission: PermissionLevel.merchantManagement,
      addedOn: DateTime(2025, 4, 10),
    ),
  ];

  List<Admin> get admins => _admins;

  void loadAdmins() {
    emit(AdminsLoaded(_admins));
  }

  void addAdmin({
    required String name,
    required String phoneNumber,
    required PermissionLevel permission,
  }) {
    if (name.isEmpty || phoneNumber.isEmpty) {
      emit(AdminError('Name and phone number are required'));
      return;
    }

    try {
      emit(AdminLoading());
      
      final newAdmin = Admin(
        name: name,
        phoneNumber: phoneNumber,
        permission: permission,
        addedOn: DateTime.now(),
      );
      
      _admins.add(newAdmin);
      emit(AdminAdded(newAdmin));
      emit(AdminsLoaded(_admins));
    } catch (e) {
      emit(AdminError('Failed to add admin: ${e.toString()}'));
    }
  }

  void deleteAdmin(int index) {
    if (index < 0 || index >= _admins.length) {
      emit(AdminError('Invalid admin index'));
      return;
    }

    try {
      emit(AdminLoading());
      
      final deletedAdmin = _admins[index];
      _admins.removeAt(index);
      
      emit(AdminDeleted(deletedAdmin));
      emit(AdminsLoaded(_admins));
    } catch (e) {
      emit(AdminError('Failed to delete admin: ${e.toString()}'));
    }
  }

  void updateAdmin({
    required int index,
    required String name,
    required String phoneNumber,
    required PermissionLevel permission,
  }) {
    if (index < 0 || index >= _admins.length) {
      emit(AdminError('Invalid admin index'));
      return;
    }

    if (name.isEmpty || phoneNumber.isEmpty) {
      emit(AdminError('Name and phone number are required'));
      return;
    }

    try {
      emit(AdminLoading());
      
      final updatedAdmin = Admin(
        name: name,
        phoneNumber: phoneNumber,
        permission: permission,
        addedOn: _admins[index].addedOn, // Keep original date
      );
      
      _admins[index] = updatedAdmin;
      
      emit(AdminUpdated(updatedAdmin));
      emit(AdminsLoaded(_admins));
    } catch (e) {
      emit(AdminError('Failed to update admin: ${e.toString()}'));
    }
  }

  void clearError() {
    emit(AdminsLoaded(_admins));
  }

  String getPermissionText(PermissionLevel permission) {
    switch (permission) {
      case PermissionLevel.orderManagement:
        return 'Order Management';
      case PermissionLevel.customerManagement:
        return 'Customer Management';
      case PermissionLevel.merchantManagement:
        return 'Merchant Management';
    }
  }

  String formatDate(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
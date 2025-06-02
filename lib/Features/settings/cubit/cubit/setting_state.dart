part of 'setting_cubit.dart';

sealed class SettingState extends Equatable {
  const SettingState();
  
  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {}

final class AdminLoading extends SettingState {}

final class AdminsLoaded extends SettingState {
  final List<Admin> admins;
  
  const AdminsLoaded(this.admins);
  
  @override
  List<Object> get props => [admins];
}

final class AdminAdded extends SettingState {
  final Admin admin;
  
  const AdminAdded(this.admin);
  
  @override
  List<Object> get props => [admin];
}

final class AdminDeleted extends SettingState {
  final Admin admin;
  
  const AdminDeleted(this.admin);
  
  @override
  List<Object> get props => [admin];
}

final class AdminUpdated extends SettingState {
  final Admin admin;
  
  const AdminUpdated(this.admin);
  
  @override
  List<Object> get props => [admin];
}

final class AdminError extends SettingState {
  final String message;
  
  const AdminError(this.message);
  
  @override
  List<Object> get props => [message];
}
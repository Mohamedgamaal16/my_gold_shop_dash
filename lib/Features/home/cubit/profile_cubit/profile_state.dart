part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileImageSelected extends ProfileState {
  final File image;

  const ProfileImageSelected(this.image);

  @override
  List<Object?> get props => [image];
}

part of 'translation_cubit.dart';

sealed class TranslationState extends Equatable {
  const TranslationState();

  @override
  List<Object> get props => [];
}

final class TranslationInitial extends TranslationState {}
class TranslationSelected extends TranslationState {}

class TranslationChanged extends TranslationState {}
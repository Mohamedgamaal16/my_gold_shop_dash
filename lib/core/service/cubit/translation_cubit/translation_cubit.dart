import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial()) {
    loadSavedLanguage();
  }
  
  static const String LANGUAGE_KEY = 'app_language';
  String language = 'ar'; // Default language
  String _tempLanguage = 'ar'; // Temporary language for selection before saving
  
  String getTranslation(String key) {
    return key;
  }
  
  // Load saved language from SharedPreferences
  Future<void> loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLanguage = prefs.getString(LANGUAGE_KEY);
      if (savedLanguage != null) {
        language = savedLanguage;
        _tempLanguage = savedLanguage;
        emit(TranslationChanged());
      }
    } catch (e) {
      print('Error loading language preference: $e');
    }
  }
  
  // Change language temporarily (before save)
  void selectLanguage(String newLanguage) {
    if (_tempLanguage != newLanguage) {
      _tempLanguage = newLanguage;
      emit(TranslationSelected());
    }
  }
  
  // Get the temporarily selected language
  String getSelectedLanguage() {
    return _tempLanguage;
  }
  
  // Save the selected language and apply it
  Future<void> saveLanguage() async {
    try {
      if (language != _tempLanguage) {
        language = _tempLanguage;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(LANGUAGE_KEY, language);
        emit(TranslationChanged());
      }
    } catch (e) {
      print('Error saving language preference: $e');
    }
  }
  
  // Get current active language code
  String getCurrentLanguage() {
    return language;
  }
}
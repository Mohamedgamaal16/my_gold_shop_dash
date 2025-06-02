import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:my_gold_dashboard/Features/banner/model/banner_model.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());
  
  List<BannerModel> _banners = [];
  
  // File picker state
  String? _selectedImagePath;
  String? _selectedFileName;
  bool _isFileLoading = false;
  
  // Getters for file picker state
  String? get selectedImagePath => _selectedImagePath;
  String? get selectedFileName => _selectedFileName;
  bool get isFileLoading => _isFileLoading;
  
  // Sample merchant list - you can make this dynamic later
  final List<String> merchants = [
    'Al–Saab Jewelry',
    'Golden Touch',
    'Diamond Palace',
    'Silver Star',
    'Precious Gems',
  ];

  void loadBanners() async {
    emit(BannerLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      // For demo purposes, you can uncomment this to test with sample data:
      _banners = _getSampleBanners();
      if (_banners.isEmpty) {
        emit(BannerEmpty());
      } else {
        emit(BannerLoaded(_banners));
      }
    } catch (e) {
      emit(BannerError('Failed to load banners: ${e.toString()}'));
    }
  }

  void addBanner(BannerModel banner) {
    _banners.add(banner);
    emit(BannerLoaded(_banners));
  }

  void deleteBanner(String bannerId) {
    _banners.removeWhere((banner) => banner.id == bannerId);
    if (_banners.isEmpty) {
      emit(BannerEmpty());
    } else {
      emit(BannerLoaded(_banners));
    }
  }

  void updateBanner(BannerModel updatedBanner) {
    final index = _banners.indexWhere((banner) => banner.id == updatedBanner.id);
    if (index != -1) {
      _banners[index] = updatedBanner;
      emit(BannerLoaded(_banners));
    }
  }

  // Extracted file picker function
  Future<FilePickerResult?> pickImageFile() async {
    try {
      _isFileLoading = true;
      emit(state); // Emit current state to trigger UI update
      
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        allowedExtensions: null,
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        _selectedFileName = file.name;
        // In a real app, you would upload the file and get the URL
        // For demo purposes, using a placeholder URL
        _selectedImagePath = 'https://picsum.photos/400/200?random=${DateTime.now().millisecondsSinceEpoch}';
        
        _isFileLoading = false;
        emit(state); // Emit current state to trigger UI update
        return result;
      }
      
      _isFileLoading = false;
      emit(state);
      return null;
    } catch (e) {
      _isFileLoading = false;
      emit(state);
      debugPrint('File picker error: $e');
      rethrow; // Re-throw to handle in UI
    }
  }

  // Function to set demo image (fallback)
  void setDemoImage() {
    _selectedFileName = 'demo-banner.jpg';
    _selectedImagePath = 'https://picsum.photos/400/200?random=${DateTime.now().millisecondsSinceEpoch}';
    emit(state); // Emit current state to trigger UI update
  }

  // Function to clear selected image
  void clearSelectedImage() {
    _selectedImagePath = null;
    _selectedFileName = null;
    emit(state); // Emit current state to trigger UI update
  }

  // Check if banner can be submitted
  bool canSubmit(String? selectedMerchant) {
    return selectedMerchant != null && 
           _selectedImagePath != null && 
           !_isFileLoading;
  }

  // Submit banner function
  Future<void> submitBanner(String merchantName) async {
    if (!canSubmit(merchantName)) {
      emit(BannerError('Cannot submit: Missing merchant name or image'));
      return;
    }

    try {
      emit(BannerSubmitting()); // You'll need to add this state
      
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Create new banner
      final newBanner = BannerModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        merchantName: merchantName,
        imageUrl: _selectedImagePath!,
        createdAt: DateTime.now(),
      );

      // Add to list
      _banners.add(newBanner);
      
      // Clear selection
      _selectedImagePath = null;
      _selectedFileName = null;
      
      emit(BannerLoaded(_banners));
    } catch (e) {
      emit(BannerError('Error adding banner: ${e.toString()}'));
    }
  }

  List<BannerModel> _getSampleBanners() {
    return [
      BannerModel(
        id: '1',
        merchantName: 'Al–Saab Jewelry',
        imageUrl: 'https://iso.500px.com/wp-content/uploads/2016/02/stock-photo-114337435.jpg',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      BannerModel(
        id: '2',
        merchantName: 'Golden Touch',
        imageUrl: 'https://iso.500px.com/wp-content/uploads/2016/02/stock-photo-114337435.jpg',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      BannerModel(
        id: '3',
        merchantName: 'Diamond Palace',
        imageUrl: 'https://iso.500px.com/wp-content/uploads/2016/02/stock-photo-114337435.jpg',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }
}
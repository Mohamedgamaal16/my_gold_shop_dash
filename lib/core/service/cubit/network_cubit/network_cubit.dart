import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

enum NetworkStatus { connected, disconnected }

class NetworkCubit extends Cubit<NetworkStatus> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Timer? _pollingTimer;

  NetworkCubit() : super(NetworkStatus.connected) {
    _monitorConnection();
    _startInternetPolling();
  }

  void _monitorConnection() {
    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      _checkAndEmitRealInternetStatus(results);
    });

    _connectivity.checkConnectivity().then((results) {
      _checkAndEmitRealInternetStatus(results);
    });
  }

  void _startInternetPolling() {
    _pollingTimer = Timer.periodic(const Duration(seconds: 10), (_) async {
      final results = await _connectivity.checkConnectivity();
      _checkAndEmitRealInternetStatus(results);
    });
  }

  Future<void> _checkAndEmitRealInternetStatus(
      List<ConnectivityResult> results) async {
    
    final hasInternet = await _hasRealInternet(results);
    
    if (hasInternet) {
      if (state != NetworkStatus.connected) {
        emit(NetworkStatus.connected);
      }
    } else {
      if (state != NetworkStatus.disconnected) {
        emit(NetworkStatus.disconnected);
      }
    }
  }

  Future<bool> _hasRealInternet(List<ConnectivityResult> results) async {
    if (results.contains(ConnectivityResult.none) || results.isEmpty) {
      print('No connectivity detected'); 
      return false;
    }

    try {
      print('Testing internet connection...'); 
      final response = await http
          .get(Uri.parse('https://www.google.com'))
          .timeout(const Duration(seconds: 5));
      
      final hasConnection = response.statusCode == 200;
      return hasConnection;
    } catch (e) {
      print('HTTP test failed: $e'); 
      return false;
    }
  }

  Future<void> refreshNetworkStatus() async {
    final results = await _connectivity.checkConnectivity();
    await _checkAndEmitRealInternetStatus(results);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _pollingTimer?.cancel();
    return super.close();
  }
}
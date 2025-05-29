import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/core/service/cubit/network_cubit/network_cubit.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class NetworkWrapper extends StatefulWidget {
  final Widget child;

  const NetworkWrapper({super.key, required this.child});

  @override
  State<NetworkWrapper> createState() => _NetworkWrapperState();
}

class _NetworkWrapperState extends State<NetworkWrapper> {
  OverlayEntry? _overlayEntry;
  bool _isShowingPopup = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final networkState = context.read<NetworkCubit>().state;
      if (networkState == NetworkStatus.disconnected && !_isShowingPopup) {
        _showNoInternetPopup();
      }
    });
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _showNoInternetPopup() {
    if (_isShowingPopup) return;

    _isShowingPopup = true;
    _overlayEntry = OverlayEntry(
      builder:
          (context) => _NoInternetPopup(
            onRetry: () {
              context.read<NetworkCubit>().refreshNetworkStatus();
            },
          ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      _isShowingPopup = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCubit, NetworkStatus>(
      listener: (context, networkState) {
        print("Network state changed to: $networkState");

        if (networkState == NetworkStatus.disconnected && !_isShowingPopup) {
          _showNoInternetPopup();
        } else if (networkState == NetworkStatus.connected && _isShowingPopup) {
          _removeOverlay();
        }
      },
      child: widget.child,
    );
  }
}

class _NoInternetPopup extends StatelessWidget {
  final VoidCallback onRetry;

  const _NoInternetPopup({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black45,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.colorsSurface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyScaleAlmostBlack,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.wifi_off_rounded,
                size: 64,
                color: AppColors.trafficLightColorsError,
              ),
              const SizedBox(height: 16),
              Text(
               " S.of(context).noInternetConnection"
              ,
                style: AppTextStyles.bodyL(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
               "S.of(context).pleaseCheckYourInternetConnectionAndTryAgain",
                style: AppTextStyles.bodyM(context),

                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

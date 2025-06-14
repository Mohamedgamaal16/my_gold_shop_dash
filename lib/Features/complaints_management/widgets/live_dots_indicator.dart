import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class LiveUpdatesIndicator extends StatefulWidget {
  final int complaintsCount;

  const LiveUpdatesIndicator({
    super.key,
    required this.complaintsCount,
  });

  @override
  State<LiveUpdatesIndicator> createState() => _LiveUpdatesIndicatorState();
}

class _LiveUpdatesIndicatorState extends State<LiveUpdatesIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(_animation.value),
                shape: BoxShape.circle,
              ),
            );
          },
        ),
        const SizedBox(width: 8),
         Text(
          'Live Updates',
          style: AppTextStyles.bodyM(context),
        ),
      ],
    );
  }
}

  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_svg/svg.dart';
  import 'package:go_router/go_router.dart';
  import 'package:lucide_icons/lucide_icons.dart';

  import '../../../../../core/routes/routes.dart';
  import '../../cubit/reports_details_cubit.dart';
  import '../../screen/detailed_report_screen.dart';

  class GenerateDetailedReport extends StatelessWidget {
    const GenerateDetailedReport({super.key});

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.07,
        width: MediaQuery.sizeOf(context).width * 0.18,
        child: ElevatedButton.icon(
          onPressed: (){
            GoRouter.of(context)
                .go(Routes.reportDetails);
          },
          icon: SvgPicture.asset(
            'assets/icons/Generate Detailed Report.svg',
            width: 22,
            height: 22,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          label: const Text('Generate Detailed Report'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0D4D45),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
        ),
      );
    }
  }
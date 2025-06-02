import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/banner/cubit/cubit/banner_cubit.dart';
import 'package:my_gold_dashboard/Features/banner/model/banner_model.dart';
import 'package:my_gold_dashboard/Features/banner/screen/empty_banner_screen.dart';
import 'package:my_gold_dashboard/Features/banner/widgets/add_banner_diaolg.dart';
import 'package:my_gold_dashboard/Features/banner/widgets/banner_card.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_button.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class BannerScreenBody extends StatelessWidget {
  const BannerScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomButton(
            labelName: "Add New Banner",
            onPressed: () => _handleAddBanner(context),
            width: MediaQuery.sizeOf(context).width * 0.3,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<BannerCubit, BannerState>(
              builder: (context, state) {
                if (state is BannerInitial) {
                  context.read<BannerCubit>().loadBanners();
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BannerLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BannerEmpty) {
                  return EmptyBannerScreen(
                    onAddBanner: () => _handleAddBanner(context),
                  );
                } else if (state is BannerLoaded) {
                  return GridView.builder(
                    itemCount: state.banners.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1.8,
                        ),
                    itemBuilder: (context, index) {
                      final banner = state.banners[index];
                      return BannerCard(
                        banner: banner,
                        onDelete: () => _handleDeleteBanner(context, banner.id),
                        onEdit: () => _handleEditBanner(context, banner),
                      );
                    },
                  );
                } else if (state is BannerError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64,
                          color: AppColors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error Loading Banners',
                          style: AppTextStyles.bodyM(
                            context,
                          ).copyWith(color: AppColors.red),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.message,
                          style: AppTextStyles.bodyS(
                            context,
                          ).copyWith(color: AppColors.greyScaleDarkGrey),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<BannerCubit>().loadBanners();
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                // Fallback
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }



  void _handleDeleteBanner(BuildContext context, String bannerId) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: AppColors.colorsSurface,
            title: Text('Delete Banner', style: AppTextStyles.bodyL(context)),
            content: const Text('Are you sure you want to delete this banner?'),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text('Cancel', style: AppTextStyles.bodyM(context)),
              ),
              TextButton(
                onPressed: () {
                  context.read<BannerCubit>().deleteBanner(bannerId);
                  // Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(foregroundColor: AppColors.red),
                child: Text('Delete', style: AppTextStyles.bodyM(context)),
              ),
            ],
          ),
    );
  }

  void _handleEditBanner(BuildContext context, BannerModel banner) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit ${banner.merchantName} banner')),
    );
  }

  void _handleAddBanner(BuildContext context) {
    showAddBannerPopup(
      context: context,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/banner/cubit/cubit/banner_cubit.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class AddBannerPopup extends StatefulWidget {
  const AddBannerPopup({super.key});

  @override
  State<AddBannerPopup> createState() => _AddBannerPopupState();
}

class _AddBannerPopupState extends State<AddBannerPopup> {
  String? selectedMerchant;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannerCubit(),
      child: BlocConsumer<BannerCubit, BannerState>(
        listener: (context, state) {
          if (state is BannerLoaded) {
            // Banner added successfully, close dialog
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Banner added successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is BannerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<BannerCubit>();
          final isSubmitting = state is BannerSubmitting;

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: 500,
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add New Banner',
                        style: AppTextStyles.bodyL(context),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey.shade100,
                          shape: const CircleBorder(),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Upload Banner Section
                  Text(
                    'Upload Banner',
                    style: AppTextStyles.bodyM(
                      context,
                    ).copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),

                  GestureDetector(
                    onTap: () => pickImage(cubit),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade50,
                      ),
                      child:
                          cubit.selectedImagePath != null
                              ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  cubit.selectedImagePath!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return _buildUploadPlaceholder();
                                  },
                                ),
                              )
                              : _buildUploadPlaceholder(),
                    ),
                  ),

                  if (cubit.selectedFileName != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Selected: ${cubit.selectedFileName}',
                      style: AppTextStyles.bodyS(
                        context,
                      ).copyWith(color: AppColors.greyScaleMediumGrey),
                    ),
                  ],

                  const SizedBox(height: 24),

                  // Choose Merchant Section
                  Text(
                    'Choose Merchant name',
                    style: AppTextStyles.bodyM(
                      context,
                    ).copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedMerchant,
                        hint: Text(
                          'Merchant name',
                          style: AppTextStyles.bodyM(
                            context,
                          ).copyWith(color: Colors.grey.shade600),
                        ),
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items:
                            cubit.merchants.map((String merchant) {
                              return DropdownMenuItem<String>(
                                value: merchant,
                                child: Text(
                                  merchant,
                                  style: AppTextStyles.bodyM(context),
                                ),
                              );
                            }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedMerchant = newValue;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed:
                          cubit.canSubmit(selectedMerchant) && !isSubmitting
                              ? () => cubit.submitBanner(selectedMerchant!)
                              : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF134E4A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        disabledBackgroundColor: Colors.grey.shade300,
                      ),
                      child:
                          isSubmitting
                              ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                              : Text(
                                'Add Banner',
                                style: AppTextStyles.bodyL(context).copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUploadPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.cloud_upload_outlined,
          size: 48,
          color: Colors.grey.shade600,
        ),
        const SizedBox(height: 12),
        Text(
          'Choose File To Upload',
          style: AppTextStyles.bodyM(
            context,
          ).copyWith(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 4),
        Text(
          'Click to browse files',
          style: AppTextStyles.bodyS(
            context,
          ).copyWith(color: Colors.grey.shade500),
        ),
      ],
    );
  }

  Future<void> pickImage(BannerCubit cubit) async {
    try {
      final result = await cubit.pickImageFile();

      if (result != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File selected: ${cubit.selectedFileName}'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
     
      
          cubit.setDemoImage();
        
      
    }
  }
}

void showAddBannerPopup({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const AddBannerPopup();
    },
  );
}

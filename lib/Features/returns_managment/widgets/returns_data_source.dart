import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/returns_managment/model/return_model.dart';
import 'package:my_gold_dashboard/Features/returns_managment/screens/return_detailes_screen.dart';
import 'package:my_gold_dashboard/core/shared_widget/caches_image.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class RerturnsDataSource extends DataTableSource {
  RerturnsDataSource(
    this.context,
    this.returns, {
    this.onAccept,
    this.onRefuse,
    this.onViewDetails,
  });

  final BuildContext context;
  final List<ReturnModel> returns;
  final void Function()? onAccept;
  final void Function()? onRefuse;
  final void Function(ReturnModel returnModel)? onViewDetails;

  @override
  DataRow? getRow(int index) {
    final retur1 = returns[index];
    return DataRow(
      cells: [
        DataCell(
          Center(
            child: Text(
              retur1.returnId,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        DataCell(Center(child: Text(retur1.orderId))),
        DataCell(Center(child: Text(retur1.customerName))),
        DataCell(Center(child: Text(retur1.reason))),
        DataCell(Center(child: Text(retur1.merchant))),
        DataCell(Center(child: Text(retur1.date))),
        DataCell(
          Center(
            child: GestureDetector(
              onTap: () => _showImageDialog(context, retur1.orderPic),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.greyScaleNearWhite,
                  border: Border.all(color: AppColors.greyScaleCharcoalGrey),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.image,
                      size: 16,
                      color: AppColors.greyScaleCharcoalGrey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "View Image",
                      style: AppTextStyles.bodyS(context).copyWith(
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),


        DataCell(
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _getStateColor(retur1.status),
              ),
              child: Text(
                retur1.status,
                style: TextStyle(
                  color: _getTextColor(retur1.status),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        // View Details - Clickable navigation
        DataCell(
          Center(
            child: GestureDetector(
              onTap: () {

                                  // _navigateToDetailsPage(context, retur1);

                if (onViewDetails != null) {
                  onViewDetails!(retur1);
                } else {
                  _navigateToDetailsPage(context, retur1);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  "View Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyScaleAlmostBlack,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color _getStateColor(String state) {
    switch (state.toLowerCase()) {
      case 'rejected':
        return AppColors.trafficLightColorsError;
      case 'approved':
        return AppColors.trafficLightColorsSuccess;
      case 'pending':
        return AppColors.lightYellosColor;
      default:
        return AppColors.lightGreenColor;
    }
  }

  Color _getTextColor(String state) {
    switch (state.toLowerCase()) {
      case 'pending':
        return Colors.black87;
      default:
        return AppColors.colorsSurface;
    }
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.5,
                    maxHeight:MediaQuery.sizeOf(context).height * 0.5,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child:
                    
                    CachedImage(imageUrl: imagePath, onPressed: (onPressed){}, fit: BoxFit.cover
                    
                    ,width: MediaQuery.sizeOf(context).width * 0.4,
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    

                    )
                    
                   
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: AppColors.colorsSurface,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToDetailsPage(BuildContext context, ReturnModel returnModel) {
   
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ReturnDetailsPage(returnModel: returnModel,),
      ),
    );
    
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => returns.length;

  @override
  int get selectedRowCount => 0;
}



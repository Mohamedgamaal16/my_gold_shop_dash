import 'package:my_gold_dashboard/Features/complaints_management/data/model/ComplaintsManagementResponse.dart';

abstract class ComplaintsManagementState{}



class ComplaintsManagementInitState extends ComplaintsManagementState{}
class ComplaintsManagementLoadingState extends ComplaintsManagementState{}
class ComplaintsManagementSuccessState extends ComplaintsManagementState{
  ComplaintsManagementResponse complaintsManagementResponse;
  ComplaintsManagementSuccessState({required this.complaintsManagementResponse});
}
class ComplaintsManagementErrorState extends ComplaintsManagementState{
  String message;
  ComplaintsManagementErrorState({required this.message});
}
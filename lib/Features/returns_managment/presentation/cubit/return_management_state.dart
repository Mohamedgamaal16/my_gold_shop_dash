import 'package:my_gold_dashboard/Features/returns_managment/data/model/ReturnManagementResponse.dart';

abstract class ReturnManagementState{}


class ReturnManagementInitState extends ReturnManagementState{}
class ReturnManagementLoadingState extends ReturnManagementState{}
class ReturnManagementSuccessState extends ReturnManagementState{
  ReturnManagementResponse returnManagementResponse;
  ReturnManagementSuccessState({required this.returnManagementResponse});
}
class ReturnManagementErrorState extends ReturnManagementState{
  String message;
  ReturnManagementErrorState({required this.message});
}
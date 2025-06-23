import 'package:my_gold_dashboard/Features/customer_management/data/model/CustomerManagementResponse.dart';

abstract class CustomerManagementState{}


class CustomerManagementInitState extends CustomerManagementState{}
class CustomerManagementLoadingState extends CustomerManagementState{}
class CustomerManagementSuccessState extends CustomerManagementState{
  CustomerManagementResponse customerManagementResponse;
  CustomerManagementSuccessState({required this.customerManagementResponse});
}
class CustomerManagementErrorState extends CustomerManagementState{
  String message;
  CustomerManagementErrorState({required this.message});
}
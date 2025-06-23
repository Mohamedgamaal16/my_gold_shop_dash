import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/customer_management/data/data_source/customer_management_data_source_impl.dart';
import 'package:my_gold_dashboard/Features/customer_management/data/model/CustomerManagementResponse.dart';
import 'package:my_gold_dashboard/Features/customer_management/data/repo_impl/customer_management_repo_impl.dart';
import 'package:my_gold_dashboard/Features/customer_management/domain/usecases/customer_management_use_cases.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

import 'customer_management_state.dart';

class CustomerManagementCubit extends Cubit<CustomerManagementState>{
  CustomerManagementCubit() : super(CustomerManagementInitState());


  CustomerManagementUseCases customerManagementUseCases = CustomerManagementUseCases(customerManagementRepo: CustomerManagementRepoImpl(customerManagementDataSource: CustomerManagementDataSourceImpl(apiManager: ApiManager())));

  customerManagement()async{
    emit(CustomerManagementLoadingState());

    var response = await customerManagementUseCases.call();

    switch(response) {
      case ApiSuccessResult<CustomerManagementResponse>():
        emit(CustomerManagementSuccessState(customerManagementResponse: response.data));
        log("CustomerManagementSuccessState  this is message  ==> ${response.data.message}");
      case ApiErrorResult<CustomerManagementResponse>():
        emit(CustomerManagementErrorState(message: response.failures.message));
        log("CustomerManagementErrorState  this is message  ==> ${response.failures.message}");

    }
  }
}
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/customer_managemen_details/data/data_source/customer_management_details_data_source_impl.dart';
import 'package:my_gold_dashboard/Features/customer_managemen_details/data/model/CustomerManagementDetailsResponse.dart';
import 'package:my_gold_dashboard/Features/customer_managemen_details/data/repo_impl/customer_management_details_repo_impl.dart';
import 'package:my_gold_dashboard/Features/customer_managemen_details/domain/usecases/customer_management_details_use_cases.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

import 'customer_management_state.dart';

class CustomerManagementDetailsCubit extends Cubit<CustomerManagementDetailsState>{
  CustomerManagementDetailsCubit() : super(CustomerManagementDetailsInitState());


  CustomerManagementDetailsUseCases customerManagementDetailsUseCases = CustomerManagementDetailsUseCases(customerManagementDetailsRepo: CustomerManagementDetailsRepoImpl(customerManagementDetailsDataSource: CustomerManagementDetailsDataSourceImpl(apiManager: ApiManager())));

  customerManagementDetails(String customerId)async{
    emit(CustomerManagementDetailsLoadingState());

    var response = await customerManagementDetailsUseCases.call(customerId);

    switch(response) {
      case ApiSuccessResult<CustomerManagementDetailsResponse>():
        emit(CustomerManagementDetailsSuccessState(customerManagementDetailsResponse: response.data));
        log("CustomerManagementDetailsErrorState  this is message ==> ${response.data.message}");
      case ApiErrorResult<CustomerManagementDetailsResponse>():
        emit(CustomerManagementDetailsErrorState(message: response.failures.message));
        log("CustomerManagementDetailsErrorState  this is error ==> ${response.failures.message}");
    }
  }

}
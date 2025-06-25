import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/complaints_management/data/data_source/complaints_management_data_source_impl.dart';
import 'package:my_gold_dashboard/Features/complaints_management/data/model/ComplaintsManagementResponse.dart';
import 'package:my_gold_dashboard/Features/complaints_management/data/repo_impl/complaints_management_repo_impl.dart';
import 'package:my_gold_dashboard/Features/complaints_management/domain/usecases/complaints_management_use_cases.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

import 'complaints_management_state.dart';

class ComplaintsManagementCubit extends Cubit<ComplaintsManagementState>{
  ComplaintsManagementCubit() : super(ComplaintsManagementInitState());

  ComplaintsManagementUseCases complaintsManagementUseCases =ComplaintsManagementUseCases(complaintsManagementRepo: ComplaintsManagementRepoImpl(complaintsManagementDataSource: ComplaintsManagementDataSourceImpl(apiManager: ApiManager())));


  complaintsManagement()async{
    emit(ComplaintsManagementLoadingState());
     var response  = await complaintsManagementUseCases.call();


     switch(response) {
       case ApiSuccessResult<ComplaintsManagementResponse>():
         emit(ComplaintsManagementSuccessState(complaintsManagementResponse: response.data));
         log("ComplaintsManagementSuccessState  ==> ${response.data.message}");
       case ApiErrorResult<ComplaintsManagementResponse>():
         emit(ComplaintsManagementErrorState(message: response.failures.message));
         log("ComplaintsManagementErrorState error ==> ${response.failures.message} ");
     }
  }
}
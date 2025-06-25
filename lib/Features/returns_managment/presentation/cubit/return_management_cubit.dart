import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gold_dashboard/Features/returns_managment/data/data_source/return_management_data_source_impl.dart';
import 'package:my_gold_dashboard/Features/returns_managment/data/model/ReturnManagementResponse.dart';
import 'package:my_gold_dashboard/Features/returns_managment/data/repo_impl/return_management_repo_impl.dart';
import 'package:my_gold_dashboard/Features/returns_managment/domain/usecases/return_management_details_use_cases.dart';
import 'package:my_gold_dashboard/Features/returns_managment/presentation/cubit/return_management_state.dart';
import 'package:my_gold_dashboard/core/api/api_manager.dart';
import 'package:my_gold_dashboard/core/api/api_result.dart';

class ReturnManagementCubit extends Cubit<ReturnManagementState>{
  ReturnManagementCubit() : super(ReturnManagementInitState());

  ReturnManagementDetailsUseCases returnManagementDetailsUseCases =ReturnManagementDetailsUseCases(returnManagementRepo: ReturnManagementRepoImpl(returnManagementDataSource: ReturnManagementDataSourceImpl(apiManager: ApiManager())));

  returnManagement()async{
    emit(ReturnManagementLoadingState());

    var response = await returnManagementDetailsUseCases.call();

    switch(response){

      case ApiSuccessResult<ReturnManagementResponse>():
       emit(ReturnManagementSuccessState(returnManagementResponse: response.data));
       log('returnData length = ${response.data.returnData?.length}');
       log('ReturnManagementSuccessState ===> = ${response.data.message}');
      case ApiErrorResult<ReturnManagementResponse>():
        emit(ReturnManagementErrorState(message: response.failures.message));

    }
  }
}
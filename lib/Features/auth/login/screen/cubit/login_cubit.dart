  import 'dart:developer';

  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:my_gold_dashboard/Features/auth/login/data/data_source/login_data_source_impl.dart';
  import 'package:my_gold_dashboard/Features/auth/login/data/model/LoginResponse.dart';
  import 'package:my_gold_dashboard/Features/auth/login/data/repo_impl/login_repo_impl.dart';
  import 'package:my_gold_dashboard/Features/auth/login/domain/usecases/login_use_cases.dart';
  import 'package:my_gold_dashboard/Features/auth/login/screen/cubit/login_state.dart';
  import 'package:my_gold_dashboard/core/api/api_manager.dart';
  import 'package:my_gold_dashboard/core/api/api_result.dart';

  import '../../data/model/login_parameters.dart';

  class loginCubit extends Cubit<LoginState>{
    loginCubit() : super(LoginInitState());

    LoginUseCases loginUseCases =LoginUseCases(loginRepo: LoginRepoImpl(loginDataSource: LoginDataSourceImpl(apiManager: ApiManager())));



    login(LoginParameters parameters)async{
      emit(LoginLoadingState());

      var response = await loginUseCases.call(parameters);

      switch(response) {
        case ApiSuccessResult<LoginResponse>():
         emit(LoginSuccessState(loginResponse: response.data));
         log("LoginSuccessState  this otp ==> ${response.data.otp}");
        case ApiErrorResult<LoginResponse>():
          emit(LoginErrorState(message: response.failures.message));
          log("LoginErrorState  this error message ==> ${response.failures.message}");
      }
    }
  }
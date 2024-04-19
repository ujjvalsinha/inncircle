import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_2/feature/state_app/presentation/cubit/api_call_state.dart';

import '../../domain/state_repository.dart';

class ApiCallCubit extends Cubit<ApiCallState> {
  final StateRepository repository;

  ApiCallCubit(this.repository) : super(ApiDataLoading()) {
    getDataFromServer();
  }

  Future<void> getDataFromServer() async {
    try {
      Map<String, dynamic> apidata = await repository.getDataFromServer();
      emit(ApiDataLoaded(apiData: apidata));
    } catch (e) {
      emit(ApiDataError(errorMessage: "Something went wrong"));
    }
  }
}

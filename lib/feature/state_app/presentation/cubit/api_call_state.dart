import 'package:equatable/equatable.dart';

abstract class ApiCallState extends Equatable {}

class ApiDataLoading extends ApiCallState {
  @override
  List<Object?> get props => [];
}

class ApiDataLoaded extends ApiCallState {
  final Map<String, dynamic> apiData;

  ApiDataLoaded({required this.apiData});
  @override
  List<Object?> get props => [apiData];
}

class ApiDataError extends ApiCallState {
  final String errorMessage;

  ApiDataError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

import 'package:get_it/get_it.dart';
import 'package:interview_2/feature/state_app/domain/state_repository.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  GetIt.I.registerFactory<StateRepository>(() => StateRepository());
}

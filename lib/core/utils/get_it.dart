import 'package:get_it/get_it.dart';
import 'package:taswek/core/services/data_base.dart';
import 'package:taswek/core/services/fire_base_store_service.dart';
import 'package:taswek/core/services/firebase_auth_service.dart';
import 'package:taswek/features/auth/data/repo_imp/auth_repo_impl.dart';
import 'package:taswek/features/auth/domain/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataBaseService>(FireBaseStoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      dataBaseService: getIt<DataBaseService>(),
    ),
  );
}

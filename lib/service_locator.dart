import 'package:get_it/get_it.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/data/service/auth_firebase_service.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecase/get_user.dart';
import 'features/auth/domain/usecase/sigin.dart';
import 'features/auth/domain/usecase/signup.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
 getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
 getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
 getIt.registerSingleton<SignupUseCase>(SignupUseCase());
 getIt.registerSingleton<SigninUseCase>(SigninUseCase());
 getIt.registerSingleton<GetUserUseCase>(GetUserUseCase());
}
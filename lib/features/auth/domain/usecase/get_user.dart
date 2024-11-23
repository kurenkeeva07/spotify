import 'package:dartz/dartz.dart';
import 'package:my_spotify/core/di/service_locator.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class GetUserUseCase implements UseCase<Either,dynamic> {
  @override
  Future<Either> call({params}) async {
    return await getIt<AuthRepository>().getUser();
  }
}
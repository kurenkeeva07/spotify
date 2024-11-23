import 'package:get_it/get_it.dart';
import '../../features/album/data/datasourse/album_datasource.dart';
import '../../features/album/data/repository/album_repository.dart';
import '../../features/artist/data/datasourse/artist_datasource.dart';
import '../../features/artist/data/repository/artist_repository.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/data/service/auth_firebase_service.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecase/get_user.dart';
import '../../features/auth/domain/usecase/sigin.dart';
import '../../features/auth/domain/usecase/signup.dart';
import '../../features/play_list/data/datasourse/playlist_datasource.dart';
import '../../features/play_list/data/repository/playlist_repository.dart';
import '../../features/podcast/data/datasourse/podcast_datasource.dart';
import '../../features/podcast/data/repository/podcast_repository.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
 getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
 getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
 getIt.registerSingleton<SignupUseCase>(SignupUseCase());
 getIt.registerSingleton<SigninUseCase>(SigninUseCase());
 getIt.registerSingleton<GetUserUseCase>(GetUserUseCase());
 getIt.registerSingleton<ArtistDatasource>(ArtistLocalDatasource());
 getIt.registerSingleton<PodcastDatasource>(PodcastLocalDatasource());
 getIt.registerSingleton<AlbumDatasource>(AlbumLocalDatasource());
 getIt.registerSingleton<PlaylistDatasource>(PLaylistLocalDatasource());
 getIt.registerSingleton<ArtistRepository>(ArtistLocalRepository());
 getIt.registerSingleton<PodcastRepository>(PodcastLocalRepository());
 getIt.registerSingleton<AlbumRepository>(AlbumLocalRepository());
 getIt.registerSingleton<PLaylistRepository>(PlaylistLocalRepository());
}
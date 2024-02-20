import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/Movies/Data/Data_Sources/movie_remote_data_source.dart';
import '../../Features/Movies/Data/Imply_Repositories/movies_impl_repo.dart';
import '../../Features/Movies/Domain/Use_Cases/movies_usecase.dart';
import '../../Features/Movies/Presentation/Manager/movies_bloc.dart';
import 'api_services.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  /// Bloc
  getIt.registerLazySingleton<MoviesBloc>(() => MoviesBloc(getAllMoviesUseCase: getIt.get<GetAllMoviesUseCase>()));

  /// Repository
  getIt.registerLazySingleton<MoviesImplRepo>(() => MoviesImplRepo(movieRemoteDataSource: getIt.get<MovieRemoteDataSource>()));

  /// DataSources
  getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getIt.get<ApiService>()));

  /// UseCases
  getIt.registerLazySingleton<GetAllMoviesUseCase>(() => GetAllMoviesUseCase(getIt.get<MoviesImplRepo>()));

  /// External
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
}
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:rezult_test/src/domain_models/photo.dart';
import 'package:rezult_test/src/services/photos_service_impl.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState(status: HomePageStatus.initial));

  void fetchPhotos() async {
    emit(state.copyWith(
      status: HomePageStatus.loading,
    ));
    List<PhotoDomain>? photos = await GetIt.I<PhotosServiceImpl>().getPhotos;
    emit(state.copyWith(
      photos: photos,
      status: HomePageStatus.loaded,
    ));
  }
}

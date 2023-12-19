part of 'home_page_cubit.dart';

enum HomePageStatus { initial, loading, loaded, error }

class HomePageState extends Equatable {
  final HomePageStatus status;
  final List<PhotoDomain> photos;

  const HomePageState({
    required this.status,
    this.photos = const [],
  });

  @override
  List<Object?> get props => [status, photos];

  HomePageState copyWith({
    HomePageStatus? status,
    List<PhotoDomain>? photos,
  }) {
    return HomePageState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
    );
  }
}

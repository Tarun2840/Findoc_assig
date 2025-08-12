import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../../services/api_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;

  HomeBloc({required this.apiService}) : super(const HomeState()) {
    on<LoadImages>(_onLoadImages);
  }

  void _onLoadImages(LoadImages event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final images = await apiService.fetchImages(limit: 10);
      emit(state.copyWith(
        status: HomeStatus.success,
        images: images,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
import 'package:equatable/equatable.dart';
import '../../../models/image_model.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<ImageModel> images;
  final String errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.images = const [],
    this.errorMessage = '',
  });

  HomeState copyWith({
    HomeStatus? status,
    List<ImageModel>? images,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      images: images ?? this.images,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, images, errorMessage];
}
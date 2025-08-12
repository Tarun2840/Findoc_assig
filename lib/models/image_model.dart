import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadUrl;

  const ImageModel({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] ?? '',
      author: json['author'] ?? 'Unknown',
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      url: json['url'] ?? '',
      downloadUrl: json['download_url'] ?? '',
    );
  }

  double get aspectRatio => width > 0 && height > 0 ? width / height : 1.0;

  @override
  List<Object> get props => [id, author, width, height, url, downloadUrl];
}
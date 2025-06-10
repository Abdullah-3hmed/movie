enum MediaType { movie, tv }

extension MediaTypeExtension on MediaType {
  String get toApiString {
    switch (this) {
      case MediaType.movie:
        return 'movie';
      case MediaType.tv:
        return 'tv';
    }
  }
}

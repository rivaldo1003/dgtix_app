class ServerException {
  final String message;

  ServerException({
    required this.message,
  });

  @override
  String toString() {
    return 'Server Exception : $message';
  }
}

class CacheException {
  final String message;

  CacheException({required this.message});

  @override
  String toString() {
    return 'CacheException: $message';
  }
}

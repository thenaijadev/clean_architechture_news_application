class LocalDataSourceError {
  LocalDataSourceError({required this.message});
  final String message;

  @override
  String toString() => 'LocalDataSourceError(message: $message)';
}

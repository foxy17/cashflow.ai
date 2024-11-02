/// Base exception class for the application
abstract class AppException implements Exception {
  final String message;
const AppException(this.message);

  @override
  String toString() => message;
}

/// Thrown when required permissions are denied
class PermissionDeniedException extends AppException {
  const PermissionDeniedException([String message = 'Required permissions were denied'])
      : super(message);
}

/// Thrown when storage permissions are denied
class StoragePermissionDeniedException extends AppException {
  const StoragePermissionDeniedException([
    String message = 'Storage permissions are required to store app data',
  ]) : super(message);
}

/// Thrown when app initialization fails
class InitializationException extends AppException {
  const InitializationException(String message) : super(message);
}

/// Thrown when database operations fail
class DatabaseException extends AppException {
  const DatabaseException(String message) : super(message);
} 
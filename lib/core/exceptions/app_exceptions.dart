/// Base exception class for the application
abstract class AppException implements Exception {
  final String message;
const AppException(this.message);

  @override
  String toString() => message;
}

/// Thrown when required permissions are denied
class PermissionDeniedException extends AppException {
  const PermissionDeniedException([super.message = 'Required permissions were denied']);
}

/// Thrown when storage permissions are denied
class StoragePermissionDeniedException extends AppException {
  const StoragePermissionDeniedException([
    super.message = 'Storage permissions are required to store app data',
  ]);
}

/// Thrown when app initialization fails
class InitializationException extends AppException {
  const InitializationException(super.message);
}

/// Thrown when database operations fail
class DatabaseException extends AppException {
  const DatabaseException(super.message);
} 
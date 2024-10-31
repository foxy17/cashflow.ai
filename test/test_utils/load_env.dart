import 'dart:io';

void loadTestEnv() {
  final envFile = File('.env.test');
  if (!envFile.existsSync()) return;

  final lines = envFile.readAsLinesSync();
  for (final line in lines) {
    if (line.trim().isEmpty || line.startsWith('#')) continue;
    final parts = line.split('=');
    if (parts.length != 2) continue;
    
    final key = parts[0].trim();
    final value = parts[1].trim();
    Platform.environment[key] = value;
  }
} 
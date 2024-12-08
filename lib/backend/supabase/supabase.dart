import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

String _kSupabaseUrl = 'https://gpmessawisdnfsvshhuk.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdwbWVzc2F3aXNkbmZzdnNoaHVrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUyMjc3MjUsImV4cCI6MjA0MDgwMzcyNX0.q_TMdih8CGxbeyAgOfYAZW-mQcBW0xOZBWVXjCAeO6U';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}

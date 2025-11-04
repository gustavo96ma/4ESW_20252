import 'package:supabase_flutter/supabase_flutter.dart';

/// Serviço responsável pelo registro de usuários
class RegisterService {
  /// Envia os dados de registro do usuário para o Supabase
  Future<void> sendRegister(
    String fullName,
    String email,
    String password,
  ) async {
    final supabase = Supabase.instance.client;
    await supabase.auth.signUp(
      data: {'full_name': fullName},
      password: password,
      email: email,
    );
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterService {
  sendRegister(String fullName, String email, String password) async {
    final supabase = Supabase.instance.client;
    await supabase.auth.signUp(
      data: {'full_name': fullName},
      password: password,
      email: email,
    );
  }
}

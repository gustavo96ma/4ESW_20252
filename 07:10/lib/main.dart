import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zapizapi/ui/features/login/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zapizapi/ui/features/register/register_screen.dart';
import 'package:zapizapi/utils/routes_enum.dart';

// TODO(gustavo96ma): Implementar sistema de rotas das páginas
// TODO:Implementar a register screen
// TODO: Finalizar integrar com o Supabase (try catch)
// TODO: Criar arquitetura dessa integração
// TODO: Login Social
// TODO: Implementar awesome_lints

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: 'https://fxlcngllzvhwubriywvr.supabase.co',
    anonKey: dotenv.env['SUPABASE_KEY'] ?? '',
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RoutesEnum.login.route: (context) => LoginScreen(),
        RoutesEnum.register.route: (context) => RegisterScreen(),
      },
      initialRoute: RoutesEnum.login.route,
    );
  }
}

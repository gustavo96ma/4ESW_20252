import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zapizapi/ui/features/home/home_screen.dart';
import 'package:zapizapi/ui/features/login/login_screen.dart';
import 'package:zapizapi/ui/features/register/register_screen.dart';
import 'package:zapizapi/utils/routes_enum.dart';

// TODO: Implementar change notifier na main e injetar gerenciamento de estado
// no register screen
// TODO: Integrar login screen com gerenciamento de sessão

Future<void> main() async {
  await dotenv.load();
  await Supabase.initialize(
    url: 'https://fxlcngllzvhwubriywvr.supabase.co',
    anonKey: dotenv.env['SUPABASE_KEY'] ?? '',
  );
  runApp(const MainApp());
}

/// Aplicação principal
class MainApp extends StatelessWidget {
  /// Construtor da classe [MainApp]
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: FToastBuilder(),
      routes: {
        RoutesEnum.login.route: (context) => LoginScreen(),
        RoutesEnum.register.route: (context) => const RegisterScreen(),
        RoutesEnum.home.route: (context) => const HomeScreen(),
      },
      initialRoute: RoutesEnum.login.route,
    );
  }
}

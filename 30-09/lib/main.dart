import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zapizapi/ui/widgets/custom_button.dart';
import 'package:zapizapi/ui/widgets/custom_input.dart';
import 'package:zapizapi/ui/widgets/custom_text_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// TODO(gustavo96ma): Implementar sistema de rotas das páginas
// TODO: Extrair o código para a login_screen
// TODO:Implementar a register screen
// TODO: Finalizar integrar com o Supabase (try catch)
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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: constraints.maxWidth > 768
                        ? 768
                        : constraints.maxWidth,
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/logos/logo_login.png'),
                          height: 280,
                        ),
                        SizedBox(height: 18),
                        SizedBox(
                          width: double.infinity,
                          child: Text('Login', style: TextStyle(fontSize: 20)),
                        ),
                        SizedBox(height: 18),
                        CustomInput(
                          hint: 'Digite seu email',
                          label: 'Email',
                          controller: emailController,
                        ),
                        SizedBox(height: 18),
                        CustomInput(
                          hint: 'Digite sua senha',
                          label: 'Senha',
                          controller: passwordController,
                        ),
                        Align(
                          alignment: AlignmentGeometry.centerRight,
                          child: CustomTextButton(
                            buttonText: 'Esqueci minha senha',
                          ),
                        ),
                        SizedBox(height: 18),
                        CustomButton(
                          buttonText: 'Entrar',
                          backgroundColor: Color(0xFF03A9F4),
                          buttonAction: () async {
                            final supabase = Supabase.instance.client;

                            final response = await supabase.auth
                                .signInWithPassword(
                                  password: passwordController.text,
                                  email: emailController.text,
                                );

                            print(response);
                          },
                        ),
                        SizedBox(height: 18),
                        CustomTextButton(
                          buttonText: 'Não tem uma conta? Cadastre-se',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

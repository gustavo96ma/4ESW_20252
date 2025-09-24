import 'package:flutter/material.dart';
import 'package:zapizapi/ui/widgets/custom_button.dart';
import 'package:zapizapi/ui/widgets/custom_input.dart';
import 'package:zapizapi/ui/widgets/custom_text_button.dart';

// TODO(gustavo96ma): Implementar sistema de rotas das páginas
// TODO: Extrair o código para a login_screen
// TODO:Implementar a register screen
// TODO: Integrar com o Supabase
// TODO: Login Social
// TODO: Implementar awesome_lints

void main() {
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

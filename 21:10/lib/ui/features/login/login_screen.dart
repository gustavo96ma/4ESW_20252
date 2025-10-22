import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zapizapi/ui/widgets/custom_button.dart';
import 'package:zapizapi/ui/widgets/custom_input.dart';
import 'package:zapizapi/ui/widgets/custom_text_button.dart';
import 'package:zapizapi/utils/routes_enum.dart';

// TODO: Implementar obscurecer senha
// TODO: Implementar olhinho de visualizar senha

/// Tela de login
class LoginScreen extends StatelessWidget {
  /// Construtor da classe [LoginScreen]
  LoginScreen({super.key});

  /// Controlador do campo de email
  final TextEditingController emailController = TextEditingController();

  /// Controlador do campo de senha
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: SizedBox(
                    width: constraints.maxWidth > 768
                        ? 768
                        : constraints.maxWidth,
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/logos/logo_login.png'),
                          height: 280,
                        ),
                        const SizedBox(height: 18),
                        const SizedBox(
                          width: double.infinity,
                          child: Text('Login', style: TextStyle(fontSize: 20)),
                        ),
                        const SizedBox(height: 18),
                        CustomInput(
                          hint: 'Digite seu email',
                          label: 'Email',
                          controller: emailController,
                        ),
                        const SizedBox(height: 18),
                        CustomInput(
                          hint: 'Digite sua senha',
                          label: 'Senha',
                          controller: passwordController,
                        ),
                        Align(
                          alignment: AlignmentGeometry.centerRight,
                          child: CustomTextButton(
                            buttonText: 'Esqueci minha senha',
                            buttonAction: () {},
                          ),
                        ),
                        const SizedBox(height: 18),
                        CustomButton(
                          buttonText: 'Entrar',
                          backgroundColor: const Color(0xFF03A9F4),
                          buttonAction: () async {
                            final navigator = Navigator.of(context);
                            final supabase = Supabase.instance.client;

                            final response = await supabase.auth
                                .signInWithPassword(
                                  password: passwordController.text,
                                  email: emailController.text,
                                );

                            debugPrint(response.user.toString());
                            await navigator.pushReplacementNamed(
                              RoutesEnum.home.route,
                            );
                          },
                        ),
                        const SizedBox(height: 18),
                        CustomTextButton(
                          buttonText: 'Não tem uma conta? Cadastre-se',
                          buttonAction: () async {
                            await Navigator.pushNamed(
                              context,
                              RoutesEnum.register.route,
                            ); // Named route
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

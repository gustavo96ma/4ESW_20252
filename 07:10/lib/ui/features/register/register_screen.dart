import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zapizapi/ui/widgets/custom_button.dart';
import 'package:zapizapi/ui/widgets/custom_input.dart';
import 'package:zapizapi/ui/widgets/custom_text_button.dart';
import 'package:zapizapi/utils/routes_enum.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                      spacing: 18,
                      children: [
                        Image(
                          image: AssetImage('assets/logos/logo_login.png'),
                          height: 280,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Registro',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        CustomInput(
                          hint: 'Digite seu email',
                          label: 'Email',
                          controller: emailController,
                        ),
                        CustomInput(
                          hint: 'Digite seu nome completo',
                          label: 'Nome',
                          controller: fullNameController,
                        ),
                        CustomInput(
                          hint: 'Digite sua senha',
                          label: 'Senha',
                          controller: passwordController,
                        ),
                        CustomInput(
                          hint: 'Confirme sua senha',
                          label: 'Confirmação da senha',
                          controller: passwordConfirmationController,
                        ),
                        CustomButton(
                          buttonText: 'Registrar',
                          backgroundColor: Color(0xFF03A9F4),
                          buttonAction: () async {
                            if (emailController.text.isEmpty) {
                              SnackBar snackBar = SnackBar(
                                content: Text('O email não pode ser vazio'),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(snackBar);
                              return;
                            }
                            if (fullNameController.text.isEmpty) {
                              SnackBar snackBar = SnackBar(
                                content: Text('O nome não pode ser vazio'),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(snackBar);
                              return;
                            }
                            if (passwordController.text.isEmpty) {
                              SnackBar snackBar = SnackBar(
                                content: Text('A senha não pode ser vazia'),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(snackBar);
                              return;
                            }

                            if (passwordController.text !=
                                passwordConfirmationController.text) {
                              SnackBar snackBar = SnackBar(
                                content: Text('As senhas não coincidem'),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(snackBar);
                              return;
                            }

                            final supabase = Supabase.instance.client;

                            final response = await supabase.auth.signUp(
                              password: passwordController.text,
                              email: emailController.text,
                            );

                            print(response);
                          },
                        ),
                        CustomTextButton(
                          buttonText: 'Já tem uma conta? Faça login',
                          buttonAction: () {
                            Navigator.pushNamed(
                              context,
                              RoutesEnum.login.route,
                            ); // Named route
                          },
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

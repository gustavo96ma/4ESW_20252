import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zapizapi/repositories/register_repository.dart';
import 'package:zapizapi/repositories/register_repository_implementation.dart';
import 'package:zapizapi/services/register_service.dart';
import 'package:zapizapi/ui/widgets/custom_toast.dart';
import 'package:zapizapi/utils/routes_enum.dart';

/// ViewModel para a tela de registro
class RegisterViewModel extends ChangeNotifier {
  /// Construtor da classe [RegisterViewModel]
  final RegisterRepository repository = RegisterRepositoryImplementation(
    registerService: RegisterService(),
  );

  /// Controladores de texto para os campos do formulário
  final TextEditingController emailController = TextEditingController();

  /// Controladores de texto para os campos do formulário
  final TextEditingController passwordController = TextEditingController();

  /// Controladores de texto para os campos do formulário
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  /// Controladores de texto para os campos do formulário
  final TextEditingController fullNameController = TextEditingController();

  /// Chave global do formulário
  final formKey = GlobalKey<FormState>();
  late FToast _fToast;
  bool _isLoading = false;

  /// Indica se uma operação de carregamento está em andamento
  bool get isLoading => _isLoading;

  /// Instância do FToast para exibir mensagens toast
  FToast get fToast => _fToast;

  /// Realiza o registro do usuário
  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    await repository.sendRegister(fullName, email, password);
  }

  /// Inicializa o FToast com o contexto fornecido
  void initToast(BuildContext context) {
    _fToast = FToast();
    _fToast.init(context);
  }

  /// Validador de email
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'O email precisa ser preenchido';
    }
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value)) {
      return 'Email inválido';
    }
    return null;
  }

  /// Validador de senha
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'A senha precisa ser preenchida';
    }
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  /// Validador de nome completo
  String? fullNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'O nome completo precisa ser preenchido';
    }
    return null;
  }

  /// Validador de confirmação de senha
  String? passwordConfirmationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'A confirmação da senha precisa ser preenchida';
    }
    if (value != passwordController.text) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  /// Ação do botão de registro
  Future<void> registerButtonAction(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    if (!formKey.currentState!.validate()) {
      _isLoading = false;
      notifyListeners();
      return;
    }

    try {
      final navigator = Navigator.of(context);
      await signUp(
        fullName: fullNameController.text,
        password: passwordController.text,
        email: emailController.text,
      );
      await navigateToLogin(navigator);
      fToast.showToast(
        child: const CustomToast(
          errorText:
              '''Registro realizado com sucesso! Verifique seu email para confirmar.''',
          backgroundColor: Colors.green,
          icon: Icons.check_circle,
        ),
        gravity: ToastGravity.TOP,
        toastDuration: const Duration(seconds: 4),
      );
      _isLoading = false;
      notifyListeners();
    } on Exception catch (e) {
      var errorText = 'Erro ao registrar, tente novamente mais tarde!';

      if (e is AuthException && e.statusCode == '422') {
        errorText = 'Este email já está em uso. Tente outro.';
      }

      fToast.showToast(
        child: CustomToast(
          errorText: errorText,
          backgroundColor: Colors.red,
          icon: Icons.error,
        ),
        gravity: ToastGravity.TOP,
        toastDuration: const Duration(seconds: 4),
      );
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Navega para a tela de login
  Future<void> navigateToLogin(NavigatorState navigator) async {
    await navigator.pushNamed(RoutesEnum.login.route);
  }
}

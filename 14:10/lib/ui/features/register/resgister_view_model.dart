import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zapizapi/repositories/register_repository.dart';
import 'package:zapizapi/repositories/register_repository_implementation.dart';
import 'package:zapizapi/services/register_service.dart';
import 'package:zapizapi/ui/widgets/custom_toast.dart';
import 'package:zapizapi/utils/routes_enum.dart';

class RegisterViewModel extends ChangeNotifier {
  final RegisterRepository repository = RegisterRepositoryImplementation(
    registerService: RegisterService(),
  );

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  late FToast _fToast;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  get fToast => _fToast;

  signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    await repository.sendRegister(fullName, email, password);
  }

  initToast(BuildContext context) {
    _fToast = FToast();
    _fToast.init(context);
  }

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

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'A senha precisa ser preenchida';
    }
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  String? fullNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'O nome completo precisa ser preenchido';
    }
    return null;
  }

  String? passwordConfirmationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'A confirmação da senha precisa ser preenchida';
    }
    if (value != passwordController.text) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  registerButtonAction(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    if (!formKey.currentState!.validate()) {
      _isLoading = false;
      notifyListeners();
      return;
    }

    try {
      await signUp(
        fullName: fullNameController.text,
        password: passwordController.text,
        email: emailController.text,
      );
      navigateToLogin(context);
      fToast.showToast(
        child: CustomToast(
          errorText:
              'Registro realizado com sucesso! Verifique seu email para confirmar.',
          backgroundColor: Colors.green,
          icon: Icons.check_circle,
        ),
        gravity: ToastGravity.TOP,
        toastDuration: Duration(seconds: 4),
      );
      _isLoading = false;
      notifyListeners();
    } on Exception catch (e) {
      String errorText = 'Erro ao registrar, tente novamente mais tarde!';

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
        toastDuration: Duration(seconds: 4),
      );
      _isLoading = false;
      notifyListeners();
    }
  }

  void navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, RoutesEnum.login.route);
  }
}

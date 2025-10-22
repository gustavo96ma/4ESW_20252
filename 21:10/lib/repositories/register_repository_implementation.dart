import 'package:zapizapi/repositories/register_repository.dart';
import 'package:zapizapi/services/register_service.dart';

/// Implementação do repositório de registro de usuários
class RegisterRepositoryImplementation implements RegisterRepository {
  /// Construtor da classe [RegisterRepositoryImplementation]
  RegisterRepositoryImplementation({required this.registerService});

  /// Serviço de registro de usuários
  final RegisterService registerService;

  @override
  Future<void> sendRegister(
    String fullName,
    String email,
    String password,
  ) async {
    await registerService.sendRegister(fullName, email, password);
  }
}

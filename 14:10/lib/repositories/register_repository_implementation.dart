import 'package:zapizapi/repositories/register_repository.dart';
import 'package:zapizapi/services/register_service.dart';

class RegisterRepositoryImplementation implements RegisterRepository {
  final RegisterService registerService;

  RegisterRepositoryImplementation({required this.registerService});

  @override
  sendRegister(String fullName, String email, String password) async {
    await registerService.sendRegister(fullName, email, password);
  }
}

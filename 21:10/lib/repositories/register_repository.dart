/// não entendi a recomendação do lint
// ignore: one_member_abstracts
abstract class RegisterRepository {
  /// Envia os dados de registro do usuário para o serviço correspondente
  Future<void> sendRegister(String fullName, String email, String password);
}

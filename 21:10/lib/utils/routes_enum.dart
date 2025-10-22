/// Enumeração das rotas da aplicação
enum RoutesEnum {
  /// Rota de login
  login('/login'),

  /// Rota de registro
  register('/register'),

  /// Rota inicial
  home('/home');

  /// Construtor da enumeração [RoutesEnum]
  const RoutesEnum(this.route);

  /// Caminho da rota
  final String route;
}

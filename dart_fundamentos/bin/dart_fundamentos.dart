void main() {
  // Imprime uma mensagem na tela
  print('Hello World!');

  // Declaração de uma variável do tipo String
  String frase = 'Essa é uma frase';
  print(frase);

  // Declaração de uma variável do tipo inteiro
  int numero = 123;
  print(numero);

  // Declaração de uma variável do tipo double (número decimal)
  double decimal = 10.4;
  print(decimal);

  // O tipo 'num' pode ser inteiro ou decimal
  num teste = 123;
  print(teste);

  // Variáveis booleanas (verdadeiro ou falso)
  bool logicoVerdadeiro = true;
  bool logicoFalso = false;
  print(
    'O valor verdadeiro é: $logicoVerdadeiro e o valor falso é: $logicoFalso',
  );

  // Variável String que pode ser nula (null safety)
  String? testei = null;
  print(testei);

  // Variável booleana que pode ser nula, mas não foi inicializada
  bool? depois;
  print(depois);

  // Variável que será inicializada depois (late)
  late bool? bemDepois;

  // 'var' permite inferência de tipo, pode mudar o valor
  var meteuOLouco = 'Num Compensa';
  meteuOLouco = 'ausdhusahd';
  print(meteuOLouco);

  // 'final' cria uma constante, não pode ser alterada depois de definida
  final joelma = 'A lua me traiu';

  // Também é possível definir o tipo junto com 'final'
  final String patati = 'patata';

  // Lista de Strings
  List<String> frutas = ['maçã', 'laranja', 'manga'];
  print(frutas);

  // Mapa (dicionário) com chave String e valor double
  Map<String, double> notas = {'Gustavo': 9.9, 'Maria': 8.7, 'João': 6.1};
  print(notas);

  // Estrutura de repetição for tradicional
  for (var i = 0; i < 10; i++) {
    print('O valor nessa iteração é: $i');
  }

  // Estrutura de repetição for-in para percorrer listas
  for (var fruta in frutas) {
    print('A fruta $fruta é definitivamente uma fruta');
  }

  // Acessando elementos de uma lista pelo índice
  print('Estou acessando o primeiro elemento de frutas: ${frutas[0]}');

  // Acessando valores de um mapa pela chave
  print(notas['Gustavo']);

  // Transformando todos os elementos da lista para maiúsculo
  frutas = frutas.map((element) => element.toUpperCase()).toList();

  // Embaralhando a lista
  frutas.shuffle();
  print(frutas);

  // String com nome completo
  String nomeCompleto = 'Gustavo Meneghetti Arcolezi';

  // Separando a string pelo espaço e pegando o primeiro nome
  print(nomeCompleto.split(' ')[0]);

  // Imprimindo o mapa de notas
  print(notas);

  // Verificando o tipo de uma variável em tempo de execução
  print(notas.runtimeType);
  print(patati.runtimeType);
  print(numero.runtimeType);

  // Instanciando um objeto da classe Musico
  Musico chimbinha = Musico(tipoSanguineo: 'O-', nome: 'Chimbinha');

  // Acessando propriedades do objeto
  print(chimbinha.nome);
  print(chimbinha.tipoSanguineo);

  // Chamando método do objeto
  chimbinha.tocarMusica();
}

// Definição de uma classe em Dart
class Musico {
  // Propriedades da classe
  String nome;
  String tipoSanguineo;

  // Construtor da classe
  Musico({required this.nome, this.tipoSanguineo = 'A+'});

  // Método da classe
  void tocarMusica() {
    print('pipipi popopo');

    // Exemplo fictício de lógica condicional (o código abaixo não funciona, serve apenas para ilustrar)

    // if (deuCerto) {
    //   pipipi popopo;
    // } else {
    //   return erro;
    // }

    // if (deuErro) {
    //   return erro;
    // }
    // pipipi popopo;
  }
}

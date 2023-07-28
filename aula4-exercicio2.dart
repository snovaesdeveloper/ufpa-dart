// Classe base para representar um veículo
class Veiculo {
  String marca;
  String modelo;
  int anoFabricacao;

  // Construtor da classe
  Veiculo(this.marca, this.modelo, this.anoFabricacao);

  // Método para exibir informações do veículo
  void exibirInformacoes() {
    print('Marca: $marca');
    print('Modelo: $modelo');
    print('Ano de Fabricação: $anoFabricacao');
  }
}

// Classe para representar um carro, herdando de Veiculo
class Carro extends Veiculo {
  int quilometragemPorAno;
  int numeroDePortas;

  // Construtor da classe Carro
  Carro(String marca, String modelo, int anoFabricacao, this.quilometragemPorAno, this.numeroDePortas)
      : super(marca, modelo, anoFabricacao);

  // Método para exibir informações do carro
  @override
  void exibirInformacoes() {
    super.exibirInformacoes();
    print('Quilometragem por Ano: $quilometragemPorAno km');
    print('Número de Portas: $numeroDePortas');
  }
}

// Classe para representar uma moto, herdando de Veiculo
class Moto extends Veiculo {
  int numeroDeCilindradas;
  bool partidaEletrica;

  // Construtor da classe Moto
  Moto(String marca, String modelo, int anoFabricacao, this.numeroDeCilindradas, this.partidaEletrica)
      : super(marca, modelo, anoFabricacao);

  // Método para exibir informações da moto
  @override
  void exibirInformacoes() {
    super.exibirInformacoes();
    print('Número de Cilindradas: $numeroDeCilindradas cc');
    print('Partida Elétrica: ${partidaEletrica ? "Sim" : "Não"}');
  }
}

void main() {
  // Criando um carro com dados fictícios
  Carro meuCarro = Carro('MontadoraX', 'ModeloCarro', 2022, 15000, 4);

  // Criando uma moto com dados fictícios
  Moto minhaMoto = Moto('MontadoraY', 'ModeloMoto', 2021, 500, true);

  // Exibindo as informações do carro e da moto
  meuCarro.exibirInformacoes();
  print(''); // Adicionando uma linha em branco para separar as informações
  minhaMoto.exibirInformacoes();
}

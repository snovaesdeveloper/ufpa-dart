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
  double precoBase;

  // Construtor da classe Carro
  Carro(String marca, String modelo, int anoFabricacao, this.quilometragemPorAno, this.numeroDePortas)
      : super(marca, modelo, anoFabricacao) {
    this.precoBase = 30000; // Preço base fictício para carros
  }

  // Método para calcular o texto do adesivo do carro
  String calcularAdesivoCarro() {
    if (quilometragemPorAno < 15000) {
      return 'Seminovo';
    } else if (quilometragemPorAno >= 15000 && quilometragemPorAno <= 20000) {
      return 'Usado';
    } else {
      return 'Antigo';
    }
  }

  // Método para calcular o preço adicional do carro
  double calcularPrecoAdicionalCarro() {
    return (numeroDePortas * 1000) + (quilometragemPorAno * 0.01);
  }

  // Método para calcular o preço total do carro
  double calcularPrecoTotalCarro() {
    return precoBase + calcularPrecoAdicionalCarro();
  }

  // Método para exibir informações do carro
  @override
  void exibirInformacoes() {
    super.exibirInformacoes();
    print('Quilometragem por Ano: $quilometragemPorAno km');
    print('Número de Portas: $numeroDePortas');
    print('Preço Total: R\$${calcularPrecoTotalCarro().toStringAsFixed(2)}');
  }
}

// Classe para representar uma moto, herdando de Veiculo
class Moto extends Veiculo {
  int numeroDeCilindradas;
  bool partidaEletrica;
  double precoBase;

  // Construtor da classe Moto
  Moto(String marca, String modelo, int anoFabricacao, this.numeroDeCilindradas, this.partidaEletrica)
      : super(marca, modelo, anoFabricacao) {
    this.precoBase = 15000; // Preço base fictício para motos
  }

  // Método para calcular o texto do adesivo da moto
  String calcularAdesivoMoto() {
    if (numeroDeCilindradas < 125) {
      return 'Leve';
    } else if (numeroDeCilindradas >= 125 && numeroDeCilindradas <= 500) {
      return 'Normal';
    } else {
      return 'Esportiva';
    }
  }

  // Método para calcular o preço adicional da moto
  double calcularPrecoAdicionalMoto() {
    return (numeroDeCilindradas * 0.05) + (partidaEletrica ? 500 : 0);
  }

  // Método para calcular o preço total da moto
  double calcularPrecoTotalMoto() {
    return precoBase + calcularPrecoAdicionalMoto();
  }

  // Método para exibir informações da moto
  @override
  void exibirInformacoes() {
    super.exibirInformacoes();
    print('Número de Cilindradas: $numeroDeCilindradas cc');
    print('Partida Elétrica: ${partidaEletrica ? "Sim" : "Não"}');
    print('Preço Total: R\$${calcularPrecoTotalMoto().toStringAsFixed(2)}');
  }
}

void main() {
  // Criando um carro com dados fictícios
  Carro meuCarro = Carro('MontadoraX', 'ModeloCarro', 2022, 12000, 4);

  // Criando uma moto com dados fictícios
  Moto minhaMoto = Moto('MontadoraY', 'ModeloMoto', 2021, 300, true);

  // Exibindo as informações do carro e da moto
  print('Carro:');
  meuCarro.exibirInformacoes();
  print('Adesivo: ${meuCarro.calcularAdesivoCarro()}');
  print(''); // Adicionando uma linha em branco para separar as informações

  print('Moto:');
  minhaMoto.exibirInformacoes();
  print('Adesivo: ${minhaMoto.calcularAdesivoMoto()}');
}

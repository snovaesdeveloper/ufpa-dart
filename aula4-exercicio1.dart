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

void main() {
  // Criando um veículo com dados fictícios
  Veiculo meuVeiculo = Veiculo('MontadoraX', 'ModeloY', 2023);

  // Exibindo as informações do veículo
  meuVeiculo.exibirInformacoes();
}

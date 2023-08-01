import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

// Função assíncrona que consulta a API ViaCEP para obter os dados do CEP informado
Future<Map<String, dynamic>> fetchData(String cep) async {
  final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Falha ao consultar o CEP. Status: ${response.statusCode}');
  }
}



// Programa principal que permite ao usuário informar o CEP e exibe os dados obtidos
void main() async {
  try {
    // Leitura do CEP informado pelo usuário
    print("Digite o CEP: ");
    String cep = stdin.readLineSync();

    // Removendo caracteres não numéricos do CEP
    cep = cep.replaceAll(RegExp(r'[^0-9]'), '');

    if (cep.length != 8) {
      print("CEP inválido. Certifique-se de digitar apenas os números.");
      return;
    }

    // Chamando a função fetchData usando await
    Map<String, dynamic> data = await fetchData(cep);

    // Exibindo os dados obtidos
    print("Dados do CEP $cep:");
    print("Logradouro: ${data['logradouro']}");
    print("Bairro: ${data['bairro']}");
    print("Cidade: ${data['localidade']}");
    print("Estado: ${data['uf']}");
  } catch (e) {
    print("Ocorreu um erro: $e");
  }
}

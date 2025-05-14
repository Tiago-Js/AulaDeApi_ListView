import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GridViewBuilder extends StatefulWidget {
  const GridViewBuilder({super.key});

  @override
  State<GridViewBuilder> createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
  //função para me trazer os dados dos usuarios
  Future<void> getDadosUsers() async {
    //a variavel response ira guardar esse resultado recebido
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    print(response.body);
  } //////1522

  //  final List<String> produtos = ["Camiseta", "Calça", "Boné", "Meias"];
  final List<String> produtos = [
    "Roteador rx15",
    "Roteador L23",
    "Roteador Plus",
    "Roteador tenda",
  ];
  final List<String> marca = ["V-SOL", "INTEL BRAZ", "HAWAI", "MULTILASER"];

  final List<String> estado = ["NOVO", "USADO", "NOVO", "DANIFICADO"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDadosUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ////////////////////////////////////////////////////////////// TITULO DAS COLUNAS //////////////////////////////////////////////////////////
          Container(
            color:
                Colors.amber, // cor geral == duvida mude a cor para enchergar
            child: Flex(
              // usa o flex para jogar na horizontal
              direction: Axis.horizontal,
              children: [
                Expanded(
                  //vai espandir as colonas
                  flex: 1,
                  child: Container(
                    //  container onde os dados irão ficar
                    padding: EdgeInsets.all(10), //espaçamento dos textos
                    decoration: BoxDecoration(
                      //esse decoration é pra selecionar a cor das bordas
                      border: Border.all(color: Colors.black),
                    ),
                    height: 50,
                    child: Text("Nome"),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    height: 50,
                    child: Text("Marca"),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    height: 50,
                    child: Text("Estado"),
                  ),
                ),
              ],
            ),
          ),

          /////////////////////////////// FIM TITULO DAS COLUNAS ///////////////////////////////////////////////////////
          Expanded(
            // Uso o expanded para expandir os dado
            child: ListView.builder(
              //vou exibir a lista
              scrollDirection: Axis.vertical, //mover tudo para verstical
              itemCount: produtos.length, //vai contar os itens da lisa produto
              itemBuilder: (context, index) {
                return Container(
                  // me retonar um container geral
                  color: const Color(0x2D9E721B), // cor do container geral
                  //chamo as outras colunas na tabela
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(produtos[index]),
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(marca[index]),
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(estado[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

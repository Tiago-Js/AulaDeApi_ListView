import 'dart:convert'; //impotar a biblioteca "dart:covert" para utilizarmos o jsonDecode
import 'package:flutter/material.dart';
import 'package:flutter_gridviewbuilder/models/userDados.dart'; // importamos nosso dados desse model (UserDados)
import 'package:http/http.dart' as http;

class AulaListView extends StatefulWidget {
  const AulaListView({super.key});

  @override
  State<AulaListView> createState() => _AulaListViewState();
}

class _AulaListViewState extends State<AulaListView> {
  //função (getUserDados)
  Future<List<UserDados>> getUserDados() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      //guardamos aqui a converção de JSON para objetos na variavel "json"
      final json = jsonDecode(response.body);
      return List<UserDados>.from(
        //retorno uma lista com o osbjetos do tipo UserDados realizando
        //o map de cada elemento do objeto JSON
        //transformando um a um em objetos UserDados
        json.map((elemento) {
          return UserDados.fromJson(elemento);
        }),
      );
    } else {
      return Future.error("Alerta: Um erro aconteceu");
    }
  } //final da função

  
 
  

  Future<List<UserDados>>? futureUsers;

  @override
  void initState() {
    futureUsers = getUserDados();
    // TODO: implement initState
    super.initState();
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
                    child: Text("Nome de usuário"),
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
                    child: Text("@Email"),
                  ),
                ),
              ],
            ),
          ),
          /////////////////////////////// FIM TITULO DAS COLUNAS ///////////////////////////////////////////////////////
          FutureBuilder(
            future: futureUsers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final user = snapshot.data as List<UserDados>;
                return Expanded(
                  child: ListView.builder(
                    //vou exibir a lista
                    scrollDirection: Axis.vertical, // mover tudo para vertical
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      return Container(
                        //chamo um container geral
                        color: const Color(
                          0x2D9E721B,
                        ), // cor do container geral
                        // chamo outras colunas
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
                                  child: Text(
                                    user[index].nome,
                                    style: TextStyle(color: Colors.black),
                                  ),
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
                                  child: Text(
                                    user[index].nomeUser,
                                    style: TextStyle(color: Colors.black),
                                  ),
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
                                  child: Text(
                                    user[index].email,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}

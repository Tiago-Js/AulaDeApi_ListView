//convertendo os dados em objetos (model)
class UserDados {
  String nome;
  String nomeUser;
  String email;

  UserDados({required this.nome, required this.nomeUser, required this.email});

  UserDados.fromJson(Map<String, dynamic> json)
    : nome = json['name'].toString(), //(toString = (convertendo para))
      nomeUser = json['username'].toString(),
      email = json['email'].toString();
}

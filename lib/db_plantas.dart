//Desenvolvido por Ericódgigos

import 'dart:core';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void principal() async {
  //******************************************************** */
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'plantas_basedados.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE BD_plantas(id INTEGER PRIMARY KEY, nome TEXT, apelido TEXT, idade INTEGER)",
      );
    },
    version: 1,
  );
  //******************************************************** */
  Future<void> inserirPlanta(Planta planta) async {
    final Database db = await database;

    await db.insert(
      'BD_plantas',
      planta.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  //******************************************************** */
  Future<List<Planta>> listaPlantas() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('BD_plantas');

    return List.generate(maps.length, (i) {
      return Planta(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        apelido: maps[i]['apelido'],
        idade: maps[i]['idade'],
      );
    });
  }
  //******************************************************** */
  Future<void> atualizaPlanta(Planta planta) async {
    final db = await database;

    await db.update(
      'BD_plantas',
      planta.toMap(),
      where: "id = ?",
      whereArgs: [planta.id],
    );
  }
  //******************************************************** */
  Future<void> deletarPlanta(int id) async{
    final db = await database;
    await db.delete(
      'BD_plantas',
      where: "id = ?",
      whereArgs: [id],
      );
  }

//******************************************************** */
var jabo = Planta(
  id: 0,
  nome: 'Jaboticabeira',
  apelido: 'Fiinha',
  idade: 6
);
//******************************************************** */
await inserirPlanta(jabo);
print(await listaPlantas());
jabo = Planta(
  id: jabo.id,
  nome: jabo.nome,
  apelido: jabo.apelido,
  idade: jabo.idade + 1
);
await atualizaPlanta(jabo);
print(await listaPlantas());
deletarPlanta(jabo.id);
print(await listaPlantas());


//******************************************************** */
}
class Planta {
  final int id;
  final String nome;
  final String apelido;
  final int idade;

  Planta({this.id, this.nome, this.apelido, this.idade});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'apelido': apelido,
      'idade': idade,
    };
  }
}
//******************************************************** */
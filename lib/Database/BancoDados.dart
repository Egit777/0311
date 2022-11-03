import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/ClienteModel.dart';

class BancoDados {
  BancoDados(); //construtor

  static criarBanco() async {
    final caminhoBancoDados =
        await getDatabasesPath(); //capturaram local onde fica os dbs do celular!
    final localBancoDados = join(caminhoBancoDados, "gasosa.db");

    var db = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersao) {
        String sqlcomando =
            "CREATE TABLE clientes( id INTEGER PRIMARY KEY AUTOINCREMENT, data DATATIME, litro INTEGER, endereco TEXT, km REAL, valortotal REAL, valorLitro INTEGER, consumokm INTEGER  )";
        db.execute(sqlcomando);
      },
    );
    return db;
  }

  static inserirnoBanco(ClienteModel cliente) async {
    Database db = await BancoDados.criarBanco();
    String sqlcomando =
        "INSERT INTO clientes (data, litro, endereco, km, valortotal, valorlitro, consumokm) "
        " VALUES (' ${cliente.data} ', ' ${cliente.litro} ', ' ${cliente.endereco} ', ' ${cliente.km}', ' ${cliente.valortotal} ', ' ${cliente.valorlitro} ', ' ${cliente.consumokm}' );"; //comando sql para adicionar clientes em tal coluna e tal valores!
    var a = await db.execute(sqlcomando);
    List<Map> listdado = await db.rawQuery('SELECT * FROM clientes');

    print(listdado);
  }

  static deleteMemo(ClienteModel cliente) async {
    //returns number of items deleted
    Database db = await BancoDados.criarBanco();

    int result = await db.delete("clientes", //table name
        where: "id = ?",
        whereArgs: [1] // use whereArgs to avoid SQL injection
        );

    return result;
  }
}

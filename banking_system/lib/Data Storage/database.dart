import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:banking_system/Classes/customer.dart';
import 'package:banking_system/Classes/transaction.dart';

class DatabaseHelper{
  static final DatabaseHelper instance=DatabaseHelper._init();
  static Database? _database; 
  DatabaseHelper._init(); 
  Future<Database> get database async{
    if(_database!=null) return _database!;
    _database=await _initDatabase('bank.db');  
    return _database!;
  }
  Future<Database> _initDatabase(String filepath) async{
    final dbpath=await getDatabasesPath();
    final path=join(dbpath,filepath);
    return await openDatabase(path,version: 1,onCreate: createDatabase);
  }
  Future createDatabase(Database db,int version) async{
    final idType='INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType='TEXT NOT NULL';
    final integerType='INTEGER NOT NULL';
    await db.execute(
      '''
      CREATE TABLE $tableName(
        ${CustomerTableFields.commonColumn} $idType,
        ${CustomerTableFields.firstColumnName} $textType, 
        ${CustomerTableFields.secondColumnName} $textType,
        ${CustomerTableFields.thirdColumnName} $textType,
        ${CustomerTableFields.fourthColumnName} $integerType,
        ${CustomerTableFields.fifthColumnName} $textType,
        ${CustomerTableFields.sixthColumnName} $integerType,
        ${CustomerTableFields.seventhColumnName} $textType
      )
      '''
    );
    await db.execute(
        '''
      CREATE TABLE $transaction_tableName(
        ${TransactionTableFields.commonColumn} $idType,
        ${TransactionTableFields.firstColumnName} $textType, 
        ${TransactionTableFields.secondColumnName} $textType,
        ${TransactionTableFields.thirdColumnName} $integerType
      )
      '''
    );

    await db.insert(tableName, c1.toJson());
    await db.insert(tableName, c2.toJson());
    await db.insert(tableName, c3.toJson());
    await db.insert(tableName, c4.toJson());
    await db.insert(tableName, c5.toJson());
    await db.insert(tableName, c6.toJson());
    await db.insert(tableName, c7.toJson());
    await db.insert(tableName, c8.toJson());
    await db.insert(tableName, c9.toJson());
    await db.insert(tableName, c10.toJson());
    await db.insert(tableName, c11.toJson());
    await db.insert(tableName, c12.toJson());
    await db.insert(tableName, c13.toJson());
    await db.insert(tableName, c14.toJson());
    await db.insert(tableName, c15.toJson());
  }
  Future<Customer> insertCustomerRecord(Customer user) async{
    final db=await instance.database;
    final id=await db.insert(tableName,user.toJson());
    return user.copy(id: id);
  }
  Future insertCustomerTransaction(Transactions customerTransaction) async {
    final db = await instance.database;
    await db.insert(transaction_tableName, customerTransaction.toJson());
  }
  Future<Customer> readRecord(int id) async{
    final db=await instance.database;
    final maps=await db.query(
      tableName,
      columns: CustomerTableFields.values,
      where: '${CustomerTableFields.commonColumn}=?',
      whereArgs: [id],
    );
    if(maps.isNotEmpty){
      return Customer.fromJson(maps.first);
    }else{
      throw Exception('ID $id not found.');
    }
  }
  Future<Customer> readSpecificRecord(String customerCNIC) async{
    final db=await instance.database;
    final maps=await db.query(
      tableName,
      columns: CustomerTableFields.values,
      where: '${CustomerTableFields.thirdColumnName}=?',
      whereArgs: [customerCNIC],
    );
    if(maps.isNotEmpty){
      return Customer.fromJson(maps.first);
    }else{
      throw Exception('CNIC number $customerCNIC not found.');
    }
  }
  Future<List<Customer>> readAllRecords() async{
    final db=await instance.database;
    final result=await db.query(tableName);
    return result.map((json)=>Customer.fromJson(json)).toList();
  }
  Future<List<Transactions>> readAllCustomerTransactions() async {
    final db = await instance.database;
    final result = await db.query(transaction_tableName);
    if (result.isEmpty) {
      return [];
    } else {
      return result.map((json) => Transactions.fromJson(json)).toList();
    }
  }
  Future<int> updateRecord(Customer user) async{
    final db=await instance.database;
    return await db.update(
      tableName,
      user.toJson(),
      where: '${CustomerTableFields.commonColumn}=?',
      whereArgs: [user.id],
    );
  }
  Future<int> deleteCustomerRecord(int id) async{
    final db=await instance.database;
    return await db.delete(
      tableName,
      where: '${CustomerTableFields.commonColumn}=?',
      whereArgs: [id],
    );
  }
  Future<int> deleteCustomerTransaction(int id) async{
    final db=await instance.database;
    return await db.delete(
      transaction_tableName,
      where: '${TransactionTableFields.commonColumn}=?',
      whereArgs: [id],
    );
  }
  Future closeDatabase() async{
    final db=await instance.database;
    db.close();
  }
}








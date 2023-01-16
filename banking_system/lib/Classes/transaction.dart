final String transaction_tableName='Transactions_History';
class TransactionTableFields{
  static final List<String> values=[commonColumn,firstColumnName,secondColumnName,thirdColumnName];
  static final String commonColumn='_TransactionID';
  static final String firstColumnName='SenderName';
  static final String secondColumnName='ReceiverName';
  static final String thirdColumnName='AmountOfTransaction';
}

class Transactions{
  final int? id;
  final String senderName;
  final String receiverName;
  final int transferedBalance;
  Transactions({
    this.id,
    required this.senderName,
    required this.receiverName,
    required this.transferedBalance,
  });

  static Transactions fromJson(Map<String,Object?> json)=>Transactions(
    id: json[TransactionTableFields.commonColumn] as int?,
    senderName: json[TransactionTableFields.firstColumnName] as String,
    receiverName: json[TransactionTableFields.secondColumnName] as String,
    transferedBalance: json[TransactionTableFields.thirdColumnName] as int,
  );

  Map<String,Object?> toJson()=>{
    TransactionTableFields.commonColumn: id,
    TransactionTableFields.firstColumnName: senderName,
    TransactionTableFields.secondColumnName: receiverName,
    TransactionTableFields.thirdColumnName: transferedBalance,
  };
}





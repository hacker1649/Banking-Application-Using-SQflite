final String tableName='Customer_Records';
class CustomerTableFields{
  static final List<String> values=[commonColumn,firstColumnName,secondColumnName,thirdColumnName,fourthColumnName,fifthColumnName,sixthColumnName,seventhColumnName];
  static final String commonColumn='_CustomerID';
  static final String firstColumnName='FullName';
  static final String secondColumnName='EmailAddress';
  static final String thirdColumnName='CnicNumber';
  static final String fourthColumnName='AccountNumber';
  static final String fifthColumnName='PhoneNumber';
  static final String sixthColumnName='CurrentBalance';
  static final String seventhColumnName='Region';
}

class Customer{
  final int? id;
  final String name;
  final String emailAddress;
  final int accountNumber;
  final String phoneNumber;
  final String cnic;
  final int currentBalance;
  final String region;
  Customer({
    this.id,
    required this.name,
    required this.emailAddress,
    required this.accountNumber,
    required this.phoneNumber,
    required this.cnic,
    required this.currentBalance,
    required this.region,
  });

  Customer copy({
    int? id,
    String? name,
    String? emailAddress,
    int? accountNumber,
    String? phoneNumber,
    String? cnic,
    int? currentBalance,
    String? region,
  })=>Customer(
    id: id ?? this.id,
    name: name ?? this.name,
    emailAddress: emailAddress ?? this.emailAddress,
    accountNumber: accountNumber ?? this.accountNumber,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    cnic: cnic ?? this.cnic,
    currentBalance: currentBalance ?? this.currentBalance,
    region: region ?? this.region,
  );

  static Customer fromJson(Map<String,Object?> json)=>Customer(
    id: json[CustomerTableFields.commonColumn] as int?,
    name: json[CustomerTableFields.firstColumnName] as String,
    emailAddress: json[CustomerTableFields.secondColumnName] as String,
    cnic:  json[CustomerTableFields.thirdColumnName] as String,
    accountNumber: json[CustomerTableFields.fourthColumnName] as int,
    phoneNumber: json[CustomerTableFields.fifthColumnName] as String,
    currentBalance: json[CustomerTableFields.sixthColumnName] as int,
    region: json[CustomerTableFields.seventhColumnName] as String,
  );
  
  Map<String,Object?> toJson()=>{
    CustomerTableFields.commonColumn:id,
    CustomerTableFields.firstColumnName:name,
    CustomerTableFields.secondColumnName:emailAddress,
    CustomerTableFields.thirdColumnName:cnic,
    CustomerTableFields.fourthColumnName:accountNumber,
    CustomerTableFields.fifthColumnName:phoneNumber,
    CustomerTableFields.sixthColumnName:currentBalance,
    CustomerTableFields.seventhColumnName:region,
  }; 
}


Customer c1=Customer(
  name: 'William Faulkner',
  emailAddress: 'william.faulkner1@gmail.com',
  accountNumber: 2011423493,
  phoneNumber: '+44 121 496 0040',
  cnic: '15602-0289805-9',
  currentBalance: 28692,
  region: 'Manchester',
);
Customer c2=Customer(
  name: 'James Anderson',
  emailAddress: 'james.anderson2@gmail.com',
  accountNumber: 1021241382,
  phoneNumber: '+44 1223 496 0234',
  cnic: '34101-2401542-5',
  currentBalance: 38313,
  region: 'Birmingham',
);
Customer c3=Customer(
  name: 'Maria Hernandez',
  emailAddress: 'maria.hernandez3@gmail.com',
  accountNumber: 1021244508,
  phoneNumber: '+44 151 9496 0840',
  cnic: '35202-2583184-3',
  currentBalance: 26850,
  region: 'Liverpool',
);
Customer c4=Customer(
  name: 'David Smith',
  emailAddress: 'david.smith4@gmail.com',
  accountNumber: 2010961556,
  phoneNumber: '+44 20 7946 0100',
  cnic: '61101-6520474-9',
  currentBalance: 30507,
  region: 'London',
);
Customer c5=Customer(
  name: 'Toni Morrison',
  emailAddress: 'toni.morrison5@gmail.com',
  accountNumber: 1030017756,
  phoneNumber: '+44 1223 496 0065',
  cnic: '300-92-233472',
  currentBalance: 32092,
  region: 'Birmingham',
);
Customer c6=Customer(
  name: 'Herman Melville',
  emailAddress: 'herman.melville6@gmail.com',
  accountNumber: 1020283687,
  phoneNumber: '+44 121 496 0622',
  cnic: '33100-6104898-1',
  currentBalance: 31294,
  region: 'Manchester',
);
Customer c7=Customer(
  name: 'Samuel Johnson',
  emailAddress: 'samuel.johnson7@gmail.com',
  accountNumber: 2011024735,
  phoneNumber: '+44 20 7946 0796',
  cnic: '34603-3974904-1',
  currentBalance: 27836,
  region: 'London',
);
Customer c8=Customer(
  name: 'Shannon Hale',
  emailAddress: 'shannon.hale8@gmail.com',
  accountNumber: 1180075487,
  phoneNumber: '+44 151 9496 0919',
  cnic: '34603-2161654-7',
  currentBalance: 34810,
  region: 'Liverpool',
);
Customer c9=Customer(
  name: 'Robert Frost',
  emailAddress: 'robert.frost9@gmail.com',
  accountNumber: 1020249308,
  phoneNumber: '+44 1223 496 0210',
  cnic: '300-65-589567',
  currentBalance: 34810,
  region: 'Birmingham',
);
Customer c10=Customer(
  name: 'Jodi Picoult',
  emailAddress: 'jodi.picoult10@gmail.com',
  accountNumber: 1010956419,
  phoneNumber: '+44 20 7946 0254',
  cnic: '330-51-363786',
  currentBalance: 40000,
  region: 'London',
);
Customer c11=Customer(
  name: 'Alexandra Mills',
  emailAddress: 'alexandra.mills11@gmail.com',
  accountNumber: 01011312803,
  phoneNumber: '+44 716 337 3218',
  cnic: '33302-2225261-7',
  currentBalance: 10234,
  region: 'Germany',
);
Customer c12=Customer(
  name: 'Amanda Suarez',
  emailAddress: 'amanda.saurez12@gmail.com',
  accountNumber: 01021247140,
  phoneNumber: '+44 716 873 5585',
  cnic: '42101-0145180-5',
  currentBalance: 50100,
  region: 'Monaco',
);
Customer c13=Customer(
  name: 'Courtney Brown',
  emailAddress: 'courtney.brown13@gmail.com',
  accountNumber: 01190000646,
  phoneNumber: '+44 716 285 3923',
  cnic: '44206-5948819-5',
  currentBalance:  13788,
  region: 'Norway',
);
Customer c14=Customer(
  name: 'Dave Wallace',
  emailAddress: 'dace.wallace14@gmail.com',
  accountNumber: 02011473508,
  phoneNumber: '+44 716 996 6510',
  cnic: '11101-5550216-5',
  currentBalance:  15000,
  region: 'Senegal',
);
Customer c15=Customer(
  name: 'Blanca Walker',
  emailAddress: 'blanca.walker15@gmail.com',
  accountNumber: 02050377714,
  phoneNumber: '+44 716 327 8369',
  cnic: '42301-0869878-1',
  currentBalance:  28764,
  region: 'Japan',
);











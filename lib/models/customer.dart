class Customer {
  final String personType;
  final String document;
  final String corporateName;
  final String tradeName;
  final String email;
  final String store;
  final dynamic attributes;

  Customer({
    required this.personType,
    required this.document,
    required this.corporateName,
    required this.tradeName,
    required this.email,
    required this.store,
    required this.attributes
  });

  factory Customer.formMap(Map<String, dynamic> map){
    return Customer(
      personType: map['personType'],
      document: map['document'],
      corporateName: map['corporateName'],
      tradeName: map['tradeName'],
      email: map['email'],
      store: map['store'],
      attributes: map['attributes'] as dynamic,
    );
  }
}
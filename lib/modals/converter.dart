class Converter {
  
  double amount;
  
  Converter({required this.amount});
  
  factory Converter.fromMap ({required double data}){
    return Converter(amount: data);
  }
  
}
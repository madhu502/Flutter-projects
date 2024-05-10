class SimpleInterestModel {
  final int principal;
  final int rate;
  final int time;

  SimpleInterestModel({
    required this.principal,
    required this.rate,
    required this.time,
  });

  int simpleInterest() {
    return (principal * rate * time ~/ 100);
  }
}

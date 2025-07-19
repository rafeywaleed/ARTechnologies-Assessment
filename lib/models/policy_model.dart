class Policy {
  final String name;
  final String number;
  final String status;
  final String nextPremiumDue;
  final String startDate;
  final String maturityDate;
  final String sumAssured;
  final String premiumFrequency;
  final String lastPremiumPaid;
  final String nextPremiumAmount;

  Policy({
    required this.name,
    required this.number,
    required this.status,
    required this.nextPremiumDue,
    required this.startDate,
    required this.maturityDate,
    required this.sumAssured,
    required this.premiumFrequency,
    required this.lastPremiumPaid,
    required this.nextPremiumAmount,
  });

  factory Policy.fromJson(Map<String, dynamic> json) {
    return Policy(
      name: json['name'] ?? 'No Name',
      number: json['number'] ?? 'No Number',
      status: json['status'] ?? 'Unknown',
      nextPremiumDue: json['nextPremiumDue'] ?? 'N/A',
      startDate: json['startDate'] ?? 'N/A',
      maturityDate: json['maturityDate'] ?? 'N/A',
      sumAssured: json['sumAssured'] ?? '\$0',
      premiumFrequency: json['premiumFrequency'] ?? 'N/A',
      lastPremiumPaid: json['lastPremiumPaid'] ?? 'N/A',
      nextPremiumAmount: json['nextPremiumAmount'] ?? '\$0',
    );
  }
}

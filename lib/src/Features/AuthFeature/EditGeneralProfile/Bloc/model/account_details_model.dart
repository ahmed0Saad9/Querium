class AccountDetailsModel {
  AccountDetailsModel({
    required this.id,
    required this.image,
    required this.reference,
    required this.name,
    required this.email,
    required this.phone,
    required this.verified,
    required this.hasPinCode,
    required this.walletStatus,
    required this.hasApprovedWallet,
    required this.address,
    required this.generalBalance,
    required this.investmentBalance,
    required this.rank,
    required this.creditLimit,
    required this.city,
  });
  late final int id;
  late final String image;
  late final String reference;
  late final String name;
  late final String email;
  late final String phone;
  late final bool verified;
  late final bool hasPinCode;
  late final WalletStatus walletStatus;
  late final bool hasApprovedWallet;
  late final String address;
  late final GeneralBalance generalBalance;
  late final InvestmentBalance investmentBalance;
  late final Rank rank;
  late final CreditLimit creditLimit;
  late final City city;

  AccountDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    image = json['image'] ?? '';
    reference = json['reference'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    phone = json['phone'] ?? '';
    verified = json['verified'] ?? false;
    hasPinCode = json['hasPinCode'] ?? false;
    walletStatus = WalletStatus.fromJson(json['WalletStatus']);
    hasApprovedWallet = json['hasApprovedWallet'] ?? false;
    address = json['address'] ?? '';
    generalBalance = GeneralBalance.fromJson(json['general_balance']);
    investmentBalance = InvestmentBalance.fromJson(json['investment_balance']);
    rank = Rank.fromJson(json['rank']);
    creditLimit = CreditLimit.fromJson(json['credit_limit']);
    city = City.fromJson(json['city']);
  }
}

class WalletStatus {
  WalletStatus({
    required this.value,
    required this.label,
  });
  late final String value;
  late final String label;

  WalletStatus.fromJson(Map<String, dynamic> json) {
    value = json['value'] ?? '';
    label = json['label'] ?? '';
  }
}

class GeneralBalance {
  GeneralBalance({
    required this.amount,
    required this.formatted,
  });
  late final int amount;
  late final String formatted;

  GeneralBalance.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] ?? 0;
    formatted = json['formatted'] ?? '';
  }
}

class InvestmentBalance {
  InvestmentBalance({
    required this.amount,
    required this.formatted,
  });
  late final int amount;
  late final String formatted;

  InvestmentBalance.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] ?? 0;
    formatted = json['formatted'] ?? '';
  }
}

class Rank {
  Rank({
    required this.id,
    required this.title,
    required this.minPoints,
    required this.maxPoints,
    required this.description,
    required this.mainColor,
    required this.secondaryColor,
  });
  late final int id;
  late final String title;
  late final int minPoints;
  late final int maxPoints;
  late final String description;
  late final String mainColor;
  late final String secondaryColor;

  Rank.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? '';
    minPoints = json['min_points'] ?? 0;
    maxPoints = json['max_points'] ?? 0;
    description = json['description'] ?? '';
    mainColor = json['main_color'] ?? '';
    secondaryColor = json['secondary_color'] ?? '';
  }
}

class CreditLimit {
  CreditLimit({
    required this.amount,
    required this.formatted,
    required this.formattedString,
  });
  late final int amount;
  late final String formatted;
  late final String formattedString;

  CreditLimit.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] ?? 0;
    formatted = json['formatted'] ?? '';
    formattedString = json['formatted_string'] ?? '';
  }
}

class City {
  City({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

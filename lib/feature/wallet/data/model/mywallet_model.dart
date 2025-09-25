class MywalletModel {
  int? userId;
  int? walletId;
  int? babance;
  String? currency;
  String? createdAt;
  String? updatedAt;
  String? lastAuth;

  MywalletModel({
    this.babance,
    this.createdAt,
    this.currency,
    this.lastAuth,
    this.updatedAt,
    this.userId,
    this.walletId,
  });

  static MywalletModel fromJson(Map<String, dynamic> json) => MywalletModel(
    userId: json['user_id'],
    walletId: json['wallet_id'],
    babance: json['balance'],
    currency: json['currency'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    lastAuth: json['last_auth'],
  );
}

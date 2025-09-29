class TransactionModel {
  int? userId;
  int? orderId;
  dynamic amount;
  bool? status;
  String? paymentBy;
  String? createdAt;
  TransactionModel({
    this.amount,
    this.createdAt,
    this.orderId,
    this.status,
    this.userId,
    this.paymentBy,
  });

 static TransactionModel fromJson(Map<String, dynamic> json) => TransactionModel(
    amount: json['amount'],
    createdAt: json['created_at'],
    orderId: json['order_id'],
    status: json['status'],
    userId: json['user_id'],
    paymentBy: json['payment_by'],
  );

  toJson() {
    return {
      "user_id": userId,
      "order_id": orderId,
      "amount": amount,
      "status": status,
      "payment_by": paymentBy,
      "created_at": createdAt,
    };
  }
}

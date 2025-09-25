class TransactionModel {
  int? userId;
  int? orderId;
  dynamic amount;
  bool? status;
  String? createdAt;
  TransactionModel({
    this.amount,
    this.createdAt,
    this.orderId,
    this.status,
    this.userId,
  });
  toJson() {
    return {
      "user_id": userId,
      "order_id": orderId,
      "amount": amount,
      "status": status,
      "created_at": createdAt,
    };
  }
}

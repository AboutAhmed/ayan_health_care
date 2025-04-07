class BillModel {
  final int? id;
  final String? dateTime;
  final String? invoiceId;
  final double? grandTotal;

  BillModel({
    this.id,
    this.dateTime,
    this.invoiceId,
    this.grandTotal,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) {
    return BillModel(
      id: json['ID'] != null ? json['ID'] as int : null,
      dateTime: json['DateTime'] ?? "",
      invoiceId: json['InvoiceID'] ?? "",
      grandTotal: (json['GrandTotal'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'DateTime': dateTime,
      'InvoiceID': invoiceId,
      'GrandTotal': grandTotal,
    };
  }

  static List<BillModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => BillModel.fromJson(json)).toList();
  }
}

class BillResponse {
  final List<BillModel> bills;

  BillResponse({required this.bills});

  factory BillResponse.fromJson(Map<String, dynamic> json) {
    return BillResponse(
      bills: (json['Response']['Response'] as List)
          .map((item) => BillModel.fromJson(item))
          .toList(),
    );
  }
}

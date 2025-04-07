class ForgotPasswordModel {
  final Meta meta;
  final Map<String, dynamic> response;

  ForgotPasswordModel({required this.meta, required this.response});

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordModel(
      meta: Meta.fromJson(json['Meta']),
      response: json['Response'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Meta': meta.toJson(),
      'Response': response,
    };
  }
}

class Meta {
  final int status;
  final String message;

  Meta({required this.status, required this.message});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      status: int.tryParse(json['Status'].toString()) ??
          0, // Convert String to int safely
      message: json['Message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Status': status,
      'Message': message,
    };
  }
}

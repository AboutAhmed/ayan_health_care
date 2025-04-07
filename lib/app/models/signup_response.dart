

// Meta class to represent the Meta part of the response
class Meta {
  final String status;
  final String message;

  Meta({required this.status, required this.message});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      status: json['Status'] as String,
      message: json['Message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Status': status,
      'Message': message,
    };
  }
}

// Response class to represent the Response part of the response
class ApiResponse {
  final String response;

  ApiResponse({required this.response});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      response: json['Response'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Response': response,
    };
  }
}

// Main response model class
class SignupResponse {
  final Meta meta;
  final ApiResponse? response;

  SignupResponse({required this.meta, this.response});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      meta: Meta.fromJson(json['Meta']),
      response: json['Response'] != null
          ? ApiResponse.fromJson(json['Response'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Meta': meta.toJson(),
      'Response': response?.toJson(),
    };
  }
}

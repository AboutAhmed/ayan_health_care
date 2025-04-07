class ServerConfig {
  static String base = 'https://app.instacare.pk/api/';
  static String basePk = 'https://instacare.pk/api/';
  static const String baseUrl = "https://iprouk-testing.azurewebsites.net/";
  static const String systemKey = "6b2e7679-34dd-41f9-b0cd-ac0ea0f8bf8b";
  static const Map<String, String> headers = <String, String>{
    "Accept": "*/*",
    "Content-Type": "application/json",
  };

  // static String get _apiSignature {
  //   return "&projectID=${Constant.projectID}&loggedInUser=${Constant.patientUsername ?? ""}&locationID=${Constant.locationID ?? ""}";
  // }

  static const String login = "api/AHC/LoginPatient?SystemKey=$systemKey";
  static const String signup = "api/AHC/SignUpPatient?SystemKey=$systemKey";
  static const String doctorsList =
      "api/AHC/GetDoctorList?SystemKey=$systemKey";
  static const String doctorProfile =
      "api/AHC/GetDoctorProfile?SystemKey=$systemKey";
  static const String getMedicalRecord =
      "api/AHC/GetMedicalRecords?SystemKey=$systemKey";
  static const String forgotPassword =
      "api/AHC/ForgotPassword?SystemKey=$systemKey";
  static String getTimeSlots =
      '${base}api/TimeSlot/GetTimeSlots?SystemKey=$systemKey';
  static String uploadIMAGE = '${basePk}documents/savetocloud?';
  static const String saveAppointment =
      "api/AHC/CreateAppointment?SystemKey=$systemKey";
  // static String appointmentSave =
  //     '${base}AppointmentApi/SaveAppointment?SystemKey=${systemKey + _apiSignature}&orderSource=${Constant.source}';
}

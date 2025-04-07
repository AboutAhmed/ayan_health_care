class AppointmentModel {
  final int? id;
  final String? dateTime;
  final String? doctorName;
  final String? imagePath;
  final String? status;
  final String? createdBy;
  final String? patientUsername;
  final String? doctorUsername;
  final String? medUsername;
  final String? details;
  final String? reason;
  final String? notes;
  final String? smsReminder;
  final String? remarks;
  final String? scheduledDate;
  final String? timeStamp;
  final String? location;
  final String? endTime;
  final String? appointmentSource;
  final String? masterUsername;
  final String? type;
  final int? serviceId;

  AppointmentModel({
    this.id,
    this.dateTime,
    this.doctorName,
    this.imagePath,
    this.status,
    this.createdBy,
    this.patientUsername,
    this.doctorUsername,
    this.medUsername,
    this.details,
    this.reason,
    this.notes,
    this.smsReminder,
    this.remarks,
    this.scheduledDate,
    this.timeStamp,
    this.location,
    this.endTime,
    this.appointmentSource,
    this.masterUsername,
    this.type,
    this.serviceId,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['ID'] != null ? json['ID'] as int : null,
      dateTime: json['DateTime'] ?? "",
      doctorName: json['DoctorName'] ?? "",
      imagePath: json['ImagePath'] ?? "",
      status: json['Status'] ?? "",
      createdBy: json['CreatedBy'] ?? "",
      patientUsername: json['PatientUsername'] ?? "",
      doctorUsername: json['DoctorUsername'] ?? "",
      medUsername: json['MedUsername'] ?? "",
      details: json['Details'] ?? "",
      reason: json['Reason'] ?? "",
      notes: json['Notes'] ?? "",
      smsReminder: json['SMSReminder'] ?? "",
      remarks: json['Remarks'] ?? "",
      scheduledDate: json['ScheduledDate'] ?? "",
      timeStamp: json['TimeStamp'] ?? "",
      location: json['Location'] ?? "",
      endTime: json['EndTime'] ?? "",
      appointmentSource: json['AppointmentSource'] ?? "",
      masterUsername: json['MasterUsername'] ?? "",
      type: json['Type'] ?? "",
      serviceId: json['ServiceId'] != null ? json['ServiceId'] as int : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'ID': id,
      'DateTime': dateTime,
      'DoctorName': doctorName,
      'ImagePath': imagePath,
      'Status': status,
      'CreatedBy': createdBy,
      'PatientUsername': patientUsername,
      'DoctorUsername': doctorUsername,
      'MedUsername': medUsername,
      'Details': details,
      'Reason': reason,
      'Notes': notes,
      'SMSReminder': smsReminder,
      'Remarks': remarks,
      'ScheduledDate': scheduledDate,
      'TimeStamp': timeStamp,
      'Location': location,
      'EndTime': endTime,
      'AppointmentSource': appointmentSource,
      'MasterUsername': masterUsername,
      'Type': type,
      'ServiceId': serviceId,
    };
  }

  static List<AppointmentModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => AppointmentModel.fromJson(json)).toList();
  }
}

class AppointmentResponse {
  final List<AppointmentModel> appointments;

  AppointmentResponse({required this.appointments});

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentResponse(
      appointments: (json['Response']['Response'] as List)
          .map((item) => AppointmentModel.fromJson(item))
          .toList(),
    );
  }
}

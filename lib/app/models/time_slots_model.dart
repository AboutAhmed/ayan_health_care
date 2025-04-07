class TimeSlotModel {
  TimeSlotModel({
    this.day,
    this.date,
    this.startTime,
    this.endTime,
    this.isAvailable,
    this.appInterval,
    this.timeSlots,
    this.endTimeSlots,
  });

  String? day;
  String? date;
  String? startTime;
  String? endTime;
  bool? isAvailable;
  int? appInterval;
  List<String>? timeSlots;
  List<String>? endTimeSlots;

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) {
    final response = json["Response"]?["Response"]; // Access nested data

    return TimeSlotModel(
      day: json["Day"],
      date: json["Date"],
      startTime: json["StartTime"],
      endTime: json["EndTime"],
      isAvailable: json["IsAvailable"],
      appInterval: json["AppInterval"],
      timeSlots: response != null && response["StartTimeSlots"] is List
          ? List<String>.from(response["StartTimeSlots"])
          : [],
      endTimeSlots: response != null && response["EndTimeSlots"] is List
          ? List<String>.from(response["EndTimeSlots"])
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "Day": day,
        "Date": date,
        "StartTime": startTime,
        "EndTime": endTime,
        "IsAvailable": isAvailable,
        "AppInterval": appInterval,
        "StartTimeSlots": List<dynamic>.from(timeSlots!.map((x) => x)),
        "EndTimeSlots": List<dynamic>.from(endTimeSlots!.map((x) => x)),
      };
}

import 'dart:io';

import 'package:ayan_healthcare/app/models/appointment_model.dart';
import 'package:ayan_healthcare/app/models/bills_model.dart';
import 'package:ayan_healthcare/app/models/doctor_profile_model.dart';
import 'package:ayan_healthcare/app/models/doctot_list_model.dart';
import 'package:ayan_healthcare/app/models/file_model.dart';
import 'package:ayan_healthcare/app/models/forgot_password_model.dart';
import 'package:ayan_healthcare/app/models/login_model.dart';
import 'package:ayan_healthcare/app/models/prescription_model.dart';
import 'package:ayan_healthcare/app/models/signup_response.dart';
import 'package:ayan_healthcare/app/models/time_slots_model.dart';
import 'package:ayan_healthcare/app/server/server_config.dart';
import 'package:ayan_healthcare/app/server/service_http.dart';
import 'package:ayan_healthcare/assets/styles/strings/constant.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:ayan_healthcare/helper/preferences.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class ApiFetch {
  static Dio dio = Dio();

  // Signup method
  static Future<SignupResponse> signup(Map<String, dynamic>? params) async {
    try {
      final response = await ServiceHttp(
        endPoint: ServerConfig.signup, // Assuming you have a signup endpoint
      ).post(
        header: ServerConfig.headers,
        postBody: params ?? {},
      );
      // Log the response for debugging
      Debug.log('Signup response: ${response.toString()}');

      return SignupResponse.fromJson(response);
    } catch (e) {
      Debug.log('Error during signup: ${e.toString()}');
      rethrow; // Consider handling specific exceptions for better error management
    }
  }

  // Login method
  static Future<LoginModel> login(Map<String, dynamic>? params) async {
    try {
      final response = await ServiceHttp(
        endPoint: ServerConfig.login,
      ).post(
        header: ServerConfig.headers,
        postBody: params ?? {},
      );

      // Log the response for debugging
      Debug.log('Login response: ${response.toString()}');

      return LoginModel.fromJson(response);
    } catch (e) {
      Debug.log('Error during login: ${e.toString()}');
      rethrow; // Consider handling specific exceptions for better error management
    }
  }

  //Forgot Password
  static Future<ForgotPasswordModel> forgotPassword(
      Map<String, dynamic>? params) async {
    try {
      final response = await ServiceHttp(
        endPoint: ServerConfig.forgotPassword,
      ).post(
        header: ServerConfig.headers,
        postBody: params ?? {},
      );

      // Log the response for debugging
      Debug.log('Forgot Password response: ${response.toString()}');

      return ForgotPasswordModel.fromJson(response);
    } catch (e) {
      Debug.log('Error during forgot password: ${e.toString()}');
      rethrow; // Consider handling specific exceptions for better error management
    }
  }

  //Fetch Doctors list
  static Future<DoctotListModel?> doctorsList(
      Map<String, dynamic> params) async {
    try {
      final response = await ServiceHttp(
        endPoint: ServerConfig.doctorsList,
      ).post(
        header: ServerConfig.headers,
        postBody: params ?? {},
      );

      // Log the response for debugging
      Debug.log(' response: ${response.toString()}');

      return DoctotListModel.fromJson(response);
    } catch (e) {
      Debug.log('Error: ${e.toString()}');
      rethrow; // Consider handling specific exceptions for better error management
    }
  }

  //Fetch Doctors list
  static Future<DoctorProfileModel?> getDoctorProfile(
      Map<String, dynamic> params) async {
    try {
      final response = await ServiceHttp(
        endPoint: ServerConfig.doctorProfile,
      ).post(
        header: ServerConfig.headers,
        postBody: params ?? {},
      );

      // Log the response for debugging
      Debug.log(' response: ${response.toString()}');

      return DoctorProfileModel.fromJson(response);
    } catch (e) {
      Debug.log('Error: ${e.toString()}');
      rethrow; // Consider handling specific exceptions for better error management
    }
  }

  //Fetch Medical Record
  static Future<dynamic> getMedicalRecord(Map<String, dynamic> params) async {
    try {
      final response = await ServiceHttp(
        endPoint: ServerConfig.getMedicalRecord,
      ).post(
        header: ServerConfig.headers,
        postBody: params ?? {},
      );

      Debug.log('Get Medical response: ${response.toString()}');

      if (response is Map<String, dynamic> &&
          response.containsKey('Response')) {
        switch (params['RecordType']) {
          case 'Prescription':
            return PrescriptionModel.fromJson(response);
          case 'File':
            return FileModel.fromJson(response);
          case 'Bill':
            return BillResponse.fromJson(response);
          case 'Appointment':
            return AppointmentResponse.fromJson(response);
          default:
            Debug.log('Unknown RecordType: ${params['RecordType']}');
            return response;
        }
      } else {
        Debug.log('Unexpected response structure: ${response.toString()}');
        return response;
      }
    } catch (e) {
      Debug.log('Error: ${e.toString()}');
      rethrow;
    }
  }

  static Future<String?> imageUploading(
      File file, Function(double) onProgress) async {
    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path),
      });

      Response response = await Dio().post(
        'https://your-api-endpoint.com/upload',
        data: formData,
        onSendProgress: (int sent, int total) {
          onProgress(sent / total);
        },
      );

      if (response.statusCode == 200) {
        return response.data['imagePath'];
      } else {
        return null;
      }
    } catch (e) {
      Debug.log('Error uploading image: $e');
      return null;
    }
  }

  static Future<TimeSlotModel?> getTimeSlotList(String url) async {
    try {
      var response = await Dio().post(
        url,
        options: Options(
          validateStatus: (status) {
            return status! < 500; // Accept responses below 500
          },
        ),
      );

      Debug.log("📡 API Response: ${response.data}");

      if (response.statusCode == 200) {
        return TimeSlotModel.fromJson(response.data);
      } else {
        Debug.log("Error: Received status code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      Debug.log("API Fetch Error: $e");
      return null;
    }
  }

  static Future<String?> fileUploading(
      File file, Function(double value) onValueChange) async {
    String? username =
        getx.Get.find<Preferences>().getString(Constant.username);
    Response response;
    try {
      FormData formData = FormData.fromMap(
        {
          "Systemkey": ServerConfig.systemKey,
          "userid": username,
          "file": await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        },
      );
      response = await dio.post(
        ServerConfig.uploadIMAGE,
        data: formData,
        onSendProgress: (int sent, int total) => onValueChange(
          sent / total,
        ),
      );
    } catch (e) {
      Debug.log("$e");
      return null;
    }
    try {
      return response.data['Response']['Response'];
    } catch (e) {
      Debug.log("Error::: $e");
    }
    return null;
  }

  static Future<bool> createAppointment(AppointmentModel model) async {
    try {
      final response = await ServiceHttp(
        endPoint: ServerConfig.saveAppointment,
      ).post(
        header: ServerConfig.headers,
        postBody: model.toJson(),
      );

      Debug.log('Create Appointment response: ${response.toString()}');

      if (response.containsKey('Meta') && response['Meta']['Status'] == '200') {
        return true;
      } else {
        Debug.log('Failed to create appointment: ${response.toString()}');
        return false;
      }
    } catch (e) {
      Debug.log('Error during create appointment: ${e.toString()}');
      return false; // Return false instead of rethrowing the exception
    }
  }

  // static Future<bool> createAppointment(String params) async {
  //   try {
  //     String url = "${ServerConfig.appointmentSave}$params";
  //     Debug.log("Calling API: $url");
  //
  //     Response response = await dio.post(url);
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       Debug.log("Appointment saved successfully!");
  //       return true;
  //     } else {
  //       Debug.log("Failed: ${response.statusCode}, ${response.data}");
  //       return false;
  //     }
  //   } on DioException catch (e) {
  //     Debug.log("Dio error: ${e.response?.statusCode} - ${e.response?.data}");
  //     return false;
  //   } catch (e) {
  //     Debug.log("Unexpected error: $e");
  //     return false;
  //   }
  // }
}

import 'package:ayan_healthcare/app/models/doctot_list_model.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/ui/screens/book_appointment/book_appointment.dart';
import 'package:ayan_healthcare/app/ui/screens/book_appointment/booking_success.dart';
import 'package:ayan_healthcare/app/ui/screens/chat_screen/chat_screen/chats.dart';
import 'package:ayan_healthcare/app/ui/screens/doctors/find_doctors.dart';
import 'package:ayan_healthcare/app/ui/screens/doctors/view_doctor_profile.dart';
import 'package:ayan_healthcare/app/ui/screens/forget/forget_password.dart';
import 'package:ayan_healthcare/app/ui/screens/health_record/health_record.dart';
import 'package:ayan_healthcare/app/ui/screens/health_record/widget/add_media_file.dart';
import 'package:ayan_healthcare/app/ui/screens/home/home_page.dart';
import 'package:ayan_healthcare/app/ui/screens/login/login.dart';
import 'package:ayan_healthcare/app/ui/screens/my_booking/appointment_booking_detail.dart';
import 'package:ayan_healthcare/app/ui/screens/my_booking/bills_detail.dart';
import 'package:ayan_healthcare/app/ui/screens/my_booking/my_booking.dart';
import 'package:ayan_healthcare/app/ui/screens/rating/rating.dart';
import 'package:ayan_healthcare/app/ui/screens/setting/profile_setting.dart';
import 'package:ayan_healthcare/app/ui/screens/setting/setting.dart';
import 'package:ayan_healthcare/app/ui/screens/signup/signup.dart';
import 'package:ayan_healthcare/app/ui/screens/signup/signup_success.dart';
import 'package:ayan_healthcare/app/ui/screens/splash/splash.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const Splash(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const Signup(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => Login(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => ForgetPassword(),
    ),
    GetPage(
      name: AppRoutes.signupSuccess,
      page: () => const SignupSuccess(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.findDoctors,
      page: () => const FindDoctor(),
    ),
    GetPage(
      name: AppRoutes.viewDoctor,
      page: () => ViewDoctorProfile(doctorUsername: Get.arguments as String),
    ),
    GetPage(
      name: AppRoutes.bookAppointment,
      page: () => BookAppointment(doctor: Get.arguments as DoctorList),
    ),
    GetPage(
      name: AppRoutes.bookingSuccess,
      page: () => const BookingSuccess(),
    ),
    GetPage(
      name: AppRoutes.myBooking,
      page: () => const MyBooking(),
    ),
    GetPage(
      name: AppRoutes.appointmentDetail,
      page: () => const AppointmentDetails(),
    ),
    GetPage(
      name: AppRoutes.billsDetail,
      page: () => const MyBillsDetail(),
    ),
    GetPage(
      name: AppRoutes.healthRecord,
      page: () => const MyHealthRecord(),
    ),
    GetPage(
      name: AppRoutes.addMediaScreen,
      page: () => const AddMediaScreen(),
    ),
    GetPage(
      name: AppRoutes.rating,
      page: () => const Rating(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => Setting(),
    ),
    GetPage(
      name: AppRoutes.profileSetting,
      page: () => const ProfileSetting(),
    ),
    GetPage(
      name: AppRoutes.chatRoom,
      page: () => Chats(),
    ),
  ];
}

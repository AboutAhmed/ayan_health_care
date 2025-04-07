// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(doctorName) => "الدردشة مع د. ${doctorName}";

  static String m1(error) => "فشل في إرسال الرسالة: ${error}";

  static String m2(language) => "تم تعيين اللغة إلى ${language}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("حول"),
    "account_deleted": MessageLookupByLibrary.simpleMessage("تم حذف الحساب"),
    "account_deleted_message": MessageLookupByLibrary.simpleMessage(
      "تم حذف حسابك بنجاح.",
    ),
    "account_registered": MessageLookupByLibrary.simpleMessage(
      "تم تسجيل الحساب بنجاح!",
    ),
    "address": MessageLookupByLibrary.simpleMessage("العنوان"),
    "appointment": MessageLookupByLibrary.simpleMessage("موعد"),
    "area": MessageLookupByLibrary.simpleMessage("المنطقة"),
    "attachment": MessageLookupByLibrary.simpleMessage("مرفق"),
    "bGroup": MessageLookupByLibrary.simpleMessage("فصيلة الدم"),
    "balance": MessageLookupByLibrary.simpleMessage("الرصيد"),
    "bills": MessageLookupByLibrary.simpleMessage("الفواتير"),
    "book_appointment": MessageLookupByLibrary.simpleMessage("احجز موعداً"),
    "bothTextNumber": MessageLookupByLibrary.simpleMessage(
      "الحقل يقبل فقط الحروف والأرقام",
    ),
    "bothTextNumberWithDot": MessageLookupByLibrary.simpleMessage(
      "الحقل يقبل فقط الحروف والأرقام و(.,)",
    ),
    "camera": MessageLookupByLibrary.simpleMessage("الكاميرا"),
    "can_login": MessageLookupByLibrary.simpleMessage(
      "الآن يمكنك تسجيل الدخول إلى حسابك.",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "chat_with": m0,
    "city": MessageLookupByLibrary.simpleMessage("المدينة"),
    "cnic": MessageLookupByLibrary.simpleMessage("رقم الهوية"),
    "cnic_empty": MessageLookupByLibrary.simpleMessage(
      "لا يمكن أن يكون رقم الهوية فارغًا",
    ),
    "confirmAppointment": MessageLookupByLibrary.simpleMessage(
      "هل تريد تأكيد موعدك؟",
    ),
    "confirmConsultant": MessageLookupByLibrary.simpleMessage(
      "هل أنت مستعد للاستشارة؟",
    ),
    "confirmOrder": MessageLookupByLibrary.simpleMessage("هل تريد تأكيد طلبك؟"),
    "create_account": MessageLookupByLibrary.simpleMessage(
      "أنشئ حسابك للمتابعة",
    ),
    "dateFormat": MessageLookupByLibrary.simpleMessage("dd-MMM-yyyy"),
    "delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "deleteDialogCancel": MessageLookupByLibrary.simpleMessage("لا"),
    "deleteDialogConfirm": MessageLookupByLibrary.simpleMessage("نعم"),
    "deleteDialogText": MessageLookupByLibrary.simpleMessage("هل تريد حذفه؟"),
    "delete_account": MessageLookupByLibrary.simpleMessage("حذف الحساب"),
    "delete_confirmation": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد حذف حسابك؟ لا يمكن التراجع عن هذا الإجراء.",
    ),
    "dob": MessageLookupByLibrary.simpleMessage("تاريخ الميلاد"),
    "docSpeciality": MessageLookupByLibrary.simpleMessage("تخصص الطبيب"),
    "doctorID": MessageLookupByLibrary.simpleMessage("معرف الطبيب"),
    "dont_have_account": MessageLookupByLibrary.simpleMessage(
      "لا تملك حسابًا؟ ",
    ),
    "dummy_experience": MessageLookupByLibrary.simpleMessage("5 سنوات"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
    "email_empty": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني فارغ",
    ),
    "email_example": MessageLookupByLibrary.simpleMessage("example@email.com"),
    "english": MessageLookupByLibrary.simpleMessage("الإنجليزية"),
    "enter_cnic": MessageLookupByLibrary.simpleMessage(
      "أدخل رقم الهوية الخاص بك",
    ),
    "enter_email_reset_password": MessageLookupByLibrary.simpleMessage(
      "أدخل عنوان بريدك الإلكتروني لإعادة تعيين كلمة المرور",
    ),
    "enter_full_name": MessageLookupByLibrary.simpleMessage("أدخل اسمك الكامل"),
    "enter_password": MessageLookupByLibrary.simpleMessage(
      "أدخل كلمة المرور الخاصة بك",
    ),
    "error": MessageLookupByLibrary.simpleMessage("خطأ"),
    "error_loading_messages": MessageLookupByLibrary.simpleMessage(
      "خطأ في تحميل الرسائل",
    ),
    "experience": MessageLookupByLibrary.simpleMessage("الخبرة"),
    "failed_to_send_message": m1,
    "fee": MessageLookupByLibrary.simpleMessage("الرسوم"),
    "feedback_empty": MessageLookupByLibrary.simpleMessage(
      "لا يمكن أن تكون فارغة",
    ),
    "feedback_hint": MessageLookupByLibrary.simpleMessage("اترك ملاحظات..."),
    "female": MessageLookupByLibrary.simpleMessage("أنثى"),
    "field_empty": MessageLookupByLibrary.simpleMessage(
      "لا يمكن أن يكون هذا الحقل فارغًا",
    ),
    "files": MessageLookupByLibrary.simpleMessage("الملفات"),
    "filterDialogCancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "filterDialogConfirm": MessageLookupByLibrary.simpleMessage("تطبيق"),
    "find_doctors": MessageLookupByLibrary.simpleMessage("ابحث عن الأطباء"),
    "flag": MessageLookupByLibrary.simpleMessage("علم"),
    "follow_us_on": MessageLookupByLibrary.simpleMessage("تابعنا على"),
    "forceLogout": MessageLookupByLibrary.simpleMessage(
      "تسجيل الخروج الإجباري",
    ),
    "forget_password": MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور"),
    "full_name": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
    "gallery": MessageLookupByLibrary.simpleMessage("المعرض"),
    "gender": MessageLookupByLibrary.simpleMessage("الجنس"),
    "get_registered": MessageLookupByLibrary.simpleMessage("سجل الآن"),
    "getting_started": MessageLookupByLibrary.simpleMessage("البدء"),
    "have_account": MessageLookupByLibrary.simpleMessage(
      "هل لديك حساب بالفعل؟ ",
    ),
    "have_nice_day": MessageLookupByLibrary.simpleMessage(
      "نتمنى لك يوماً سعيداً",
    ),
    "healthAlert": MessageLookupByLibrary.simpleMessage("تنبيهات صحية"),
    "healthAlertId": MessageLookupByLibrary.simpleMessage("101"),
    "health_article": MessageLookupByLibrary.simpleMessage("مقال صحي"),
    "health_record": MessageLookupByLibrary.simpleMessage("السجل الصحي"),
    "height": MessageLookupByLibrary.simpleMessage("الطول"),
    "image": MessageLookupByLibrary.simpleMessage("صورة"),
    "invalid_email": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال عنوان بريد إلكتروني صالح",
    ),
    "isAlreadyInRoom": MessageLookupByLibrary.simpleMessage("في الغرفة بالفعل"),
    "isFirstTime": MessageLookupByLibrary.simpleMessage("أول مرة"),
    "isLoggedIn": MessageLookupByLibrary.simpleMessage("مسجل الدخول"),
    "language": MessageLookupByLibrary.simpleMessage("اللغة"),
    "language_changed": MessageLookupByLibrary.simpleMessage("تم تغيير اللغة"),
    "language_key": MessageLookupByLibrary.simpleMessage("اللغة"),
    "language_set_to": m2,
    "lat": MessageLookupByLibrary.simpleMessage("خط العرض"),
    "locationID": MessageLookupByLibrary.simpleMessage("معرف الموقع"),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "login_failed": MessageLookupByLibrary.simpleMessage(
      "فشل تسجيل الدخول. يرجى المحاولة مرة أخرى.",
    ),
    "login_to_continue": MessageLookupByLibrary.simpleMessage(
      "قم بتسجيل الدخول إلى حسابك للمتابعة",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "logout_confirmation": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد تسجيل الخروج؟",
    ),
    "long": MessageLookupByLibrary.simpleMessage("خط الطول"),
    "male": MessageLookupByLibrary.simpleMessage("ذكر"),
    "messageId": MessageLookupByLibrary.simpleMessage("معرف الرسالة"),
    "months": MessageLookupByLibrary.simpleMessage("أشهر"),
    "mrNo": MessageLookupByLibrary.simpleMessage("رقم السجل الطبي"),
    "my_booking": MessageLookupByLibrary.simpleMessage("حجزي"),
    "my_chat": MessageLookupByLibrary.simpleMessage("دردشتي"),
    "my_chats": MessageLookupByLibrary.simpleMessage("دردشاتي"),
    "my_health_record": MessageLookupByLibrary.simpleMessage("سجل صحتي"),
    "name": MessageLookupByLibrary.simpleMessage("الاسم"),
    "name_empty": MessageLookupByLibrary.simpleMessage(
      "لا يمكن أن يكون الاسم الكامل فارغًا",
    ),
    "no": MessageLookupByLibrary.simpleMessage("لا"),
    "no_chats": MessageLookupByLibrary.simpleMessage("ليس لديك أي دردشة"),
    "no_doctors_found": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على أطباء",
    ),
    "onlyNumberWithDot": MessageLookupByLibrary.simpleMessage(
      "الحقل يقبل فقط الأرقام و(.)",
    ),
    "onlyNumbers": MessageLookupByLibrary.simpleMessage(
      "الحقل يقبل فقط الأرقام",
    ),
    "onlyTestNumberAndDash": MessageLookupByLibrary.simpleMessage(
      "الحقل يقبل فقط الحروف والأرقام و(-)",
    ),
    "onlyTestWithDot": MessageLookupByLibrary.simpleMessage(
      "الحقل يقبل فقط الحروف و(.,)",
    ),
    "onlyText": MessageLookupByLibrary.simpleMessage("الحقل يقبل فقط الحروف"),
    "other": MessageLookupByLibrary.simpleMessage("آخر"),
    "participantId": MessageLookupByLibrary.simpleMessage("معرف المشارك"),
    "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "password_empty": MessageLookupByLibrary.simpleMessage(
      "لا يمكن أن تكون كلمة المرور فارغة",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("الهاتف"),
    "phone_empty": MessageLookupByLibrary.simpleMessage(
      "لا يمكن أن يكون رقم الهاتف فارغًا",
    ),
    "phone_example": MessageLookupByLibrary.simpleMessage("مثل 123-456-7890"),
    "photo": MessageLookupByLibrary.simpleMessage("صورة"),
    "please_select_gender": MessageLookupByLibrary.simpleMessage(
      "يرجى اختيار الجنس",
    ),
    "prescription": MessageLookupByLibrary.simpleMessage("الوصفة الطبية"),
    "profession": MessageLookupByLibrary.simpleMessage("المهنة"),
    "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "profile_photo": MessageLookupByLibrary.simpleMessage("صورة الملف الشخصي"),
    "profile_setting": MessageLookupByLibrary.simpleMessage(
      "إعدادات الملف الشخصي",
    ),
    "profile_update_success": MessageLookupByLibrary.simpleMessage(
      "تم تحديث ملفك الشخصي بنجاح.",
    ),
    "profile_updated": MessageLookupByLibrary.simpleMessage(
      "تم تحديث الملف الشخصي",
    ),
    "rDrLocation": MessageLookupByLibrary.simpleMessage("موقع الطبيب"),
    "rDrName": MessageLookupByLibrary.simpleMessage("اسم الطبيب"),
    "rDrUsername": MessageLookupByLibrary.simpleMessage("اسم مستخدم الطبيب"),
    "rRoomUrl": MessageLookupByLibrary.simpleMessage("رابط الغرفة"),
    "rate_fees": MessageLookupByLibrary.simpleMessage("كيف تقيم رسوم الطبيب؟"),
    "rating_and_review": MessageLookupByLibrary.simpleMessage(
      "التقييم والمراجعة",
    ),
    "recommend_doctor": MessageLookupByLibrary.simpleMessage(
      "هل ترغب في التوصية بالطبيب؟",
    ),
    "recommended_doctors": MessageLookupByLibrary.simpleMessage(
      "الأطباء الموصى بهم",
    ),
    "reminderChannel": MessageLookupByLibrary.simpleMessage("تذكير الاستشارة"),
    "reminderChannelId": MessageLookupByLibrary.simpleMessage(
      "معرف تذكير الاستشارة",
    ),
    "remove_photo": MessageLookupByLibrary.simpleMessage("إزالة الصورة"),
    "reset": MessageLookupByLibrary.simpleMessage("إعادة تعيين كلمة المرور"),
    "reviews": MessageLookupByLibrary.simpleMessage("المراجعات"),
    "save": MessageLookupByLibrary.simpleMessage("حفظ"),
    "search_appointment": MessageLookupByLibrary.simpleMessage("بحث عن موعد"),
    "search_bill": MessageLookupByLibrary.simpleMessage("بحث عن فاتورة"),
    "search_hint": MessageLookupByLibrary.simpleMessage("ماذا تبحث عنه؟"),
    "select_gender": MessageLookupByLibrary.simpleMessage("يرجى اختيار الجنس"),
    "selectedName": MessageLookupByLibrary.simpleMessage("الاسم المحدد"),
    "selectedUserName": MessageLookupByLibrary.simpleMessage(
      "اسم المستخدم المحدد",
    ),
    "services": MessageLookupByLibrary.simpleMessage("الخدمات"),
    "sessionToken": MessageLookupByLibrary.simpleMessage("رمز الجلسة"),
    "session_expired": MessageLookupByLibrary.simpleMessage("انتهت الجلسة"),
    "settings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
    "signup": MessageLookupByLibrary.simpleMessage("التسجيل"),
    "signup_again": MessageLookupByLibrary.simpleMessage(
      "سجل مرة أخرى لاستخدام التطبيق",
    ),
    "source": MessageLookupByLibrary.simpleMessage("المصدر"),
    "status": MessageLookupByLibrary.simpleMessage("الحالة"),
    "submit": MessageLookupByLibrary.simpleMessage("إرسال"),
    "syncTime": MessageLookupByLibrary.simpleMessage("وقت المزامنة"),
    "tell_experience": MessageLookupByLibrary.simpleMessage(
      "أخبرنا عن تجربتك.",
    ),
    "terms_agree": MessageLookupByLibrary.simpleMessage("أوافق على "),
    "terms_conditions": MessageLookupByLibrary.simpleMessage("الشروط والأحكام"),
    "timeDate": MessageLookupByLibrary.simpleMessage("dd MMM, yy hh:mm a"),
    "timeFormat": MessageLookupByLibrary.simpleMessage("hh:mm a"),
    "type_message": MessageLookupByLibrary.simpleMessage("اكتب رسالة..."),
    "under_15_min": MessageLookupByLibrary.simpleMessage("أقل من 15 دقيقة"),
    "unknown": MessageLookupByLibrary.simpleMessage("غير معروف"),
    "unknown_specialty": MessageLookupByLibrary.simpleMessage("تخصص غير معروف"),
    "username": MessageLookupByLibrary.simpleMessage("اسم المستخدم"),
    "view_all": MessageLookupByLibrary.simpleMessage("عرض الكل"),
    "view_profile": MessageLookupByLibrary.simpleMessage("عرض الملف الشخصي"),
    "wait_time": MessageLookupByLibrary.simpleMessage("وقت الانتظار"),
    "waiting_time_question": MessageLookupByLibrary.simpleMessage(
      "هل انتظرت طويلاً للاستشارة؟",
    ),
    "weight": MessageLookupByLibrary.simpleMessage("الوزن"),
    "years": MessageLookupByLibrary.simpleMessage("سنوات"),
    "years_of_experience": MessageLookupByLibrary.simpleMessage(
      "سنوات من الخبرة في التغذية السريرية.",
    ),
    "yes": MessageLookupByLibrary.simpleMessage("نعم"),
  };
}

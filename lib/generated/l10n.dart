// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Delete Account`
  String get delete_account {
    return Intl.message(
      'Delete Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Are you sure you want to delete your account? This action cannot be undone.`
  String get delete_confirmation {
    return Intl.message(
      'Are you sure you want to delete your account? This action cannot be undone.',
      name: 'delete_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get logout_confirmation {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logout_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Account Deleted`
  String get account_deleted {
    return Intl.message(
      'Account Deleted',
      name: 'account_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been successfully deleted.`
  String get account_deleted_message {
    return Intl.message(
      'Your account has been successfully deleted.',
      name: 'account_deleted_message',
      desc: '',
      args: [],
    );
  }

  /// `Language Changed`
  String get language_changed {
    return Intl.message(
      'Language Changed',
      name: 'language_changed',
      desc: '',
      args: [],
    );
  }

  /// `Language set to {language}`
  String language_set_to(Object language) {
    return Intl.message(
      'Language set to $language',
      name: 'language_set_to',
      desc: '',
      args: [language],
    );
  }

  /// `Find Doctors`
  String get find_doctors {
    return Intl.message(
      'Find Doctors',
      name: 'find_doctors',
      desc: '',
      args: [],
    );
  }

  /// `My Booking`
  String get my_booking {
    return Intl.message('My Booking', name: 'my_booking', desc: '', args: []);
  }

  /// `Health Record`
  String get health_record {
    return Intl.message(
      'Health Record',
      name: 'health_record',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Doctors`
  String get recommended_doctors {
    return Intl.message(
      'Recommended Doctors',
      name: 'recommended_doctors',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get view_all {
    return Intl.message('View All', name: 'view_all', desc: '', args: []);
  }

  /// `Health Article`
  String get health_article {
    return Intl.message(
      'Health Article',
      name: 'health_article',
      desc: '',
      args: [],
    );
  }

  /// `What are you looking for?`
  String get search_hint {
    return Intl.message(
      'What are you looking for?',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `No doctors found`
  String get no_doctors_found {
    return Intl.message(
      'No doctors found',
      name: 'no_doctors_found',
      desc: '',
      args: [],
    );
  }

  /// `Have a nice day`
  String get have_nice_day {
    return Intl.message(
      'Have a nice day',
      name: 'have_nice_day',
      desc: '',
      args: [],
    );
  }

  /// `Fee`
  String get fee {
    return Intl.message('Fee', name: 'fee', desc: '', args: []);
  }

  /// `Experience`
  String get experience {
    return Intl.message('Experience', name: 'experience', desc: '', args: []);
  }

  /// `View Profile`
  String get view_profile {
    return Intl.message(
      'View Profile',
      name: 'view_profile',
      desc: '',
      args: [],
    );
  }

  /// `Book Appointment`
  String get book_appointment {
    return Intl.message(
      'Book Appointment',
      name: 'book_appointment',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `FirstTime`
  String get isFirstTime {
    return Intl.message('FirstTime', name: 'isFirstTime', desc: '', args: []);
  }

  /// `isLoggedIn`
  String get isLoggedIn {
    return Intl.message('isLoggedIn', name: 'isLoggedIn', desc: '', args: []);
  }

  /// `AlreadyRoom`
  String get isAlreadyInRoom {
    return Intl.message(
      'AlreadyRoom',
      name: 'isAlreadyInRoom',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `doctorSpeciality`
  String get docSpeciality {
    return Intl.message(
      'doctorSpeciality',
      name: 'docSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `doctorID`
  String get doctorID {
    return Intl.message('doctorID', name: 'doctorID', desc: '', args: []);
  }

  /// `locationID`
  String get locationID {
    return Intl.message('locationID', name: 'locationID', desc: '', args: []);
  }

  /// `forceLogout`
  String get forceLogout {
    return Intl.message('forceLogout', name: 'forceLogout', desc: '', args: []);
  }

  /// `language`
  String get language_key {
    return Intl.message('language', name: 'language_key', desc: '', args: []);
  }

  /// `mr_no`
  String get mrNo {
    return Intl.message('mr_no', name: 'mrNo', desc: '', args: []);
  }

  /// `phone`
  String get phone {
    return Intl.message('phone', name: 'phone', desc: '', args: []);
  }

  /// `source`
  String get source {
    return Intl.message('source', name: 'source', desc: '', args: []);
  }

  /// `area`
  String get area {
    return Intl.message('area', name: 'area', desc: '', args: []);
  }

  /// `address`
  String get address {
    return Intl.message('address', name: 'address', desc: '', args: []);
  }

  /// `city`
  String get city {
    return Intl.message('city', name: 'city', desc: '', args: []);
  }

  /// `name`
  String get name {
    return Intl.message('name', name: 'name', desc: '', args: []);
  }

  /// `date_of_birth`
  String get dob {
    return Intl.message('date_of_birth', name: 'dob', desc: '', args: []);
  }

  /// `image`
  String get image {
    return Intl.message('image', name: 'image', desc: '', args: []);
  }

  /// `height`
  String get height {
    return Intl.message('height', name: 'height', desc: '', args: []);
  }

  /// `weight`
  String get weight {
    return Intl.message('weight', name: 'weight', desc: '', args: []);
  }

  /// `profession`
  String get profession {
    return Intl.message('profession', name: 'profession', desc: '', args: []);
  }

  /// `CNIC`
  String get cnic {
    return Intl.message('CNIC', name: 'cnic', desc: '', args: []);
  }

  /// `flag`
  String get flag {
    return Intl.message('flag', name: 'flag', desc: '', args: []);
  }

  /// `status`
  String get status {
    return Intl.message('status', name: 'status', desc: '', args: []);
  }

  /// `syncing_time`
  String get syncTime {
    return Intl.message('syncing_time', name: 'syncTime', desc: '', args: []);
  }

  /// `session_token`
  String get sessionToken {
    return Intl.message(
      'session_token',
      name: 'sessionToken',
      desc: '',
      args: [],
    );
  }

  /// `balance`
  String get balance {
    return Intl.message('balance', name: 'balance', desc: '', args: []);
  }

  /// `latitude`
  String get lat {
    return Intl.message('latitude', name: 'lat', desc: '', args: []);
  }

  /// `longitude`
  String get long {
    return Intl.message('longitude', name: 'long', desc: '', args: []);
  }

  /// `message_id`
  String get messageId {
    return Intl.message('message_id', name: 'messageId', desc: '', args: []);
  }

  /// `participantID`
  String get participantId {
    return Intl.message(
      'participantID',
      name: 'participantId',
      desc: '',
      args: [],
    );
  }

  /// `r_drName`
  String get rDrName {
    return Intl.message('r_drName', name: 'rDrName', desc: '', args: []);
  }

  /// `r_drUser Name`
  String get rDrUsername {
    return Intl.message(
      'r_drUser Name',
      name: 'rDrUsername',
      desc: '',
      args: [],
    );
  }

  /// `r_drLocation`
  String get rDrLocation {
    return Intl.message(
      'r_drLocation',
      name: 'rDrLocation',
      desc: '',
      args: [],
    );
  }

  /// `r_room_url`
  String get rRoomUrl {
    return Intl.message('r_room_url', name: 'rRoomUrl', desc: '', args: []);
  }

  /// `Consultation Reminder`
  String get reminderChannel {
    return Intl.message(
      'Consultation Reminder',
      name: 'reminderChannel',
      desc: '',
      args: [],
    );
  }

  /// `Consultation_Reminder_ID`
  String get reminderChannelId {
    return Intl.message(
      'Consultation_Reminder_ID',
      name: 'reminderChannelId',
      desc: '',
      args: [],
    );
  }

  /// `HealthAlerts`
  String get healthAlert {
    return Intl.message(
      'HealthAlerts',
      name: 'healthAlert',
      desc: '',
      args: [],
    );
  }

  /// `101`
  String get healthAlertId {
    return Intl.message('101', name: 'healthAlertId', desc: '', args: []);
  }

  /// `Are you ready for the consultation?`
  String get confirmConsultant {
    return Intl.message(
      'Are you ready for the consultation?',
      name: 'confirmConsultant',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to confirm your appointment?`
  String get confirmAppointment {
    return Intl.message(
      'Do you want to confirm your appointment?',
      name: 'confirmAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to confirm your order?`
  String get confirmOrder {
    return Intl.message(
      'Do you want to confirm your order?',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete it?`
  String get deleteDialogText {
    return Intl.message(
      'Do you want to delete it?',
      name: 'deleteDialogText',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get deleteDialogCancel {
    return Intl.message('No', name: 'deleteDialogCancel', desc: '', args: []);
  }

  /// `Yes`
  String get deleteDialogConfirm {
    return Intl.message('Yes', name: 'deleteDialogConfirm', desc: '', args: []);
  }

  /// `Dismiss`
  String get filterDialogCancel {
    return Intl.message(
      'Dismiss',
      name: 'filterDialogCancel',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get filterDialogConfirm {
    return Intl.message(
      'Apply',
      name: 'filterDialogConfirm',
      desc: '',
      args: [],
    );
  }

  /// `dd-MMM-yyyy`
  String get dateFormat {
    return Intl.message('dd-MMM-yyyy', name: 'dateFormat', desc: '', args: []);
  }

  /// `hh:mm a`
  String get timeFormat {
    return Intl.message('hh:mm a', name: 'timeFormat', desc: '', args: []);
  }

  /// `dd MMM, yy hh:mm a`
  String get timeDate {
    return Intl.message(
      'dd MMM, yy hh:mm a',
      name: 'timeDate',
      desc: '',
      args: [],
    );
  }

  /// `field accepts only alphabets`
  String get onlyText {
    return Intl.message(
      'field accepts only alphabets',
      name: 'onlyText',
      desc: '',
      args: [],
    );
  }

  /// `field accepts only alphabets, number and (-)`
  String get onlyTestNumberAndDash {
    return Intl.message(
      'field accepts only alphabets, number and (-)',
      name: 'onlyTestNumberAndDash',
      desc: '',
      args: [],
    );
  }

  /// `field accepts only alphabets and (. ,)`
  String get onlyTestWithDot {
    return Intl.message(
      'field accepts only alphabets and (. ,)',
      name: 'onlyTestWithDot',
      desc: '',
      args: [],
    );
  }

  /// `field accepts only numbers`
  String get onlyNumbers {
    return Intl.message(
      'field accepts only numbers',
      name: 'onlyNumbers',
      desc: '',
      args: [],
    );
  }

  /// `field accepts only numbers and (.)`
  String get onlyNumberWithDot {
    return Intl.message(
      'field accepts only numbers and (.)',
      name: 'onlyNumberWithDot',
      desc: '',
      args: [],
    );
  }

  /// `field accepts only alphabets, numbers and (. ,)`
  String get bothTextNumberWithDot {
    return Intl.message(
      'field accepts only alphabets, numbers and (. ,)',
      name: 'bothTextNumberWithDot',
      desc: '',
      args: [],
    );
  }

  /// `field accepts only alphabets and numbers`
  String get bothTextNumber {
    return Intl.message(
      'field accepts only alphabets and numbers',
      name: 'bothTextNumber',
      desc: '',
      args: [],
    );
  }

  /// `SelectedUser Name`
  String get selectedUserName {
    return Intl.message(
      'SelectedUser Name',
      name: 'selectedUserName',
      desc: '',
      args: [],
    );
  }

  /// `SelectedName`
  String get selectedName {
    return Intl.message(
      'SelectedName',
      name: 'selectedName',
      desc: '',
      args: [],
    );
  }

  /// `BloodGroup`
  String get bGroup {
    return Intl.message('BloodGroup', name: 'bGroup', desc: '', args: []);
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address to reset your password`
  String get enter_email_reset_password {
    return Intl.message(
      'Enter your email address to reset your password',
      name: 'enter_email_reset_password',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty`
  String get field_empty {
    return Intl.message(
      'This field cannot be empty',
      name: 'field_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get invalid_email {
    return Intl.message(
      'Please enter a valid email address',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `example@email.com`
  String get email_example {
    return Intl.message(
      'example@email.com',
      name: 'email_example',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset {
    return Intl.message('Reset Password', name: 'reset', desc: '', args: []);
  }

  /// `Getting Started`
  String get getting_started {
    return Intl.message(
      'Getting Started',
      name: 'getting_started',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account to continue`
  String get login_to_continue {
    return Intl.message(
      'Login to your account to continue',
      name: 'login_to_continue',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be empty`
  String get password_empty {
    return Intl.message(
      'Password can\'t be empty',
      name: 'password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Login failed. Please try again.`
  String get login_failed {
    return Intl.message(
      'Login failed. Please try again.',
      name: 'login_failed',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an Account? `
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an Account? ',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Get Registered`
  String get get_registered {
    return Intl.message(
      'Get Registered',
      name: 'get_registered',
      desc: '',
      args: [],
    );
  }

  /// `Create your account to continue`
  String get create_account {
    return Intl.message(
      'Create your account to continue',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
  }

  /// `Enter your full name`
  String get enter_full_name {
    return Intl.message(
      'Enter your full name',
      name: 'enter_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Full Name can't be empty`
  String get name_empty {
    return Intl.message(
      'Full Name can\'t be empty',
      name: 'name_empty',
      desc: '',
      args: [],
    );
  }

  /// `e.g. 123-456-7890`
  String get phone_example {
    return Intl.message(
      'e.g. 123-456-7890',
      name: 'phone_example',
      desc: '',
      args: [],
    );
  }

  /// `Phone number can't be empty`
  String get phone_empty {
    return Intl.message(
      'Phone number can\'t be empty',
      name: 'phone_empty',
      desc: '',
      args: [],
    );
  }

  /// `Enter your CNIC`
  String get enter_cnic {
    return Intl.message(
      'Enter your CNIC',
      name: 'enter_cnic',
      desc: '',
      args: [],
    );
  }

  /// `CNIC can't be empty`
  String get cnic_empty {
    return Intl.message(
      'CNIC can\'t be empty',
      name: 'cnic_empty',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Please select a gender`
  String get select_gender {
    return Intl.message(
      'Please select a gender',
      name: 'select_gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `I agree to the `
  String get terms_agree {
    return Intl.message(
      'I agree to the ',
      name: 'terms_agree',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signup {
    return Intl.message('Signup', name: 'signup', desc: '', args: []);
  }

  /// `Already have an Account? `
  String get have_account {
    return Intl.message(
      'Already have an Account? ',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Account Registered Successfully!`
  String get account_registered {
    return Intl.message(
      'Account Registered Successfully!',
      name: 'account_registered',
      desc: '',
      args: [],
    );
  }

  /// `Now you can log in to your account.`
  String get can_login {
    return Intl.message(
      'Now you can log in to your account.',
      name: 'can_login',
      desc: '',
      args: [],
    );
  }

  /// `Profile Setting`
  String get profile_setting {
    return Intl.message(
      'Profile Setting',
      name: 'profile_setting',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Profile Updated`
  String get profile_updated {
    return Intl.message(
      'Profile Updated',
      name: 'profile_updated',
      desc: '',
      args: [],
    );
  }

  /// `Your profile has been updated successfully.`
  String get profile_update_success {
    return Intl.message(
      'Your profile has been updated successfully.',
      name: 'profile_update_success',
      desc: '',
      args: [],
    );
  }

  /// `Please select a gender`
  String get please_select_gender {
    return Intl.message(
      'Please select a gender',
      name: 'please_select_gender',
      desc: '',
      args: [],
    );
  }

  /// `My Chat`
  String get my_chat {
    return Intl.message('My Chat', name: 'my_chat', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Email Empty`
  String get email_empty {
    return Intl.message('Email Empty', name: 'email_empty', desc: '', args: []);
  }

  /// `Follow Us on `
  String get follow_us_on {
    return Intl.message(
      'Follow Us on ',
      name: 'follow_us_on',
      desc: '',
      args: [],
    );
  }

  /// `Bills`
  String get bills {
    return Intl.message('Bills', name: 'bills', desc: '', args: []);
  }

  /// `Appointment`
  String get appointment {
    return Intl.message('Appointment', name: 'appointment', desc: '', args: []);
  }

  /// `Search Bill`
  String get search_bill {
    return Intl.message('Search Bill', name: 'search_bill', desc: '', args: []);
  }

  /// `Search Appointment`
  String get search_appointment {
    return Intl.message(
      'Search Appointment',
      name: 'search_appointment',
      desc: '',
      args: [],
    );
  }

  /// `My Health Record`
  String get my_health_record {
    return Intl.message(
      'My Health Record',
      name: 'my_health_record',
      desc: '',
      args: [],
    );
  }

  /// `Prescription`
  String get prescription {
    return Intl.message(
      'Prescription',
      name: 'prescription',
      desc: '',
      args: [],
    );
  }

  /// `Files`
  String get files {
    return Intl.message('Files', name: 'files', desc: '', args: []);
  }

  /// `Rating and Review`
  String get rating_and_review {
    return Intl.message(
      'Rating and Review',
      name: 'rating_and_review',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to recommend the Doctor?`
  String get recommend_doctor {
    return Intl.message(
      'Would you like to recommend the Doctor?',
      name: 'recommend_doctor',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Did you wait long for the Consultation?`
  String get waiting_time_question {
    return Intl.message(
      'Did you wait long for the Consultation?',
      name: 'waiting_time_question',
      desc: '',
      args: [],
    );
  }

  /// `How do you rate fees of the doctor?`
  String get rate_fees {
    return Intl.message(
      'How do you rate fees of the doctor?',
      name: 'rate_fees',
      desc: '',
      args: [],
    );
  }

  /// `Tell us about your experience.`
  String get tell_experience {
    return Intl.message(
      'Tell us about your experience.',
      name: 'tell_experience',
      desc: '',
      args: [],
    );
  }

  /// `Leave a feedback...`
  String get feedback_hint {
    return Intl.message(
      'Leave a feedback...',
      name: 'feedback_hint',
      desc: '',
      args: [],
    );
  }

  /// `Can't be empty`
  String get feedback_empty {
    return Intl.message(
      'Can\'t be empty',
      name: 'feedback_empty',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Session Expired`
  String get session_expired {
    return Intl.message(
      'Session Expired',
      name: 'session_expired',
      desc: '',
      args: [],
    );
  }

  /// `Signup again to use application`
  String get signup_again {
    return Intl.message(
      'Signup again to use application',
      name: 'signup_again',
      desc: '',
      args: [],
    );
  }

  /// `Profile Photo`
  String get profile_photo {
    return Intl.message(
      'Profile Photo',
      name: 'profile_photo',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Remove Photo`
  String get remove_photo {
    return Intl.message(
      'Remove Photo',
      name: 'remove_photo',
      desc: '',
      args: [],
    );
  }

  /// `My Chats`
  String get my_chats {
    return Intl.message('My Chats', name: 'my_chats', desc: '', args: []);
  }

  /// `You don't have any chat`
  String get no_chats {
    return Intl.message(
      'You don\'t have any chat',
      name: 'no_chats',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get photo {
    return Intl.message('Photo', name: 'photo', desc: '', args: []);
  }

  /// `Attachment`
  String get attachment {
    return Intl.message('Attachment', name: 'attachment', desc: '', args: []);
  }

  /// `Type a message...`
  String get type_message {
    return Intl.message(
      'Type a message...',
      name: 'type_message',
      desc: '',
      args: [],
    );
  }

  /// `Error loading messages`
  String get error_loading_messages {
    return Intl.message(
      'Error loading messages',
      name: 'error_loading_messages',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send message: {error}`
  String failed_to_send_message(Object error) {
    return Intl.message(
      'Failed to send message: $error',
      name: 'failed_to_send_message',
      desc: '',
      args: [error],
    );
  }

  /// `Chat with Dr. {doctorName}`
  String chat_with(Object doctorName) {
    return Intl.message(
      'Chat with Dr. $doctorName',
      name: 'chat_with',
      desc: '',
      args: [doctorName],
    );
  }

  /// `Wait Time`
  String get wait_time {
    return Intl.message('Wait Time', name: 'wait_time', desc: '', args: []);
  }

  /// `Under 15 Min`
  String get under_15_min {
    return Intl.message(
      'Under 15 Min',
      name: 'under_15_min',
      desc: '',
      args: [],
    );
  }

  /// `5 Yrs`
  String get dummy_experience {
    return Intl.message('5 Yrs', name: 'dummy_experience', desc: '', args: []);
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `Unknown Specialty`
  String get unknown_specialty {
    return Intl.message(
      'Unknown Specialty',
      name: 'unknown_specialty',
      desc: '',
      args: [],
    );
  }

  /// `years`
  String get years {
    return Intl.message('years', name: 'years', desc: '', args: []);
  }

  /// `months`
  String get months {
    return Intl.message('months', name: 'months', desc: '', args: []);
  }

  /// `Services`
  String get services {
    return Intl.message('Services', name: 'services', desc: '', args: []);
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Years of experience in clinical nutrition.`
  String get years_of_experience {
    return Intl.message(
      'Years of experience in clinical nutrition.',
      name: 'years_of_experience',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

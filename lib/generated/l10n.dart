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

  /// `Welcome to Qabilati`
  String get welcome {
    return Intl.message(
      'Welcome to Qabilati',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Join a vibrant community where connections matter.`
  String get welcome_body {
    return Intl.message(
      'Join a vibrant community where connections matter.',
      name: 'welcome_body',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get Get_started {
    return Intl.message('Get started', name: 'Get_started', desc: '', args: []);
  }

  /// `By proceeding, you agree to our Terms and conditions and our Privacy policy`
  String get welcome_subtile {
    return Intl.message(
      'By proceeding, you agree to our Terms and conditions and our Privacy policy',
      name: 'welcome_subtile',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back👋`
  String get welcome_login {
    return Intl.message(
      'Welcome Back👋',
      name: 'welcome_login',
      desc: '',
      args: [],
    );
  }

  /// `Enter the phone number you’d like to use to register with qabilati`
  String get login_explain {
    return Intl.message(
      'Enter the phone number you’d like to use to register with qabilati',
      name: 'login_explain',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get hint_phone {
    return Intl.message(
      'Enter your phone number',
      name: 'hint_phone',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Not connected yet?`
  String get not_connect_yet {
    return Intl.message(
      'Not connected yet?',
      name: 'not_connect_yet',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get create_account {
    return Intl.message(
      'Create an account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Hi there👋, Let’s get you started`
  String get title_register {
    return Intl.message(
      'Hi there👋, Let’s get you started',
      name: 'title_register',
      desc: '',
      args: [],
    );
  }

  /// `Enter the required information if you wish to register in my Qabilati`
  String get body_register {
    return Intl.message(
      'Enter the required information if you wish to register in my Qabilati',
      name: 'body_register',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `email`
  String get email {
    return Intl.message('email', name: 'email', desc: '', args: []);
  }

  /// `Enter your name`
  String get hint_name {
    return Intl.message(
      'Enter your name',
      name: 'hint_name',
      desc: '',
      args: [],
    );
  }

  /// `xxxxxxxxx@gmail.com`
  String get hint_email {
    return Intl.message(
      'xxxxxxxxx@gmail.com',
      name: 'hint_email',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_bu {
    return Intl.message('Continue', name: 'continue_bu', desc: '', args: []);
  }

  /// `Verify Your Email 📫`
  String get VerifyYourEmail {
    return Intl.message(
      'Verify Your Email 📫',
      name: 'VerifyYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `We’ve sent a code to your email. Enter it below`
  String get verify_body {
    return Intl.message(
      'We’ve sent a code to your email. Enter it below',
      name: 'verify_body',
      desc: '',
      args: [],
    );
  }

  /// `Send a new code`
  String get send_code {
    return Intl.message(
      'Send a new code',
      name: 'send_code',
      desc: '',
      args: [],
    );
  }

  /// `Add your own photos`
  String get add_image {
    return Intl.message(
      'Add your own photos',
      name: 'add_image',
      desc: '',
      args: [],
    );
  }

  /// `This photo is for profile picture`
  String get image_body {
    return Intl.message(
      'This photo is for profile picture',
      name: 'image_body',
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

  /// `Upload image`
  String get upload_image {
    return Intl.message(
      'Upload image',
      name: 'upload_image',
      desc: '',
      args: [],
    );
  }

  /// `Verify Email`
  String get verify_email {
    return Intl.message(
      'Verify Email',
      name: 'verify_email',
      desc: '',
      args: [],
    );
  }

  /// `Something is wrong`
  String get message_error {
    return Intl.message(
      'Something is wrong',
      name: 'message_error',
      desc: '',
      args: [],
    );
  }

  /// `The field cannot be left blank.`
  String get field_blank {
    return Intl.message(
      'The field cannot be left blank.',
      name: 'field_blank',
      desc: '',
      args: [],
    );
  }

  /// `Cannot contain more than one field`
  String get more_than {
    return Intl.message(
      'Cannot contain more than one field',
      name: 'more_than',
      desc: '',
      args: [],
    );
  }

  /// `The field content cannot be smaller than`
  String get less_than {
    return Intl.message(
      'The field content cannot be smaller than',
      name: 'less_than',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct phone number.`
  String get correct_phone {
    return Intl.message(
      'Please enter the correct phone number.',
      name: 'correct_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct name.`
  String get correct_name {
    return Intl.message(
      'Please enter the correct name.',
      name: 'correct_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct email`
  String get correct_email {
    return Intl.message(
      'Please enter the correct email',
      name: 'correct_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct numbers.`
  String get correct_num {
    return Intl.message(
      'Please enter the correct numbers.',
      name: 'correct_num',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct verification code.`
  String get error_verify {
    return Intl.message(
      'Please enter the correct verification code.',
      name: 'error_verify',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get chats {
    return Intl.message('Chats', name: 'chats', desc: '', args: []);
  }

  /// `Friends`
  String get friends {
    return Intl.message('Friends', name: 'friends', desc: '', args: []);
  }

  /// `Discover`
  String get discover {
    return Intl.message('Discover', name: 'discover', desc: '', args: []);
  }

  /// `Me`
  String get me {
    return Intl.message('Me', name: 'me', desc: '', args: []);
  }

  /// `Pay and Services`
  String get pay {
    return Intl.message('Pay and Services', name: 'pay', desc: '', args: []);
  }

  /// `Post`
  String get post {
    return Intl.message('Post', name: 'post', desc: '', args: []);
  }

  /// `Favorite`
  String get favorite {
    return Intl.message('Favorite', name: 'favorite', desc: '', args: []);
  }

  /// `Setting`
  String get setting {
    return Intl.message('Setting', name: 'setting', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Scan QR Code`
  String get scan_qr {
    return Intl.message('Scan QR Code', name: 'scan_qr', desc: '', args: []);
  }

  /// `Scan this QR code in the app to reach me.`
  String get scan_qr_body {
    return Intl.message(
      'Scan this QR code in the app to reach me.',
      name: 'scan_qr_body',
      desc: '',
      args: [],
    );
  }

  /// `calls`
  String get calls {
    return Intl.message('calls', name: 'calls', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Friend request`
  String get friend_request {
    return Intl.message(
      'Friend request',
      name: 'friend_request',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `  Are you sure you want to cancel the friend request?`
  String get cancel_order_body {
    return Intl.message(
      '  Are you sure you want to cancel the friend request?',
      name: 'cancel_order_body',
      desc: '',
      args: [],
    );
  }

  /// `Cancel order`
  String get cancel_order {
    return Intl.message(
      'Cancel order',
      name: 'cancel_order',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to unfriend?`
  String get cancel_friend_body {
    return Intl.message(
      'Are you sure you want to unfriend?',
      name: 'cancel_friend_body',
      desc: '',
      args: [],
    );
  }

  /// `Unfriend`
  String get cancel_friend {
    return Intl.message('Unfriend', name: 'cancel_friend', desc: '', args: []);
  }

  /// `Sent to you`
  String get send_to_you {
    return Intl.message('Sent to you', name: 'send_to_you', desc: '', args: []);
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message('Accept', name: 'accept', desc: '', args: []);
  }

  /// `Reject`
  String get reject {
    return Intl.message('Reject', name: 'reject', desc: '', args: []);
  }

  /// `Chat Only Friend`
  String get chat_only_friend {
    return Intl.message(
      'Chat Only Friend',
      name: 'chat_only_friend',
      desc: '',
      args: [],
    );
  }

  /// `Groub Chats`
  String get groub_chats {
    return Intl.message('Groub Chats', name: 'groub_chats', desc: '', args: []);
  }

  /// `My Work & Work Contacts`
  String get my_work {
    return Intl.message(
      'My Work & Work Contacts',
      name: 'my_work',
      desc: '',
      args: [],
    );
  }

  /// `Qabilati Contacts`
  String get qabilati_contacts {
    return Intl.message(
      'Qabilati Contacts',
      name: 'qabilati_contacts',
      desc: '',
      args: [],
    );
  }

  /// `My Friends`
  String get my_friends {
    return Intl.message('My Friends', name: 'my_friends', desc: '', args: []);
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `New Groub`
  String get new_groub {
    return Intl.message('New Groub', name: 'new_groub', desc: '', args: []);
  }

  /// `Members`
  String get members {
    return Intl.message('Members', name: 'members', desc: '', args: []);
  }

  /// `Group information`
  String get groub_info {
    return Intl.message(
      'Group information',
      name: 'groub_info',
      desc: '',
      args: [],
    );
  }

  /// `Group Media`
  String get media_groub {
    return Intl.message('Group Media', name: 'media_groub', desc: '', args: []);
  }

  /// `Delete Groub`
  String get delete_groub {
    return Intl.message(
      'Delete Groub',
      name: 'delete_groub',
      desc: '',
      args: [],
    );
  }

  /// `Qr Code`
  String get qr_Groub {
    return Intl.message('Qr Code', name: 'qr_Groub', desc: '', args: []);
  }

  /// `Audio Broadcast`
  String get audio_broadcast {
    return Intl.message(
      'Audio Broadcast',
      name: 'audio_broadcast',
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

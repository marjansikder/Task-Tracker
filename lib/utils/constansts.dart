class AppStrings{
  static String SIGN_IN = "Sign in";
  static String SIGN_UP = "Sign up";
  static String UPDATE = "Update";
  static String CREATE_TASK = "Create Task";
  static String SUBMIT = "Submit";
  static String NAME_HINT = "Type name here";
  static String EMAIL_HINT = "Type email here";
  static String TITLE = "Type title here";
  static String PASSWORD_HINT = "Type password here";
  static String AGE = "Type age here";
  static String DESCRIPTION = "Type description here";
  static String RETYPE_PASSWORD_HINT = "Retype password here";

  AppStrings._privateConstructor();
  static final AppStrings _instance = AppStrings._privateConstructor();
  static AppStrings get instance => _instance;

  static const String APP_NAME = 'Task Tracker';
  static const String CONNECTION_TIME_OUT_ERROR = 'Connection timeout with API server';
  static const String CONNECTION_CANCELED = 'Request to API server was cancelled';
  static const String CONNECTION_TIME_OUT_ON_RECEIVED = 'Receive timeout in connection with API server';
  static const String CONNECTION_TIME_OUT_ON_SEND = 'Send timeout in connection with API server';
  static const String CONNECTION_ERROR_NO_INTERNET = 'Connection to API server failed due to internet connection';



}

class AppConstants{

  AppConstants._privateConstructor();
  static final AppConstants _instance = AppConstants._privateConstructor();
  static AppConstants get instance => _instance;

  static const int SPLASH_SCREEN_DURATION = 3;
  static const String DEVICE_TOKEN = "2OEL4P1Rz04-2OEL4P1Rz04-2OEL4P1Rz04-2OEL4P1Rz04";
  static const String PREF_KEY_AUTH_TOKEN = "bearer_token";
  static const String USER_INFO = "user_info";
}


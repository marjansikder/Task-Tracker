class ServerAddresses {

  ServerAddresses._privateConstructor();
  static final ServerAddresses _instance = ServerAddresses._privateConstructor();
  static ServerAddresses get instance => _instance;

  static const _baseUrl = "https://api-todo-list.jotno.dev";
  static const _userLogin = "/user/login";
  static const _userSignUp = "/user/register";
  static const _userLogOut = "/user/logout";
  static const _taskList = "/task";
  static const _taskAdd = "/task";

  static get baseUrl => _baseUrl;
  static get userLogin => _userLogin;
  static get userSignUp => _userSignUp;
  static get userLogOut => _userLogOut;
  static get taskList => _taskList;
  static get taskAdd => _taskAdd;
}
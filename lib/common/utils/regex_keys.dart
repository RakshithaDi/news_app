class RegexHelper {
  static const email_regex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const password_regex = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
  static const name_Regex = r'^[a-zA-Z]+(?: [a-zA-Z]+)*$';
}

class RegexHelper {
  static const email_regex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const password_regex = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
}

import 'dart:developer';

class NewsLogger {
  static void printApiRequest(String data) {
    log("-----------------API REQUEST START---------------");
    log(data);
    log("-----------------API REQUEST END---------------");
  }

  static void printApiResponse(String data) {
    log("-----------------API RESPONSE---------------");
    log(data);
    log("-----------------API RESPONSE END---------------");
  }
}

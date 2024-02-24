class ErrorHandler{
  final int code;
  final String? message;

  ErrorHandler({required this.message,required this.code});

  String getMessage(){
    switch(code){
      case 400:
        return message??"Bad Response Format";
      case 401:
        return message??"Unauthorized User";
      case 500:
        return message??"Internal Server Error";
      case 404:
        return message??"Resource Not Found";
      default:
        return message??"Unknown Error";
    }
  }
}
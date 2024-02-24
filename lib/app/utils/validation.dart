class Validation
{
  bool isNumeric(String? value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }    // mobile

  static String? customNameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

   String? customNumberValidation(String? value) {
    {
      if (value == null || value.isEmpty)
      {
        return 'Please enter a mobile number';
      }
      else if (value.length != 10 ||!isNumeric(value))
      {
        return 'Please enter a valid 10-digit mobile number';
      }
      return null;
    }
  }

  static String? customEmailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? customPasswordValidation(String? value){
    if (value == null || value.isEmpty)
    {
      return 'Please enter a password';
    }
    else if (value.length < 10)
    {
      return 'Password must be at least 10 characters long';
    }
    else if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(value))
    {
      return 'Password must contain both letters and numbers';
    }
    return null;
  }

  static String? customConfirmPasswordValidation(String? value){
    if (value == null || value.isEmpty)
    {
      return 'Please enter a password';
    }
    else if (value.length < 10)
    {
      return 'Password must be at least 10 characters long';
    }
    else if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(value))
    {
      return 'Password must contain both letters and numbers';
    }
    return null;
  }

  static String? customRoleValidation(String? value){
    {
      if (value == null || value.isEmpty) {
        return 'Please select a Type';
      }
      return null;
    }
  }

}
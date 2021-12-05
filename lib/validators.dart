
class Validator {

  static late String password;
  static String? validatePassword(String? value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = new RegExp(pattern.toString());

    password = value!.trim();
    if(value!.trim().isEmpty){
      return 'This field cannot be left empty.';
    }else if (!regex.hasMatch(value!.trim()))
      return 'Password must be at least 6 characters.';
    else
      return null;

  }

  //This is for validating the Name
  static String? validateName(String? value) {
    Pattern pattern = r"^[a-zA-Z]+[a-zA-Z]*$";
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value!.trim()))
      return 'Please enter a name.';
    else
      return null;
  }

  //This is for validating other fields
  static String? validateField(String? value) {
    Pattern pattern = r"^[a-zA-Z]+[a-zA-Z]*$";
    RegExp regex = new RegExp(pattern.toString());
    if (value!.trim().isEmpty)
      return 'Field cannot be empty.';
    else
      return null;
  }
}
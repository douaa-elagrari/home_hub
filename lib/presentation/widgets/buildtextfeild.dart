import '../../utils/utils.dart';

Widget buildTextField(
  BuildContext context,
  String label,
  String hint, {
  bool obscure = false,
  TextInputType? keyboardType,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double fontSize = screenWidth * 0.045; // responsive font
  double paddingVertical = screenWidth * 0.035;

  return Padding(
    padding: EdgeInsets.only(bottom: paddingVertical),
    child: Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: TextField(
        obscureText: obscure,
        keyboardType: keyboardType,
        cursorColor: const Color(0xFF004E98),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: fontSize,
          ),
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: fontSize * 0.9,
          ),
          filled: true,
          fillColor: Colors.white, // white fill
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF004E98), width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: paddingVertical,
          ),
        ),
        style: TextStyle(fontSize: fontSize, color: Colors.black87),
      ),
    ),
  );
}

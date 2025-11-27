import '../../utils/utils.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final Color bgcolor;
  final Color fgcolor;
  final VoidCallback onPressed;
  const Mybutton({
    super.key,
    required this.text,
    required this.bgcolor,
    required this.fgcolor,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          foregroundColor: fgcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Color(0xFF004E98), width: 2.0),
          ),
          elevation: 5,
          padding: EdgeInsets.all(10),
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        child: Text(text),
      ),
    );
  }
}

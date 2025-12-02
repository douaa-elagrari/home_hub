import 'package:flutter/material.dart';

class Minibutton extends StatefulWidget {
  final String text;
  final Color bgcolor;

  final VoidCallback onPressed;
  const Minibutton({
    super.key,
    required this.text,
    required this.bgcolor,

    required this.onPressed,
  });

  @override
  State<Minibutton> createState() => _MybuttonState();
}

class _MybuttonState extends State<Minibutton> {
  bool _isLoading = false;

  Future<bool> _handlePress() async {
    if (_isLoading) return false;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 1));
    widget.onPressed();

    setState(() {
      _isLoading = false;
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 45,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handlePress,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.bgcolor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Color(0xFF004E98), width: 2.0),
          ),
          elevation: 5,
          padding: EdgeInsets.all(10),
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        child: _isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : Text(widget.text),
      ),
    );
  }
}

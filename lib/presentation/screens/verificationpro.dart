import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/signup_pro_cubit.dart';

class VerificationPro extends StatefulWidget {
  const VerificationPro({super.key});

  @override
  State<VerificationPro> createState() => _VerificationProState();
}

class _VerificationProState extends State<VerificationPro> {
  final int _otpLength = 6;
  final List<TextEditingController> _controllers = [];
  final List<FocusNode> _focusNodes = [];
  bool _isResending = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _otpLength; i++) {
      _controllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < _otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  Future<void> _resendCode() async {
    setState(() => _isResending = true);

    final signupCubit = context.read<SignupProCubit>();
    try {
      await signupCubit.apiService.sendCode(signupCubit.state.email);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Verification code resent successfully'),
            backgroundColor: Colors.green,
          ),
        );

        for (var controller in _controllers) {
          controller.clear();
        }
        _focusNodes[0].requestFocus();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to resend code: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isResending = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final signupCubit = context.read<SignupProCubit>();

    // Responsive container width
    double containerWidth = screenWidth < 600
        ? screenWidth * 0.9
        : screenWidth < 900
        ? screenWidth * 0.7
        : 600;

    return BlocListener<SignupProCubit, SignupProState>(
      listener: (context, state) {
        if (state.submitted) {
          Navigator.pushReplacementNamed(context, '/home_screen_pro');
        }
        if (state.error.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.05,
              ),
              child: Column(
                children: [
                  // Back button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.chevron_left, size: 35),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Card container
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                      vertical: screenHeight * 0.04,
                    ),
                    width: containerWidth,
                    constraints: BoxConstraints(
                      maxWidth: 600,
                      minHeight: screenHeight * 0.5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Verification Code',
                          style: TextStyle(
                            color: const Color(0xFF004E98),
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth < 400 ? 24 : 28,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.015),

                        // Email info
                        BlocBuilder<SignupProCubit, SignupProState>(
                          builder: (context, state) {
                            return Text(
                              'Enter the code sent to\n${state.email}',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: screenWidth < 400 ? 12 : 14,
                              ),
                              textAlign: TextAlign.center,
                            );
                          },
                        ),
                        SizedBox(height: screenHeight * 0.04),

                        // OTP fields - FULLY RESPONSIVE
                        LayoutBuilder(
                          builder: (context, constraints) {
                            // Calculate field size based on available width
                            double availableWidth = constraints.maxWidth;
                            double spacing = 8.0;
                            double totalSpacing = spacing * (_otpLength - 1);
                            double fieldWidth =
                                (availableWidth - totalSpacing) / _otpLength;

                            // Clamp to reasonable sizes
                            fieldWidth = fieldWidth.clamp(35.0, 60.0);
                            double fieldHeight = fieldWidth;
                            double fontSize = fieldWidth * 0.4;

                            return Wrap(
                              alignment: WrapAlignment.center,
                              spacing: spacing,
                              runSpacing: 10,
                              children: List.generate(_otpLength, (index) {
                                return SizedBox(
                                  width: fieldWidth,
                                  height: fieldHeight,
                                  child: TextField(
                                    controller: _controllers[index],
                                    focusNode: _focusNodes[index],
                                    cursorColor: const Color(0xFF004E98),
                                    maxLength: 1,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      counterText: "",
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.zero,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color: Color(0xFF004E98),
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    onChanged: (value) =>
                                        _onChanged(value, index),
                                  ),
                                );
                              }),
                            );
                          },
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        // Resend code button
                        TextButton(
                          onPressed: _isResending ? null : _resendCode,
                          child: _isResending
                              ? const SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Color(0xFF004E98),
                                  ),
                                )
                              : Text(
                                  "Didn't receive the code? Resend",
                                  style: TextStyle(
                                    color: const Color(0xFF004E98),
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth < 400 ? 12 : 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),

                        SizedBox(height: screenHeight * 0.025),

                        // Verify button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF004E98),
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth < 400 ? 16 : 18,
                              ),
                            ),
                            onPressed: () async {
                              String otp = _controllers
                                  .map((c) => c.text)
                                  .join();
                              if (otp.length == _otpLength) {
                                await signupCubit.verifyCode(otp);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please enter the full OTP'),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'Verify',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

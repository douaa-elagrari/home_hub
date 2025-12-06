import '../../utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
    for (var c in _controllers) c.dispose();
    for (var f in _focusNodes) f.dispose();
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
    final signupCubit = context.read<SignupCubit>();
    try {
      await signupCubit.apiService.sendCode(signupCubit.state.email);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Verification code resent successfully'),
            backgroundColor: Colors.green,
          ),
        );
        for (var controller in _controllers) controller.clear();
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
      if (mounted) setState(() => _isResending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final signupCubit = context.read<SignupCubit>();

    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.submitted) {
          Navigator.pushReplacementNamed(context, '/homescreen');
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Center(
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
                  const SizedBox(height: 40),

                  // Smaller Card container
                  Container(
                    padding: const EdgeInsets.all(20), // smaller padding
                    width: size.width * 0.8, // smaller width
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
                        const Text(
                          'Verification Code',
                          style: TextStyle(
                            color: Color(0xFF004E98),
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Email info
                        BlocBuilder<SignupCubit, SignupState>(
                          builder: (context, state) {
                            return Text(
                              'Enter the code sent to\n${state.email}',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            );
                          },
                        ),
                        const SizedBox(height: 30),

                        // OTP fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(_otpLength, (index) {
                            double screenWidth = MediaQuery.of(
                              context,
                            ).size.width;
                            double availableWidth =
                                (screenWidth * 0.8) -
                                40; // smaller container padding
                            double fieldWidth =
                                (availableWidth / _otpLength) -
                                6; // adjust spacing
                            fieldWidth = fieldWidth.clamp(
                              30.0,
                              33.0,
                            ); // slightly smaller

                            return Container(
                              width: fieldWidth,
                              height: fieldWidth,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              child: TextField(
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                cursorColor: const Color(0xFF004E98),
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: fieldWidth * 0.4,
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
                                onChanged: (value) => _onChanged(value, index),
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 30),

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
                              : const Text(
                                  "Didn't receive the code? Resend",
                                  style: TextStyle(
                                    color: Color(0xFF004E98),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),

                        const SizedBox(height: 20),

                        // Verify button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF004E98),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
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

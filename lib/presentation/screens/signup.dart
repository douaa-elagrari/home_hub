import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/utils.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(
        apiBaseUrl: 'https://email-verification-api-29xi.onrender.com',
      ),
      child: SignupForm(),
    );
  }
}

class SignupForm extends StatefulWidget {
  SignupForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  State<SignupForm> createState() => _SignupFormFormState();
}

class _SignupFormFormState extends State<SignupForm> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final cubit = context.read<SignupCubit>();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: screenWidth < 400 ? screenWidth * 0.95 : 400,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 30,
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    // Navigate to verification when code is sent
                    if (state.codeSent) {
                      // Pass the cubit to the verification screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: cubit,
                            child: const Verification(),
                          ),
                        ),
                      );
                    }

                    // Show error messages
                    if (state.error.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: widget._formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              loc.signUp,
                              style: const TextStyle(
                                color: Color(0xFF004E98),
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: loc.email,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onChanged: cubit.emailChanged,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty)
                                return loc.enterEmail;
                              if (!RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                              ).hasMatch(value.trim()))
                                return loc.invalidEmail;
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: loc.username,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onChanged: cubit.usernameChanged,
                            validator: (v) => v == null || v.isEmpty
                                ? loc.enterUsername
                                : null,
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: loc.password,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword,
                                ),
                              ),
                            ),
                            onChanged: cubit.passwordChanged,
                            validator: (v) => v == null || v.length < 6
                                ? loc.atLeast6Chars
                                : null,
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            obscureText: _obscureConfirmPassword,
                            decoration: InputDecoration(
                              labelText: loc.confirmPassword,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirmPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () => setState(
                                  () => _obscureConfirmPassword =
                                      !_obscureConfirmPassword,
                                ),
                              ),
                            ),
                            onChanged: cubit.confirmPasswordChanged,
                            validator: (v) => v == null || v != state.password
                                ? loc.passwordsDoNotMatch
                                : null,
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Mybutton(
                              text: loc.signUp,
                              bgcolor: const Color(0xFF004E98),
                              fgcolor: Colors.white,
                              onPressed: () {
                                if (widget._formKey.currentState!.validate())
                                  cubit.submit();
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  loc.alreadyHaveAccount,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    Navigator.pushNamed(context, '/signin'),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    loc.signin,
                                    style: const TextStyle(
                                      color: Color(0xFF004E98),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


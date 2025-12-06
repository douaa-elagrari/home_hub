// import 'package:flutter/material.dart';
// import '../widgets/button.dart'; // your Mybutton widget

// class SignupPro extends StatefulWidget {
//   const SignupPro({super.key});

//   @override
//   State<SignupPro> createState() => _SignupProState();
// }

// class _SignupProState extends State<SignupPro> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _companyController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final TextEditingController _vatController = TextEditingController();

//   // Professional type: Individual or Company
//   String _selectedType = 'Individual';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: Center(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 450),
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
//               margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.3),
//                     blurRadius: 6,
//                     spreadRadius: 2,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'Professional Sign Up',
//                       style: TextStyle(
//                         color: const Color(0xFF004E98),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 28,
//                       ),
//                     ),
//                     const SizedBox(height: 30),

//                     // Type Selection: Cards
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         GestureDetector(
//                           onTap: () =>
//                               setState(() => _selectedType = 'Individual'),
//                           child: Container(
//                             width: 125,
//                             padding: const EdgeInsets.all(20),
//                             decoration: BoxDecoration(
//                               color: _selectedType == 'Individual'
//                                   ? const Color(0xFF004E98)
//                                   : Colors.white,
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(
//                                 color: _selectedType == 'Individual'
//                                     ? Colors.transparent
//                                     : Colors.grey,
//                                 width: 1.5,
//                               ),
//                               boxShadow: _selectedType == 'Individual'
//                                   ? [
//                                       BoxShadow(
//                                         color: Colors.grey.withOpacity(0.2),
//                                         blurRadius: 4,
//                                       ),
//                                     ]
//                                   : [],
//                             ),
//                             child: Column(
//                               children: [
//                                 Icon(
//                                   Icons.person,
//                                   size: 40,
//                                   color: _selectedType == 'Individual'
//                                       ? Colors.white
//                                       : Colors.grey[700],
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   'Individual',
//                                   style: TextStyle(
//                                     color: _selectedType == 'Individual'
//                                         ? Colors.white
//                                         : Colors.grey[800],
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () =>
//                               setState(() => _selectedType = 'Company'),
//                           child: Container(
//                             width: 125,
//                             padding: const EdgeInsets.all(20),
//                             decoration: BoxDecoration(
//                               color: _selectedType == 'Company'
//                                   ? const Color(0xFF004E98)
//                                   : Colors.white,
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(
//                                 color: _selectedType == 'Company'
//                                     ? Colors.transparent
//                                     : Colors.grey,
//                                 width: 1.5,
//                               ),
//                               boxShadow: _selectedType == 'Company'
//                                   ? [
//                                       BoxShadow(
//                                         color: Colors.grey.withOpacity(0.2),
//                                         blurRadius: 4,
//                                       ),
//                                     ]
//                                   : [],
//                             ),
//                             child: Column(
//                               children: [
//                                 Icon(
//                                   Icons.business,
//                                   size: 40,
//                                   color: _selectedType == 'Company'
//                                       ? Colors.white
//                                       : Colors.grey[700],
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   'Company',
//                                   style: TextStyle(
//                                     color: _selectedType == 'Company'
//                                         ? Colors.white
//                                         : Colors.grey[800],
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30),

//                     // Name field
//                     if (_selectedType == 'Individual')
//                       TextFormField(
//                         controller: _nameController,
//                         decoration: InputDecoration(
//                           labelText: 'Full Name',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'Enter your full name';
//                           }
//                           return null;
//                         },
//                       ),
//                     if (_selectedType == 'Company')
//                       TextFormField(
//                         controller: _companyController,
//                         decoration: InputDecoration(
//                           labelText: 'Company Name',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'Enter company name';
//                           }
//                           return null;
//                         },
//                       ),
//                     const SizedBox(height: 15),

//                     // Phone
//                     TextFormField(
//                       controller: _phoneController,
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         labelText: 'Phone Number',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Enter phone number';
//                         } else if (!RegExp(
//                           r'^(05|06|07)[0-9]{8}$',
//                         ).hasMatch(value.trim())) {
//                           return 'Invalid phone number';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 15),

//                     // Email
//                     TextFormField(
//                       controller: _emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Enter email';
//                         } else if (!RegExp(
//                           r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
//                         ).hasMatch(value.trim())) {
//                           return 'Invalid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 15),

//                     // VAT for companies
//                     if (_selectedType == 'Company')
//                       TextFormField(
//                         controller: _vatController,
//                         decoration: InputDecoration(
//                           labelText: 'VAT / Registration Number',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (_selectedType == 'Company' &&
//                               (value == null || value.trim().isEmpty)) {
//                             return 'Enter VAT/Registration Number';
//                           }
//                           return null;
//                         },
//                       ),
//                     if (_selectedType == 'Company') const SizedBox(height: 15),

//                     // Password
//                     TextFormField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Enter password';
//                         } else if (value.trim().length < 6) {
//                           return 'At least 6 characters';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 15),

//                     // Confirm Password
//                     TextFormField(
//                       controller: _confirmPasswordController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Confirm Password',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Confirm your password';
//                         } else if (value != _passwordController.text) {
//                           return 'Passwords do not match';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 30),

//                     // Submit button
//                     Center(
//                       child: Mybutton(
//                         text: 'Sign Up',
//                         bgcolor: const Color(0xFF004E98),
//                         fgcolor: Colors.white,
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             Navigator.pushNamed(context, '/home_screen_pro');
//                           }
//                         },
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Sign In prompt
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Already have an account? "),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/signin_pro');
//                           },
//                           child: Text(
//                             'Sign In',
//                             style: TextStyle(
//                               color: const Color(0xFF004E98),
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/signup_pro_cubit.dart';
import 'verificationpro.dart';

class SignupPro extends StatelessWidget {
  const SignupPro({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupProCubit(
        apiBaseUrl: 'https://email-verification-api-29xi.onrender.com',
      ),
      child: const SignupProForm(),
    );
  }
}

class SignupProForm extends StatefulWidget {
  const SignupProForm({super.key});

  @override
  State<SignupProForm> createState() => _SignupProFormState();
}

class _SignupProFormState extends State<SignupProForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _vatController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _companyController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _vatController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<SignupProCubit, SignupProState>(
      listener: (context, state) {
        // Navigate to verification when code is sent
        if (state.codeSent) {
          final cubit = context.read<SignupProCubit>();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: cubit,
                child: const VerificationPro(),
              ),
            ),
          );
        }

        // Show error messages
        if (state.error.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<SignupProCubit>();

        return Scaffold(
          backgroundColor: Colors.grey[100],
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth < 450 ? screenWidth * 0.95 : 450,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 20,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 13,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              loc.professionalSignUp,
                              style: const TextStyle(
                                color: Color(0xFF004E98),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: _buildTypeBox(
                                  width: 160,
                                  selected: state.type == 'Individual',
                                  icon: Icons.person,
                                  label: loc.individual,
                                  onTap: () => cubit.changeType('Individual'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: _buildTypeBox(
                                  width: 160,
                                  selected: state.type == 'Company',
                                  icon: Icons.business,
                                  label: loc.company,
                                  onTap: () => cubit.changeType('Company'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          if (state.type == 'Individual')
                            _buildTextField(
                              controller: _nameController,
                              label: loc.fullName,
                              validatorMsg: loc.enterFullName,
                              onChanged: (v) => cubit.nameChanged(v.trim()),
                            ),
                          if (state.type == 'Company')
                            _buildTextField(
                              controller: _companyController,
                              label: loc.companyName,
                              validatorMsg: loc.enterCompanyName,
                              onChanged: (v) =>
                                  cubit.companyNameChanged(v.trim()),
                            ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            controller: _phoneController,
                            label: loc.phoneNumber,
                            keyboardType: TextInputType.phone,
                            onChanged: (v) => cubit.phoneChanged(v.trim()),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty)
                                return loc.enterPhoneNumber;
                              if (!RegExp(
                                r'^(05|06|07)[0-9]{8}$',
                              ).hasMatch(value.trim()))
                                return loc.invalidPhoneNumber;
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            controller: _emailController,
                            label: loc.email,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (v) => cubit.emailChanged(v.trim()),
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
                          if (state.type == 'Company') ...[
                            _buildTextField(
                              controller: _vatController,
                              label: loc.vatNumber,
                              validatorMsg: loc.enterVatNumber,
                              onChanged: (v) =>
                                  cubit.vatNumberChanged(v.trim()),
                            ),
                            const SizedBox(height: 15),
                            _buildTextField(
                              controller: _locationController,
                              label: loc.location,
                              validatorMsg: loc.enterLocation,
                              onChanged: (v) => cubit.locationChanged(v.trim()),
                            ),
                            const SizedBox(height: 15),
                            _buildTextField(
                              controller: _descriptionController,
                              label: loc.description,
                              maxLines: 3,
                              validatorMsg: loc.enterDescription,
                              onChanged: (v) =>
                                  cubit.descriptionChanged(v.trim()),
                            ),
                            const SizedBox(height: 15),
                          ],
                          _buildTextField(
                            controller: _passwordController,
                            label: loc.password,
                            obscureText: _obscurePassword,
                            onChanged: cubit.passwordChanged,
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
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return loc.enterPassword;
                              if (value.length < 6) return loc.atLeast6Chars;
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            controller: _confirmPasswordController,
                            label: loc.confirmPassword,
                            obscureText: _obscureConfirmPassword,
                            onChanged: cubit.confirmPasswordChanged,
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
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return loc.confirmYourPassword;
                              if (value != _passwordController.text)
                                return loc.passwordsDoNotMatch;
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: Mybutton(
                              text: state.isSubmitting
                                  ? loc.submitting
                                  : loc.signUp,
                              bgcolor: const Color(0xFF004E98),
                              fgcolor: Colors.white,
                              onPressed: () async {
                                if (state.isSubmitting) return;
                                if (_formKey.currentState!.validate()) {
                                  await cubit.submitForm(
                                    name: _nameController.text.trim(),
                                    companyName: _companyController.text.trim(),
                                    phone: _phoneController.text.trim(),
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text,
                                    vatNumber: _vatController.text.trim(),
                                    location: _locationController.text.trim(),
                                    description: _descriptionController.text
                                        .trim(),
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
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
                                    Navigator.pushNamed(context, '/signin_pro'),
                                child: Flexible(
                                  child: Text(
                                    loc.signIn,
                                    style: const TextStyle(
                                      color: Color(0xFF004E98),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? validatorMsg,
    int maxLines = 1,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator:
          validator ??
          (value) =>
              (validatorMsg != null && (value == null || value.trim().isEmpty))
              ? validatorMsg
              : null,
    );
  }

  Widget _buildTypeBox({
    required double width,
    required bool selected,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF004E98) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: selected ? Colors.transparent : Colors.grey,
            width: 1.5,
          ),
          boxShadow: selected
              ? [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4)]
              : [],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: selected ? Colors.white : Colors.grey[700],
            ),
            const SizedBox(height: 10),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

















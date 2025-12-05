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

// Main widget that provides the cubit
class SignupPro extends StatelessWidget {
  const SignupPro({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupProCubit(),
      child: const SignupProForm(),
    );
  }
}

// Form widget that uses the cubit
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
    return BlocConsumer<SignupProCubit, SignupProState>(
      listener: (context, state) {
        if (state.submitted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Registered successfully!',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pushReplacementNamed(context, '/home_screen_pro');
        } else if (state.error.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<SignupProCubit>();

        return Scaffold(
          backgroundColor: Colors.grey[100],
          body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 450),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 30,
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
                        const Text(
                          'Professional Sign Up',
                          style: TextStyle(
                            color: Color(0xFF004E98),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Type selection (Individual or Company)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () => cubit.changeType('Individual'),
                              child: Container(
                                width: 120,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: state.type == 'Individual'
                                      ? const Color(0xFF004E98)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: state.type == 'Individual'
                                        ? Colors.transparent
                                        : Colors.grey,
                                    width: 1.5,
                                  ),
                                  boxShadow: state.type == 'Individual'
                                      ? [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 4,
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 40,
                                      color: state.type == 'Individual'
                                          ? Colors.white
                                          : Colors.grey[700],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Individual',
                                      style: TextStyle(
                                        color: state.type == 'Individual'
                                            ? Colors.white
                                            : Colors.grey[800],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => cubit.changeType('Company'),
                              child: Container(
                                width: 120,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: state.type == 'Company'
                                      ? const Color(0xFF004E98)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: state.type == 'Company'
                                        ? Colors.transparent
                                        : Colors.grey,
                                    width: 1.5,
                                  ),
                                  boxShadow: state.type == 'Company'
                                      ? [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 4,
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.business,
                                      size: 40,
                                      color: state.type == 'Company'
                                          ? Colors.white
                                          : Colors.grey[700],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Company',
                                      style: TextStyle(
                                        color: state.type == 'Company'
                                            ? Colors.white
                                            : Colors.grey[800],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),

                        // Name field (Individual) or Company Name field (Company)
                        if (state.type == 'Individual')
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Enter your full name';
                              }
                              return null;
                            },
                          ),
                        if (state.type == 'Company')
                          TextFormField(
                            controller: _companyController,
                            decoration: InputDecoration(
                              labelText: 'Company Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Enter company name';
                              }
                              return null;
                            },
                          ),
                        const SizedBox(height: 15),

                        // Phone Number
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter phone number';
                            } else if (!RegExp(
                              r'^(05|06|07)[0-9]{8}$',
                            ).hasMatch(value.trim())) {
                              return 'Invalid phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Email
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter email';
                            } else if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                            ).hasMatch(value.trim())) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // VAT Number (only for Company)
                        if (state.type == 'Company')
                          TextFormField(
                            controller: _vatController,
                            decoration: InputDecoration(
                              labelText: 'VAT / Registration Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (state.type == 'Company' &&
                                  (value == null || value.trim().isEmpty)) {
                                return 'Enter VAT/Registration Number';
                              }
                              return null;
                            },
                          ),
                        if (state.type == 'Company') const SizedBox(height: 15),

                        // Location (only for Company)
                        if (state.type == 'Company')
                          TextFormField(
                            controller: _locationController,
                            decoration: InputDecoration(
                              labelText: 'Location',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (state.type == 'Company' &&
                                  (value == null || value.trim().isEmpty)) {
                                return 'Enter location';
                              }
                              return null;
                            },
                          ),
                        if (state.type == 'Company') const SizedBox(height: 15),

                        // Description (only for Company)
                        if (state.type == 'Company')
                          TextFormField(
                            controller: _descriptionController,
                            maxLines: 3,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (state.type == 'Company' &&
                                  (value == null || value.trim().isEmpty)) {
                                return 'Enter description';
                              }
                              return null;
                            },
                          ),
                        if (state.type == 'Company') const SizedBox(height: 15),

                        // Password
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter password';
                            } else if (value.trim().length < 6) {
                              return 'At least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Confirm Password
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Confirm your password';
                            } else if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),

                        // Submit Button
                        Center(
                          child: Mybutton(
                            text: state.isSubmitting
                                ? 'Submitting...'
                                : 'Sign Up',
                            bgcolor: const Color(0xFF004E98),
                            fgcolor: Colors.white,
                            onPressed: () async {
                              if (state.isSubmitting)
                                return; // Don't do anything if already submitting

                              if (_formKey.currentState!.validate()) {
                                await cubit.submitForm(
                                  name: _nameController.text.trim(),
                                  companyName: _companyController.text.trim(),
                                  phone: _phoneController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
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

                        // Sign In Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/signin_pro');
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Color(0xFF004E98),
                                  fontWeight: FontWeight.bold,
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
        );
      },
    );
  }
}




















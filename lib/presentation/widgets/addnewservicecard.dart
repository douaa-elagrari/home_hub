import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../logic/cubit/service_cubit.dart';
import '../../logic/cubit/service_state.dart';

class AddNewService extends StatefulWidget {
  const AddNewService({super.key});

  @override
  State<AddNewService> createState() => _AddNewServiceState();
}

class _AddNewServiceState extends State<AddNewService> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController descC = TextEditingController();

  String? username;
  bool _isAdding = false;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("logged_username");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceCubit, ServiceState>(
      listener: (context, state) {
        if (state is ServiceError) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error: ${state.message}"),
              backgroundColor: Colors.red,
            ),
          );
          setState(() {
            _isAdding = false;
          });
        } else if (state is ServiceLoaded) {
          // Service added successfully, navigate back
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Service added successfully!"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context); // Go back to previous page
        }
      },
      child: Card(
        color: Colors.white,
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Add New Service",
                  style: TextStyle(
                    color: Color(0xFF004E98),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Text("Service Name"),
              TextField(controller: nameC),

              const SizedBox(height: 20),
              const Text("Description"),
              TextField(controller: descC, maxLines: 3),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (username == null || _isAdding)
                      ? null
                      : () async {
                          if (nameC.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter service name"),
                                backgroundColor: Colors.orange,
                              ),
                            );
                            return;
                          }

                          setState(() {
                            _isAdding = true;
                          });

                          try {
                            await context.read<ServiceCubit>().addService(
                              nameC.text.trim(),
                              descC.text.trim(),
                              username!,
                            );
                          } catch (e) {
                            setState(() {
                              _isAdding = false;
                            });
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004E98),
                  ),
                  child: _isAdding
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        )
                      : const Text(
                          "Add Service",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameC.dispose();
    descC.dispose();
    super.dispose();
  }
}

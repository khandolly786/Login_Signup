// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'home_screen.dart';
//
// class SignupScreen extends StatefulWidget {
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   void _signup() async {
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();
//
//     try {
//       await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Signup Successful!")),
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.purple.shade800, Colors.blue.shade600],
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Container(
//               padding: EdgeInsets.all(25),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 10,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "Create Account",
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   TextField(
//                     controller: emailController,
//                     style: TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       labelText: "Email",
//                       labelStyle: TextStyle(color: Colors.white),
//                       prefixIcon: Icon(Icons.email, color: Colors.white),
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.1),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   TextField(
//                     controller: passwordController,
//                     obscureText: true,
//                     style: TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       labelText: "Password",
//                       labelStyle: TextStyle(color: Colors.white),
//                       prefixIcon: Icon(Icons.lock, color: Colors.white),
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.1),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _signup,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       shadowColor: Colors.black54,
//                       elevation: 5,
//                     ),
//                     child: Text(
//                       "Sign Up",
//                       style: TextStyle(
//                         color: Colors.purple.shade800,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(
//                       "Already have an account? Login",
//                       style: TextStyle(color: Colors.white70, fontSize: 14),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _signup() async {
    if (!_formKey.currentState!.validate()) return;

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();

    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup Successful!")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple.shade800, Colors.blue.shade600],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),

                    // Full Name Field
                    TextFormField(
                      controller: nameController,
                      validator: (value) => value!.isEmpty ? "Enter your name" : null,
                      style: TextStyle(color: Colors.white),
                      decoration: _inputDecoration("Full Name", Icons.person),
                    ),
                    SizedBox(height: 15),

                    // Phone Number Field
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) => value!.isEmpty ? "Enter your phone number" : null,
                      style: TextStyle(color: Colors.white),
                      decoration: _inputDecoration("Phone Number", Icons.phone),
                    ),
                    SizedBox(height: 15),

                    // Email Field
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                      !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)
                          ? "Enter a valid email"
                          : null,
                      style: TextStyle(color: Colors.white),
                      decoration: _inputDecoration("Email", Icons.email),
                    ),
                    SizedBox(height: 15),

                    // Password Field
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) =>
                      value!.length < 6 ? "Password must be at least 6 characters" : null,
                      style: TextStyle(color: Colors.white),
                      decoration: _inputDecoration("Password", Icons.lock),
                    ),
                    SizedBox(height: 15),

                    // Confirm Password Field
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      validator: (value) =>
                      value != passwordController.text ? "Passwords do not match" : null,
                      style: TextStyle(color: Colors.white),
                      decoration: _inputDecoration("Confirm Password", Icons.lock_outline),
                    ),
                    SizedBox(height: 20),

                    // Sign Up Button
                    ElevatedButton(
                      onPressed: _signup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.black54,
                        elevation: 5,
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.purple.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    // Already have an account? Login (with styled link)
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                color: Colors.lightBlueAccent, // Highlight the "Login" text in blue
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white),
      prefixIcon: Icon(icon, color: Colors.white),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}

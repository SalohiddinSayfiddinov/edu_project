
// import 'package:dio/dio.dart';
// import 'package:edu_project/habit/service/authservice.dart';
// import 'package:flutter/material.dart';
// import 'package:edu_project/habit/home.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   late AuthService _authService;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool rememberMe = false;
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _authService = AuthService(Dio());
//   }

//   void _login() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => isLoading = true);

//     try {
//       final response = await _authService.login({
//         "email": _emailController.text.trim(),
//         "password": _passwordController.text.trim(),
//       });

//       if (response.containsKey("token")) {
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HabitTracker()));
//       } else {
//         _showError("Invalid email or password");
//       }
//     } catch (e) {
//       _showError("Login failed: ${e.toString()}");
//     }

//     setState(() => isLoading = false);
//   }

//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Log In', style: _titleStyle), backgroundColor: Colors.grey[200]),
//       backgroundColor: Colors.grey[200],
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 100),
//               Text('Email', style: _labelStyle),
//               TextFormField(controller: _emailController, decoration: _inputDecoration(), validator: _validateEmail),
//               SizedBox(height: 10),
//               Text('Password', style: _labelStyle),
//               TextFormField(controller: _passwordController, decoration: _inputDecoration(), obscureText: true, validator: _validatePassword),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(children: [
//                     Checkbox(value: rememberMe, onChanged: (bool? value) => setState(() => rememberMe = value ?? false)),
//                     Text('Remember me'),
//                   ]),
//                   TextButton(
//                     onPressed: () {}, // TODO: добавить восстановление пароля
//                     child: Text('Forgot Password?', style: TextStyle(color: Colors.orange)),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               _buildLoginButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   InputDecoration _inputDecoration() => InputDecoration(
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//       );

//   Widget _buildLoginButton() => InkWell(
//         onTap: isLoading ? null : _login,
//         child: Container(
//           width: double.infinity,
//           height: 50,
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), gradient: LinearGradient(colors: [Colors.orange, Colors.deepOrange])),
//           alignment: Alignment.center,
//           child: isLoading ? CircularProgressIndicator(color: Colors.white) : Text('Log In', style: TextStyle(color: Colors.white, fontSize: 18)),
//         ),
//       );


// String? _validateEmail(String? value) => value!.isEmpty || !value.contains('@') ? "Enter a valid email" : null;
//   String? _validatePassword(String? value) => value!.length < 6 ? "Password must be at least 6 characters" : null;

//   TextStyle get _titleStyle => TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold);
//   TextStyle get _labelStyle => TextStyle(color: Colors.grey, fontSize: 16);
// }
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final AuthService _authService = AuthService(Dio());
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   bool isLoading = false;

//   void _signUp() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => isLoading = true);

//     final success = await _authService.register(
//       {
//         "name": _nameController.text.trim(),
//         "email": _emailController.text.trim(),
//         "password": _passwordController.text.trim(),
//       },
//     );

//     setState(() => isLoading = false);

// Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HabitTracker()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign Up', style: _titleStyle), backgroundColor: Colors.grey[200]),
//       backgroundColor: Colors.grey[200],
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 100),
//               _buildTextField('Name', _nameController, _validateName),
//               _buildTextField('Email', _emailController, _validateEmail),
//               _buildTextField('Password', _passwordController, _validatePassword, obscureText: true),
//               _buildTextField('Confirm Password', _confirmPasswordController, _validateConfirmPassword, obscureText: true),
//               SizedBox(height: 20),
//               _buildSignUpButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, TextEditingController controller, String? Function(String?) validator, {bool obscureText = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: _labelStyle),
//         TextFormField(controller: controller, decoration: _inputDecoration(), obscureText: obscureText, validator: validator),
//         SizedBox(height: 10),
//       ],
//     );
//   }

//   InputDecoration _inputDecoration() => InputDecoration(
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//       );

//   Widget _buildSignUpButton() => InkWell(
//         onTap: isLoading ? null : _signUp,
//         child: Container(
//           width: double.infinity,
//           height: 50,
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), gradient: LinearGradient(colors: [Colors.orange, Colors.deepOrange])),
//           alignment: Alignment.center,
//           child: isLoading ? CircularProgressIndicator(color: Colors.white) : Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 18)),
//         ),
//       );

//   String? _validateName(String? value) => value!.isEmpty ? "Enter your name" : null;
//   String? _validateEmail(String? value) => value!.isEmpty || !value.contains('@') ? "Enter a valid email" : null;
//   String? _validatePassword(String? value) => value!.length < 6 ? "Password must be at least 6 characters" : null;

// String? _validateConfirmPassword(String? value) => value != _passwordController.text ? "Passwords do not match" : null;
//   TextStyle get _titleStyle => TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold);
//   TextStyle get _labelStyle => TextStyle(color: Colors.grey, fontSize: 16);
// }


// class ConfirmScreen extends StatefulWidget {
//   const ConfirmScreen({super.key});

//   @override
//   _ConfirmScreenState createState() => _ConfirmScreenState();
// }

// class _ConfirmScreenState extends State<ConfirmScreen> {
//   final AuthService _authService = AuthService(Dio());
//   final TextEditingController _emailController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool isLoading = false;

//   void _resetPassword() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => isLoading = true);

//     bool success = await _authService.resetPassword(
//       _emailController.text.trim(),
//       "argument2", 
//       "argument3"  
//     );

//     setState(() => isLoading = false);

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(success ? "Check your email" : "Error sending email")),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Reset Password')),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Text("Enter your email to reset password", textAlign: TextAlign.center),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: "Email"),
//                 validator: (value) => value!.isEmpty || !value.contains('@') ? "Enter a valid email" : null,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: isLoading ? null : _resetPassword,
//                 child: isLoading ? CircularProgressIndicator() : Text("Send Reset Link"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
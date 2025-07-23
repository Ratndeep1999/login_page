import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Form key
  final _formKey = GlobalKey<FormState>();
  // for password visible
  bool _isPasswordVisible = true ;
  // to store password
  String _password = "" ;


  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _conformPasswordController = TextEditingController();

  // methods of widgets
  // name method
  Widget _buildName() {
    return SizedBox(
      // it gives custom height and width
      height: MediaQuery.of(context).size.height * 0.08,
      child: TextFormField(
        controller: _nameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your name";
          } else if (value.length < 3) {
            return "Name is too short";
          } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
            // this restrict to input only letters
            return "Please enter letters only";
          }
          return null;
        },
        minLines: 1,
        cursorHeight: 20,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: "eg.    Ratndeep Chandankhede",
          filled: true,
          fillColor: Colors.deepPurple.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // email method
  Widget _buildEmail() {
    return SizedBox(
      // it gives custom height and width
      height: MediaQuery.of(context).size.height * 0.08,
      child: TextFormField(
        controller: _emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your email";
          } // Regular Expression for valid email pattern
          else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
            return "Please enter a valid email address";
          }
          return null;
        },
        minLines: 1,
        cursorHeight: 20,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "eg. abc@gmail.com",
          filled: true,
          fillColor: Colors.deepPurple.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // password method
  Widget _buildPassword() {
    return SizedBox(
      // it gives custom height and width
      height: MediaQuery.of(context).size.height * 0.08,
      child: TextFormField(
        controller: _passwordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your password";
          } else if (value.length < 8) {
            return "Password must be at least 8 characters" ;
          } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
            return "Password must contain at least one uppercase letter" ;
          } else if (!RegExp(r'[a-z]').hasMatch(value)) {
            return "Password must contain at least one lowercase letter" ;
          } else if (!RegExp(r'[0-9]').hasMatch(value)) {
            return "Password must contain at least one number " ;
          } else if (!RegExp(r'[!@\$&*~_]').hasMatch(value)) {
            return "Password must contain at least one special character (!@#\$&*~_)" ;
          }
          return null;
        },
        obscureText: _isPasswordVisible,
        onSaved: (value) {
          // Assign value to _password if it's not null, otherwise assign an empty string ""
          _password = value ?? "" ;
        },
        onChanged: (value) {
          value = _password;
        },
        minLines: 1,
        cursorHeight: 20,
        decoration: InputDecoration(
          suffixIcon:
          IconButton(
              icon:
              _isPasswordVisible ?
              Icon(Icons.visibility_off) :
              Icon(Icons.visibility) ,
            onPressed: () {
                _isPasswordVisible = !_isPasswordVisible ;
                setState(() {

                });
            },
          ),
          hintText: "eg. abc@123",
          filled: true,
          fillColor: Colors.deepPurple.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // conform password method



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text("User Details Form"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade100,
        toolbarHeight: 60,
        // shape: Border(bottom: BorderSide(width: 0.5)),
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, left: 12),
                    child: Text(
                      "Enter Your Name : ",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  _buildName(), // fro name
                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, left: 12),
                    child: Text(
                      "Enter Your Email : ",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  _buildEmail(), // for email
                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, left: 12),
                    child: Text(
                      "Password : ",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  _buildPassword(), // for Password


                  SizedBox(height: 20),
                  // Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {

                        _nameController.text = "Ratndeep" ;
                        _emailController.text = "ratndeep@gmail.com" ;
                        _passwordController.text = "Rajratna@121" ;

                        if (_formKey.currentState!.validate()) {
                          // to collect all form values at once after validation.
                          _formKey.currentState!.save(); // // This will trigger onSaved()
                          debugPrint("Processing Data........");
                          debugPrint("Password : $_password");

                          // debugPrint(_password);
                        } else {
                          debugPrint("Please Fill all Details Properly");
                        }

                      },
                      child: Text("Submit"),
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

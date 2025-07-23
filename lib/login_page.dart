import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Form key
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // methods of widgets
  // name method
  Widget _buildName() {
    return SizedBox(
      // it gives custom height and width
      height: MediaQuery.of(context).size.height * 0.08,
      child: TextFormField(
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
        controller: _nameController,
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
        controller: _emailController,
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
        scrollDirection: Axis.vertical,
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

                  SizedBox(height: 20),

                  SizedBox(height: 20),
                  // Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint("Processing Data........");
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

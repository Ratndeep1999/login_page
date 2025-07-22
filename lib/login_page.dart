import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Form key
  final _formKey = GlobalKey<FormState>();

  // Variables
  late String _name ;

  // Controllers
  final TextEditingController _nameController = TextEditingController();


  // methods of widgets
  // name method
  Widget _buildName() {
    return SizedBox(   // it gives custom height and width
      height: MediaQuery.of(context).size.height * 0.06,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your name" ;
          } else if ( value.length < 3 ) {
            return "Name is too short" ;
          }
        },
        controller: _nameController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
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
        toolbarHeight: 80,
        // shape: Border(bottom: BorderSide(width: 0.5)),
      ),
      body: SafeArea(
          child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 12),
                        child: Text( "Enter Your Name : ",
                          style: TextStyle(
                              fontSize: 15,
                          ),
                        ),
                      ),
                      _buildName(),
                    ],
                ),
              ),
          ),
      ),
    );
  }
}

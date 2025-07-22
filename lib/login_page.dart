import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>(); // variable for Form key
  final TextEditingController _firstName = TextEditingController(); // for First name
  final _surName = TextEditingController(); // for Surname
  final _phoneNumber = TextEditingController(); // for Phone number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar
      appBar: AppBar(
        toolbarHeight: 70.0,
        shape: Border(bottom: BorderSide(width: 1)),
        title: Text("Login Page"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
      ),

      // Body
      body: SafeArea(
        // Form
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 50),

                  // For _firstName
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // ! is null check operator
                        return "First name is required";
                      } else if (value.length < 3) {
                        return "Name is Too short";
                      }
                      return null;
                    },
                    // use to save value in a private variable and return it
                    // onSaved: (value) {},
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    maxLength: 20,
                    minLines: 1,
                    maxLines: 2,
                    autocorrect: true,
                    showCursor: true,
                    // it align text from left and right
                    textAlign: TextAlign.left,
                    controller: _firstName,
                    readOnly: false,
                    // it's enable or disable the input field
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.pink.shade50,
                      labelText: "First Name",
                      hintText: "Write Your First Name",
                      prefixIcon: Icon(Icons.first_page),
                      suffixIcon: Icon(Icons.visibility),
                      icon: Icon(Icons.library_books),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  SizedBox(height: 50),

                  // For _mobileNumber
                  TextFormField(
                    controller: _phoneNumber,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // ! means value is not null it is an null check operator
                        return "Please enter your Mobile number properly";
                      } else if (value.length != 10) {
                        return "Mobile Number should be 10 digit";
                      } else if (value.trim().isEmpty) {
                        // for spacing not allow
                        return "Space is not allow";
                      }
                      return null;
                    },
                    // it allow to except only number
                    keyboardType: TextInputType.phone,
                    // It allow to put only numbers, restrict special characters
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // bold font style for input text (hintText) with color light black
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      // font size never disturb the border
                      // fontSize: 40,
                      color: Colors.black,
                    ),
                    // we are putting Phone no that is always 10
                    maxLength: 10,
                    // It align text according value
                    textAlign: TextAlign.center,
                    // Ir makes data hide like password
                    obscureText: false,
                    // this allow when we change the state it automatically unlock field to input data
                    autofocus: false,
                    // It define cursor height
                    cursorHeight: 20,
                    selectionHeightStyle: BoxHeightStyle.tight,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.red.shade100,
                      // when user click to input box then this eg visible
                      hintText: "eg. 8551 830 830",
                      // this visible inside text field when we click to field then it swap on upper field border
                      labelText: "Enter Your Phone Number",
                      icon: Icon(Icons.phone, size: 30, color: Colors.grey),
                      border: OutlineInputBorder(
                        // it creates gap in_between border and labelText
                        // gapPadding: 150,
                        borderRadius: BorderRadius.circular(20),
                        // it disable the border
                        borderSide: BorderSide.none,
                        // it disable the border all sides
                        // borderSide: BorderSide.none
                      ),
                    ),
                  ),

                  SizedBox(height: 50),

                  // for _sueName
                  TextField(
                    controller: _surName,
                    maxLines: 3,
                    minLines: 2,
                    maxLength: 50,
                    // keyboardType: TextInputType.number,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintMaxLines: 5,
                      hintText: "Your Surname",
                      maintainHintHeight: true,
                    ),
                  ),

                  SizedBox(height: 50),

                  // submit button
                  ElevatedButton(
                    onPressed: () {
                      // if i want to pass default value, if user unable to input value
                      // _firstName.text = "Ratndeep";

                      // if (_firstName.text.length > 5) {
                      //   debugPrint("This is valid name");
                      //   // it check the text what is in textEditing Controller
                      //   debugPrint(_firstName.text);
                      // } else {
                      //   debugPrint("Invalid user name");
                      //   _firstName
                      //       .clear(); // we use it when we give wrong id and password or wrong captcha
                      // }

                      // Condition that check all conditions in Form input fields
                      if (_formKey.currentState!.validate()) {
                        debugPrint(
                          "This is valid form all user input is correct",
                        );
                      } else {
                        debugPrint(
                          "This is Invalid from all or some user input is  incorrect",
                        );
                      }
                    },
                    // label Text inside button
                    child: Text("Submit"),
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

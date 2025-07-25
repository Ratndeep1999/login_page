import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  bool _isConformPasswordVisible = true ;
  String _gender = 'Not selected';

  // to store input data
  String _password = "" ;

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

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
            //  checks if the value contains anything other than letters or spaces, and returns true if it does
          } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
            // this restrict to input only letters and spaces
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
        validator: (value) {  // !EmailValidator.validate(value)  i can use this also using EmailValidator package
          if (value == null || value.isEmpty) {
            return "Please enter your email";
          }
          if ( value.contains(' ') ) {  // if space trigger then true
            return "Space is not allow";
          }
          // Regular Expression for valid email pattern
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
          } else if ( value.contains(' ') ) {  // if space input then it return true
            return "Space is not allow" ;
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
        onChanged: (value) {  // Now _password always contains (Real time) latest input
          _password = value ;
          _formKey.currentState!.validate();
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
                setState(() {});
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
  Widget _buildConformPassword() {
    return SizedBox(
      // it gives custom height and width
      height: MediaQuery.of(context).size.height * 0.08,
      child: TextFormField(
        controller: _conformPasswordController,
        validator: (value) {
          if ( _password != value ) {
            return "Password and Conform Password are not same";
          }
          return null;
        },
        obscureText: _isConformPasswordVisible,
        obscuringCharacter: "*",
        // onChanged is triggered whenever the user types in the field.
        // parameter value holds what the user just typed.
        onChanged: (value) {
          // this is CallBack trigger re-validation of the form whenever user types.
          // Force re-validation of the form (especially this field)
          _formKey.currentState!.validate();
        },
        minLines: 1,
        //maxLines: 2,
        cursorHeight: 20,
        decoration: InputDecoration(
          suffixIcon:
          IconButton(
            icon:
            _isConformPasswordVisible ?
            Icon(Icons.visibility_off) :
            Icon(Icons.visibility) ,
            onPressed: () {
              _isConformPasswordVisible = !_isConformPasswordVisible ;
              setState(() {});
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

  // mobile number field
  Widget _buildMobileNumber() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: TextFormField(
        controller: _mobileNumberController,
        validator: ( value ) {
          if ( value == null || value.isEmpty) {
            return "Please enter your mobile number" ;
          }
          if ( value.contains(' ')) {
            return "Space is not allow";
          }
          if ( value.length != 10 ) {
            return "Mobile number must be 10 digits";
          }
          return null ;
        },
        maxLength: 10,
        keyboardType: TextInputType.number,
        // This restrict to input only digits not other char
        inputFormatters: [ FilteringTextInputFormatter.digitsOnly ],
        decoration: InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Icon(Icons.phone),
          ),
          hintText: "eg. 8551 830 830",
          filled: true,
          fillColor: Colors.deepPurple.shade50,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  // address field
  Widget _buildAddress() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4 ,
      height: MediaQuery.of(context).size.height * 0.23,
      child: TextFormField(
        controller: _addressController,
        validator: ( value ) {
          if ( value == null || value.isEmpty ) {
            return "Please enter your address" ;
          }
          if ( value.length < 10 ) {
            return "Address is too short" ;
          }
          return null ;
        },
        minLines: 7,
        maxLines:12,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.place),
          // suffixIcon: Icon(Icons.place),
          hintText: "eg. street name, city name, postal code, state",
          filled: true,
          fillColor: Colors.deepPurple.shade50,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
  
  // gender field
  Widget _buildGender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioMenuButton(
          style: ButtonStyle(elevation: WidgetStatePropertyAll(20)),
            value: "Male",
            groupValue: _gender,
            onChanged: (value) {
              setState(() {
                _gender = value ?? '' ;
              });
            },
            child: Icon(Icons.male),
        ),
        RadioMenuButton(
          value: "Female",
          groupValue: _gender,
          onChanged: (value) {
            setState(() {
              _gender = value ?? '' ;
            });
          },
          child: Text("Female"),
        ),
        RadioMenuButton(
          value: "Other",
          groupValue: _gender,
          onChanged: (value) {
            setState(() {
              _gender = value ?? '' ;
            });
          },
          child: Text("Other"),
        ),
      ],
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
      body: InkWell(
        onTap: () {
          // Close the keyboard when tapping outside
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox( height: MediaQuery.of(context).size.height * 0.02 ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 12),
                      child: Text(
                        "Enter Your Name : ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    _buildName(), // for name
                    SizedBox(height: MediaQuery.of(context).size.height * 0.0001 ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 12),
                      child: Text(
                        "Enter Your Email : ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    _buildEmail(), // for email
                    SizedBox(height: MediaQuery.of(context).size.height * 0.0001 ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 12),
                      child: Text(
                        "Password : ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    _buildPassword(), // for Password
                    SizedBox(height: MediaQuery.of(context).size.height * 0.0001 ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 12),
                      child: Text(
                        "Conform Password : ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    _buildConformPassword(), // for Conform Password
                    SizedBox(height: MediaQuery.of(context).size.height * 0.0001 ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 12),
                      child: Text(
                        "Mobile Number : ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    _buildMobileNumber(), // for Conform Password
                    // SizedBox(height: MediaQuery.of(context).size.height * 0.0001 ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Address column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5, left: 12),
                              child: Text(
                                "Address : ",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            // custom widget _buildAddress
                            _buildAddress(),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.001,),
                          ],
                        ),

                        SizedBox(width: MediaQuery.of(context).size.width * 0.1 ),

                        // gender and button column
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Text(
                                "Gender : ",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            // Custom widget _buildGender
                            _buildGender(),

                            // Button
                            ElevatedButton(
                              onPressed: () {
                                // _nameController.text = "Ratndeep" ;
                                // _emailController.text = "ratndeep@gmail.com" ;
                                // _passwordController.text = "Rajratna@121" ;
                                // _addressController.text = "Bhim wadi, thool layout, sindhi meghe, wardha, 442001" ;

                                // show snackBar if condition meet
                                if ( _gender.isEmpty || _gender == '' || _gender == 'Not selected' ) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Please select your gender...."),
                                      ),
                                  );
                                }

                                if (_formKey.currentState!.validate()) {
                                  // to collect all form values at once after validation.
                                  _formKey.currentState!.save(); // This will trigger onSaved()
                                  debugPrint("Processing Data........");
                                  debugPrint("Password : $_password");
                                  debugPrint("Gender : $_gender");
                                  // debugPrint(_password);
                                } else {
                                  debugPrint("Please Fill all Details Properly");
                                }
                              },
                              child: Text("Submit"),
                            ),
                          ],
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
  }
}

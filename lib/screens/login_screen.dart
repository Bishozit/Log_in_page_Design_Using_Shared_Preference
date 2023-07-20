import 'package:autologin/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  bool isObsecure = false;

  Map<String, String> _loginUserData = {};

  _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    print(_loginUserData);
    AuthController.login(_loginUserData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "User Login Interface",
        ),
        backgroundColor: Color.fromRGBO(63, 17, 1, 1),
      ),
      body: Form(
        key: _formKey,
        child: Card(
          color: Color.fromARGB(255, 6, 0, 15),
          elevation: 5,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    onSaved: (value) {
                      _loginUserData['email'] = value!;
                    },
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email can't be empty";
                      }
                      if (value.length < 3) {
                        return "Invalid Email";
                      }
                      if (!value.contains("@gmail.com")) {
                        return "Invalid User email";
                      }
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.9),
                      filled: true,
                      hintText: "Enter your Email",
                      //labelText: "Enter your Email",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.black54),
                      prefixIcon: Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.amber)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // TextFormField(
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     labelText: "Password",
                  //   ),
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Password required!';
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  //   onSaved: (value) {
                  //     _loginUserData['password'] = value!;
                  //   },
                  // ),
                  TextFormField(
                    onSaved: (value) {
                      _loginUserData['password'] = value!;
                    },
                    onEditingComplete: () {
                      if (_formKey.currentState!.validate()) {
                        print(" Successfull");
                      } else {}
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      }
                      if (value.length < 3) {
                        return "Invalid Password";
                      }
                      if (value.length > 10) {
                        return "Invalid Password";
                      }
                    },
                    controller: passwordController,
                    obscureText: isObsecure,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        icon: Icon(Icons.visibility),
                      ),
                      fillColor: Colors.white.withOpacity(0.9),
                      filled: true,
                      hintText: "Enter your Password",
                      //labelText: "Enter your Password",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.black54),
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.amber)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onEditingComplete: () {
                      if (_formKey.currentState!.validate()) {
                        print(" Successfull");
                      } else {}
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      }
                      if (value.length < 3) {
                        return "Invalid Password";
                      }
                      if (value.length > 10) {
                        return "Invalid Password";
                      }
                      if (value != passwordController.text.toString()) {
                        return "Password doesnt match";
                      }
                    },
                    controller: passwordController2,
                    obscureText: isObsecure,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        icon: Icon(Icons.visibility),
                      ),
                      fillColor: Colors.white.withOpacity(0.9),
                      filled: true,
                      hintText: "Enter your Re-password",
                      //labelText: "Enter your Password",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.black54),
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.amber)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget Password",
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w700),
                      )),
                  SizedBox(
                    height: 30,
                  ),

                  MaterialButton(
                    onPressed: _submit,
                    color: Color(0xff00665C),
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    height: 50,
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                          fontSize: 14, color: Colors.lightBlueAccent),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

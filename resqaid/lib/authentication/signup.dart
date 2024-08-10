import 'package:flutter/material.dart';
import 'package:resqaid/authentication/authentication.dart';
import 'package:resqaid/theme/theme_ext.dart';

class Signup extends StatefulWidget {
  static const String routeName = "/sign-up-screen";
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // AuthServices authServices = AuthServices();
  final _signUpKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
  }

  void onSubmit() {
    //set username in provider
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: appColors.white,
        ),
        backgroundColor: appColors.navyBlue, //previous color - 0xff0D1B2A
        title: const Text(
          "Create an Account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: appColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.85,
            child: Form(
              key: _signUpKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: appColors.accent,
                    radius: 92,
                    child: Image.asset("assets/images/signup.gif"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "\"Your First Step to Readiness\"",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: appColors.primary,
                          fontStyle: FontStyle.italic,
                        ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                    child: TextFormField(
                      controller: _username,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: Color(0xFF03071E),
                        hintText: "Username",
                        hintStyle: TextStyle(
                          color: Color(0xFF03071E),
                          fontSize: 14,
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFF03071E),
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Enter your username';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                    child: TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email_rounded),
                        prefixIconColor: Color(0xFF03071E),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Color(0xFF03071E),
                          fontSize: 14,
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFF03071E),
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: _password,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.password_outlined),
                        prefixIconColor: Color(0xFF03071E),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Color(0xFF03071E),
                          fontSize: 14,
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFF03071E),
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty || val.length < 6) {
                          return 'Minimum six character of password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: _confirmPassword,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.password_rounded),
                        prefixIconColor: Color(0xFF03071E),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                          color: Color(0xFF03071E),
                          fontSize: 14,
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFF03071E),
                        ),
                      ),
                      validator: (val) {
                        if (val.toString() != _password.text) {
                          return 'Password not matched';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 140,
                    height: 40,
                    child: ElevatedButton(
                      style: modernElevatedButtonStyle,
                      onPressed: () {
                        if (_signUpKey.currentState!.validate()) {
                          onSubmit();
                        }
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color: Color(0xFF03071E),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 108,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    Authentication.routeName, (route) => false);
                              },
                              child: const Text(
                                "Login ",
                                style: TextStyle(
                                  color: Color(0xFF03071E),
                                ),
                              ),
                            )
                          ],
                        )
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

  final ButtonStyle modernElevatedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xFF03071E),
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}

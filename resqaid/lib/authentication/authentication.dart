import 'package:flutter/material.dart';
import 'package:resqaid/navbar.dart';
import 'package:resqaid/theme/theme_ext.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final signInForm = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  void signIn() {
    if (_username.text == "vansh" && _username.text == "vansh") {
      Navigator.pushReplacementNamed(context, Navbar.routeName);
    } else {}
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.navyBlue, //previous color - 0xff0D1B2A
        title: const Text(
          "ResQAid",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: appColors.navyBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.white,
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.30,
                child: Image.asset('assets/images/login_image.png'),
              ),
              Container(
                // color: Colors.red,
                margin: const EdgeInsets.only(left: 24, top: 24),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome, ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        letterSpacing: 1,
                        color: appColors.white,
                      ), //previous color - 0xfff1faee
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Please sign in to continue.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 2,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: signInForm,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 24, right: 24),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appColors.accent
                            .withOpacity(0.9), //previous color - 0xffddd5d8
                      ),
                      child: TextFormField(
                        controller: _username,
                        autofocus: false,
                        style: const TextStyle(
                          color: Color(0xff03071e),
                          fontWeight: FontWeight.bold,
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please Enter Email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'username',
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 24, right: 24),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appColors.white.withOpacity(0.9),
                      ),
                      child: TextFormField(
                        controller: _password,
                        autofocus: false,
                        obscureText: true,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'password',
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.grey,
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (signInForm.currentState!.validate()) {
                          signIn();
                        }
                      },
                      child: Icon(
                        size: 48,
                        Icons.arrow_circle_right_rounded,
                        color: appColors.accent, //previous color - 0xffACC8E4
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        "New User? Register now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 2,
                            color: Color(0xffACC8E4)),
                      ),
                      onPressed: () {
                        // showSnackBar(context,
                        //     "Under maintainance, contact admin@christuniversity.edu.in for further procedure");
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 52,
              ),
              const SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "\" Every moment, a chance for greatness. \"",
                    style: TextStyle(color: Color(0xff8d99ae)),
                    softWrap: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

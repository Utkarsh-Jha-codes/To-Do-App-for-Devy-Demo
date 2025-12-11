import 'package:flutter/material.dart';
import 'package:to_do/Auth/Auth-login.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  final AuthSignIn _AuthSignin = AuthSignIn();
  final SignInEmailController = TextEditingController();
  final SignInPasswordController = TextEditingController();
  final SignInConfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              fontSize: 30,
              // color: Colors.tealAccent
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 50,
              bottom: 0,
            ),
            child: SingleChildScrollView(
              child: Container(
                height: 450,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 449,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextFormField(
                                controller: SignInEmailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              TextFormField(
                                controller: SignInPasswordController,
                                obscureText: hidePassword,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      hidePassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return "Enter Password";
                                },
                              ),

                              TextFormField(
                                controller: SignInConfirmPasswordController,
                                obscureText: hideConfirmPassword,
                                decoration: InputDecoration(
                                  labelText: "Confirm Password",
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      hideConfirmPassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        hideConfirmPassword = !hideConfirmPassword;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return "Enter Password";
                                },
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(context, "/login");
                                  },
                                  child: Text("Login",
                                  style: TextStyle(
                                    fontSize: 18
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        //   ],
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              bottom: 70,
              left: 20,
              right: 20,
              top: 677,
            ),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  bool success = await _AuthSignin.SignInUser(
                    SignInEmailController.text,
                    SignInPasswordController.text,
                    SignInConfirmPasswordController.text,
                  );
                  if (success) {
                    Navigator.pushReplacementNamed(context, "/home");
                  } else {
                    if (SignInPasswordController.text != SignInConfirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(
                            "Password and Confirm Password do not match")),
                      );
                    }
                    if (!SignInEmailController.text.contains("@")) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Invalid Email, does not contain @")),
                      );
                    }
                  }
                },
                child: Text("SignIn", style: TextStyle(fontSize: 30)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

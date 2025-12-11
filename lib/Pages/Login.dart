import 'package:flutter/material.dart';
import 'package:to_do/Auth/Auth-login.dart';
import 'package:to_do/Pages/MainList.dart';
import 'package:to_do/Pages/SignIn.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  final AuthService _Auth = AuthService();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Center(child: Text("Login", style: TextStyle(fontSize: 40))),
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
                height: 530,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 480,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextFormField(
                                controller: loginEmailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              TextFormField(
                                controller: loginPasswordController,
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

                              Text(
                                "-------------- OR --------------",
                                style: TextStyle(fontSize: 30),
                              ),

                              SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/Google-image.png',
                                      height: 60,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //   ],
                        // ),
                      ),
                    ),

                    Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            "/SignIn"
                          );
                        },
                        child: Text(
                          "Click here to Sign In",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),

                    // TextButton(
                    //     onPressed: () {},
                    //     child: Text("Click here to Sign In"))
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
                  bool success = await _Auth.authenticateUser(
                    loginEmailController.text,
                    loginPasswordController.text,
                  );
                  if (success) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => listPage()),
                    // );
                    Navigator.pushReplacementNamed(context, "/home");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid Email or Password")),
                    );
                  }
                },
                child: Text("Login", style: TextStyle(fontSize: 30)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

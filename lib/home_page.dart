import 'package:eighteen/custom_textfield.dart';
import 'package:eighteen/routed_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey,
        child: Stack(children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.32,
            left: MediaQuery.of(context).size.width * 0.13,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * .42,
                width: MediaQuery.of(context).size.width * .70,
                decoration: BoxDecoration(
                    boxShadow: const [BoxShadow(blurRadius: 8)],
                    color: Colors.blueGrey.shade300,
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Spacer(),
                        CustomTextField(
                          hintText: " Email",
                          pIcon1: Icons.person,
                          pIcon2: Icons.person,
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please Enter your Email";
                            }
                            if (!value.contains("@")) {
                              return "Invalid Email";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: " Password",
                          pIcon1: Icons.visibility,
                          pIcon2: Icons.visibility_off,
                          obscureText: true,
                          controller: passwordController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please Enter your Password";
                            }
                            if (value.length < 3) {
                              return "Password is too short";
                            }
                            if (value.length > 6) {
                              return "Password is too long";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.check_box,
                                  color: Colors.black,
                                  size: 12,
                                ),
                                Text(
                                  "Remember me",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              "Forget Password",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.24,
              left: MediaQuery.of(context).size.width * 0.36,
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromARGB(255, 6, 77, 158),
                child: Icon(
                  Icons.person_outline,
                  size: 70,
                  color: Colors.white,
                ),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.745,
            left: MediaQuery.of(context).size.width * 0.24,
            child: InkWell(
              onTap: () {
                if (_formKey!.currentState!.validate()) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RoutedPage(),
                  ));
                } else {
                  // ignore: avoid_print
                  print("Something Wrong");
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  boxShadow: const [BoxShadow(blurRadius: 4)],
                ),
                child: const Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

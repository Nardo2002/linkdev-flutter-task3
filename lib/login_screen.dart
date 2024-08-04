import 'package:flutter/material.dart';
import 'widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool isPassObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03) +
                            EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.width * 0.01),
                        child: CustomTextField(
                          isObscure: false,
                          text: 'Email Address',
                          prefixIcon:
                              Icon(Icons.person_outline, color: Colors.pink[700]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal: MediaQuery.of(context).size.width * 0.03),
                        child: CustomTextField(
                            isObscure: isPassObscure,
                            text: 'Password',
                            prefixIcon:
                                Icon(Icons.key_outlined, color: Colors.pink[700]),
                            suffixIcon: IconButton(
                                icon: isPassObscure
                                    ? const Icon(Icons.visibility_rounded)
                                    : const Icon(Icons.visibility_off_rounded),
                                onPressed: () {
                                  setState(() {
                                    isPassObscure = !isPassObscure;
                                  });
                                })),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal: MediaQuery.of(context).size.width * 0.03),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue[900]!),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                            ),
                            child: const Text('Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.015,
                            horizontal: MediaQuery.of(context).size.width * 0.03),
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Forgot Password',
                              style: TextStyle(
                                  color: Colors.pink[700],
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  decoration: TextDecoration.underline)),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.01,
                      horizontal: MediaQuery.of(context).size.width * 0.03),
                  child: Text(
                    "You don't have an account?",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.01,
                      horizontal: MediaQuery.of(context).size.width * 0.03),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(color: Colors.pink[700]!)),
                        ),
                      ),
                      child: Text('Create New Account',
                          style: TextStyle(
                              color: Colors.pink[700],
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

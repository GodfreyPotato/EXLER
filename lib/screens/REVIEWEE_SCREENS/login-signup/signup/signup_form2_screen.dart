import 'package:exler/data/OPTIONS.dart';
import 'package:exler/screens/REVIEWEE_SCREENS/home/home_screen.dart';
import 'package:exler/screens/REVIEWEE_SCREENS/login-signup/signup/signup_loading_screen.dart';
import 'package:flutter/material.dart';

class LoginNextScreen extends StatefulWidget {
  LoginNextScreen(
      {super.key,
      required this.inputDecoration,
      required this.textStyle,
      required this.firstForm});
  final TextStyle textStyle;
  final InputDecoration inputDecoration;
  final Map<String, dynamic> firstForm;
  @override
  State<LoginNextScreen> createState() => _LoginNextScreenState();
}

class _LoginNextScreenState extends State<LoginNextScreen> {
  var usernameCtrl = TextEditingController();
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  var cpasswordCtrl = TextEditingController();
  var phoneCtrl = TextEditingController();
  var educationCtrl;
  var programCtrl = TextEditingController();
  var schoolNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left,
              size: 35,
            )),
        title: Text(
          "Account Details",
          style:
              TextStyle(color: Color(0xFF2D3748), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Username",
              style: widget.textStyle,
            ),
            TextFormField(
              controller: usernameCtrl,
              decoration: widget.inputDecoration,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Email Address",
              style: widget.textStyle,
            ),
            TextFormField(
              controller: emailCtrl,
              decoration: widget.inputDecoration,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Password",
              style: widget.textStyle,
            ),
            TextFormField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.visibility))),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Confirm Password",
              style: widget.textStyle,
            ),
            TextFormField(
              controller: cpasswordCtrl,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.visibility))),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Phone Number",
              style: widget.textStyle,
            ),
            TextFormField(
              controller: phoneCtrl,
              decoration: widget.inputDecoration,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Educational Background',
              style: TextStyle(
                  color: Color(0xFF6C7278),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  // flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Education Attainment"),
                      Container(
                        width: double.infinity,
                        child: DropdownMenu(
                            onSelected: (value) {
                              educationCtrl = value;
                            },
                            menuHeight: 200,
                            dropdownMenuEntries: EDUCATION),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  // flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Degree/Program"),
                      TextFormField(
                        controller: programCtrl,
                        decoration: widget.inputDecoration,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "University/School Name",
              style: widget.textStyle,
            ),
            TextFormField(
              controller: schoolNameCtrl,
              decoration: widget.inputDecoration,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C6ABD),
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  var pass;
                  if (passwordCtrl.text == cpasswordCtrl.text) {
                    pass = passwordCtrl.text;
                  } else {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password is not match.")));
                    pass = null;
                    return;
                  }

                  print(pass);
                  Map<String, dynamic> signupform2 = {
                    'username': usernameCtrl.text,
                    'email': emailCtrl.text,
                    'password': pass,
                    'phone': phoneCtrl.text,
                    'education': educationCtrl,
                    'program': programCtrl.text,
                    'university': schoolNameCtrl.text
                  };
                  signupform2.addAll(widget.firstForm);

                  signupform2.forEach((k, v) {
                    if (v == null) {
                      print("this is null $k");
                    }
                  });

                  if (signupform2.containsValue(null)) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Some fields are missing.")));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => SignupLoadingScreen(
                              form: signupform2,
                            )));
                  }
                },
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:exler/data/OPTIONS.dart';
import 'package:exler/screens/REVIEWEE_SCREENS/login-signup/login_next_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class signup_component extends StatefulWidget {
  signup_component({
    super.key,
    required this.textStyle,
    required this.inputDecoration,
  });

  final TextStyle textStyle;
  final InputDecoration inputDecoration;

  @override
  State<signup_component> createState() => _signup_componentState();
}

class _signup_componentState extends State<signup_component> {
  var firstNameCtrl = TextEditingController();
  var middleNameCtrl = TextEditingController();
  var lastNameCtrl = TextEditingController();
  var bdateCtrl = TextEditingController();
  var nationalityCtrl;
  var genderCtrl;
  var addressCtrl = TextEditingController();
  var zipcodeCtrl = TextEditingController();
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TabBarView(children: [
        ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "First Name",
              style: widget.textStyle,
            ),
            TextFormField(
              controller: firstNameCtrl,
              decoration: widget.inputDecoration,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Middle Name",
              style: widget.textStyle,
            ),
            TextFormField(
              controller: middleNameCtrl,
              decoration: widget.inputDecoration,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Last Name",
              style: widget.textStyle,
            ),
            TextFormField(
              controller: lastNameCtrl,
              decoration: widget.inputDecoration,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Date of birth",
              style: widget.textStyle,
            ),
            TextFormField(
              controller: bdateCtrl,
              readOnly: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? selectedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1915),
                            lastDate: DateTime.now());

                        if (selectedDate != null) {
                          String dateformatted =
                              DateFormat.yMMMd().format(selectedDate);
                          bdateCtrl =
                              TextEditingController(text: dateformatted);
                        }
                        setState(() {});
                      },
                      icon: const Icon(Icons.calendar_month))),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Nationality"),
                      DropdownMenu(
                          onSelected: (value) {
                            nationalityCtrl = value;
                          },
                          menuHeight: 200,
                          dropdownMenuEntries: NATIONALITIESENTRIES)
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Gender"),
                      DropdownMenu(
                          onSelected: (value) {
                            genderCtrl = value;
                          },
                          menuHeight: 200,
                          dropdownMenuEntries: GENDERENTRIES)
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address",
                        style: widget.textStyle,
                      ),
                      TextFormField(
                        controller: addressCtrl,
                        decoration: widget.inputDecoration,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ZIP Code",
                        style: widget.textStyle,
                      ),
                      TextFormField(
                        controller: zipcodeCtrl,
                        decoration: widget.inputDecoration,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C6ABD),
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  Map signup = {
                    'firstName': firstNameCtrl.text,
                    'middleName': middleNameCtrl.text,
                    'lastName': lastNameCtrl.text,
                    'bdate': bdateCtrl.text,
                    'nationality': nationalityCtrl,
                    'gender': genderCtrl,
                    'address': addressCtrl.text,
                    'zipcode': zipcodeCtrl.text,
                  };

                  signup.forEach((k, v) {
                    if (v == null) {
                      print("this is null $k");
                    }
                  });

                  if (signup.containsValue(null)) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Some fields are missing.")));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => LoginNextScreen(
                              inputDecoration: widget.inputDecoration,
                              textStyle: widget.textStyle,
                              firstForm: signup,
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
        ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              style: widget.textStyle,
            ),
            TextFormField(
              controller: emailCtrl,
              decoration: widget.inputDecoration,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Password",
              style: widget.textStyle,
            ),
            TextFormField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.visibility))),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text("Remember Me")
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Passowrd?",
                      style: TextStyle(color: Color(0xFF2C6ABD)),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C6ABD),
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {},
                child: const Text(
                  "Log In",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "Or Log In With",
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/google.png',
                      width: 40,
                    )),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/facebook.png',
                    width: 40,
                  ),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}

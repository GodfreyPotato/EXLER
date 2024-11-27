import 'package:exler/data/OPTIONS.dart';
import 'package:flutter/material.dart';

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
            TextField(
              decoration: widget.inputDecoration,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Middle Name",
              style: widget.textStyle,
            ),
            TextField(
              decoration: widget.inputDecoration,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Last Name",
              style: widget.textStyle,
            ),
            TextField(
              decoration: widget.inputDecoration,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Date of birth",
              style: widget.textStyle,
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  suffixIcon: IconButton(
                      onPressed: () async {
                        await showDatePicker(
                            context: context,
                            firstDate: DateTime(1920),
                            lastDate: DateTime.now());
                        setState(() {});
                      },
                      icon: const Icon(Icons.calendar_month))),
            ),
            const SizedBox(
              height: 20,
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
                          menuHeight: 200, dropdownMenuEntries: GENDERENTRIES)
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
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
                      TextField(
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
                      TextField(
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
                onPressed: () {},
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
            SizedBox(
              height: 20,
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
            TextField(
              decoration: widget.inputDecoration,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Password",
              style: widget.textStyle,
            ),
            TextField(
              decoration: widget.inputDecoration,
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

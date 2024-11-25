import 'package:exler/screens/onboarding/onb.dart';
import 'package:exler/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExlerApp());
}

class ExlerApp extends StatelessWidget {
  const ExlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: TasksListApp()));
// }

// class TasksListApp extends StatefulWidget {
//   TasksListApp({super.key});

//   @override
//   State<TasksListApp> createState() => _TasksListAppState();
// }

// class _TasksListAppState extends State<TasksListApp> {
//   var inputCtrl = TextEditingController();

//   List<String> tasks = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemBuilder: (_, index) {
//                 final task = tasks[index];

//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Dismissible(
//                     direction: DismissDirection.startToEnd,
//                     key: UniqueKey(),
//                     onDismissed: (direction) {
//                       setState(() {
//                         tasks.remove(task);
//                       });
//                     },
//                     background: Container(
//                       color: Colors.red,
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Icon(
//                           Icons.delete,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     child: Card(
//                       child: ListTile(
//                         title: Text(task),
//                         trailing: IconButton(
//                           onPressed: () {
//                             var inputCtrl2 = TextEditingController(text: task);
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return AlertDialog(
//                                   content: TextField(
//                                     controller: inputCtrl2,
//                                     decoration: InputDecoration(
//                                       hintText: "Edit Task",
//                                     ),
//                                   ),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () {
//                                         setState(() {});
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Text("Cancel"),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           tasks[index] = inputCtrl2.text;
//                                           inputCtrl2.clear();
//                                           Navigator.of(context).pop();
//                                         });
//                                       },
//                                       child: Text("Update"),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                           icon: Icon(Icons.edit),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               itemCount: tasks.length,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: inputCtrl,
//                     decoration: InputDecoration(
//                       hintText: "Add Task",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     setState(() {
//                       if (inputCtrl.text.isNotEmpty) {
//                         tasks.add(inputCtrl.text);
//                         inputCtrl.clear();
//                       }
//                     });
//                   },
//                   child: Text("Add"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

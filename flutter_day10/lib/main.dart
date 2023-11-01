import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_day10/models/user_model.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Regsiter New User"),
        centerTitle: true,
      ),
      body: MyApp(GlobalKey()),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp(Key k) : super(key: k);

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final GlobalKey<FormState> _myFormKey = GlobalKey();
  bool keepLoginState = false;
  bool above21 = false;
  final User _u = User();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _myFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter First Name",
              label: Text("First name"),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r"[a-zA-Z]"),
              ),
            ],
            validator: (value) {
              value as String;
              if (value.length < 3 || value.length > 20) {
                return "First name must be between 3 and 20 characters";
              }
              return null;
            },
            onSaved: (newValue) => _u.firstName = newValue as String,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter Last Name",
              label: Text("Last name"),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r"[a-zA-Z]"),
              ),
            ],
            validator: (value) {
              value as String;
              if (value.length < 3 || value.length > 20) {
                return "Last name must be between 3 and 20 characters";
              }
              return null;
            },
            onSaved: (newValue) => _u.lastName = newValue as String,
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text("E-mail"),
              hintText: "Enter your email",
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r"[a-zA-Z0-9@.-_]"),
              ),
            ],
            validator: (value) {
              value as String;
              if (value.length < 3 || value.length > 60) {
                return "Email must be between 3 and 60 characters";
              }
              return null;
            },
            onSaved: (newValue) => _u.email = newValue as String,
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text("Password"),
              hintText: "Enter your password",
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r"[a-zA-Z0-9]"),
              ),
            ],
            obscureText: true,
            validator: (value) {
              value as String;
              if (value.length < 3 || value.length > 60) {
                return "Email must be between 3 and 60 characters";
              }
              return null;
            },
            onSaved: (newValue) {
              _u.password = newValue as String;
            },
          ),
          CheckboxListTile(
            title: Text("Keep me logged in"),
            value: keepLoginState,
            onChanged: (value) {
              setState(() {
                keepLoginState = value as bool;
              });
            },
          ),
          SwitchListTile(
            title: Text("Above 21 years or not"),
            value: above21,
            onChanged: (value) {
              setState(() {
                above21 = value as bool;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              final _form = _myFormKey.currentState as FormState;
              if (above21) {
                if (_form.validate()) {
                  _form.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UserHomePage(u: _u);
                      },
                    ),
                  );
                } else {
                  throw AssertionError("Data is wrong");
                }
              } else {
                throw AssertionError(
                  "you must be 21 years old to create bank account",
                );
              }
            },
            child: Text(
              "Sumbit",
            ),
          ),
        ],
      ),
    );
  }
}

class UserHomePage extends StatelessWidget {
  User u;

  UserHomePage({super.key, required this.u});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("${u.firstName} ${u.lastName} Home"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(u.email),
              Text(u.password),
            ],
          ),
        ),
      ),
    );
  }
}

// 54155457

// [a-z]+ = amammas
// [A-Z]+ = "asmad"
// [0-9]

// .

// 0 1
// A -> 65 -> 1000001

// class MyApp extends StatefulWidget {
//   const MyApp(Key? k) : super(key: k);

//   @override
//   State<MyApp> createState() => _MyApp();
// }

// class _MyApp extends State<MyApp> {
//   final GlobalKey _globalKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _globalKey,
//       child: const Column(
//         children: [],
//       ),
//     );
//   }
// }

// 514145

// [0-9]{6} ----> New Computer
// [[:digit:]] ---> Old Computer


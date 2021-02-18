import 'package:flutter/material.dart';
import './views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in Form'),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Your email address',
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Your email password',
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                TextButton(
                  child: Text('Sign in'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _showDialog('Succesfully signed in.');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHome()),
                      );
                    } else {
                      _showDialog('Failed signed in.');
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('Need an account? Register')),
                ),
                Center(child: Text('Forget password?')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
/*     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             decoration: const InputDecoration(
//               hintText: 'Enter your email',
//             ),
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter your email';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             decoration: const InputDecoration(
//               hintText: 'Enter your password',
//             ),
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter your password';
//               }
//               return null;
//             },
//           ),
//           Center(
//             child: RaisedButton(
//               onPressed: () {
//                 if (_formKey.currentState.validate()) {
//                   // Process data.
//                 }
//               },
//               textColor: Colors.white,
//               padding: const EdgeInsets.all(0.0),
//               child: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: <Color>[
//                       Color(0xFF0D47A1),
//                       Color(0xFF1976D2),
//                       Color(0xFF42A5F5),
//                     ],
//                   ),
//                 ),
//                 padding: const EdgeInsets.only(left: 50, right: 50),
//                 child: const Text('Sign In', style: TextStyle(fontSize: 24)),
//               ),
//             ),
//           ),
//           Center(child: Text('Need an account? Register')),
//           Center(child: Text('Forget password?')),
//         ],
//       ),
//     );*/
}

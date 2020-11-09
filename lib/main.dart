import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconanimationController;
  Animation<double> _iconanimation;

  @override
  void initState() {
    super.initState();
    _iconanimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));

    _iconanimation = new CurvedAnimation(
      parent: _iconanimationController,
      curve: Curves.easeInOut,
    );

    _iconanimation.addListener(() {});
    _iconanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: AssetImage("assets/image1.jpg"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconanimation.value * 100,
              ),
              new Form(
                  child: Theme(
                data: ThemeData(
                    brightness: Brightness.dark,
                    primaryColor: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                        labelStyle:
                            TextStyle(color: Colors.teal, fontSize: 20.0))),
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new TextFormField(
                        decoration: InputDecoration(labelText: "Email ID"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(
                        decoration:
                            InputDecoration(labelText: "Enter a Password"),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      Padding(padding: const EdgeInsets.only(top: 70.0)),
                      new MaterialButton(
                        height: 40.0,
                        minWidth: 60.0,
                        child: Text("Login"),
                        onPressed: () => {},
                        color: Colors.teal,
                      )
                    ],
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}

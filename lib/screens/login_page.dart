import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            SizedBox(height: 70),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                'images/ignite.png',
                width: 110.0,
                height: 110.0,
                fit: BoxFit.fill,
              ),
            ),
            // Image(
            //   alignment: Alignment.center,
            //   height: 100,
            //   width: 100,
            //   image: AssetImage('images/ignite.png'),
            // ),
            SizedBox(height: 40),
            Text(
              'Sign into Ignite',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                        fontSize: 14,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontSize: 14,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25),
                    ),
                    color: Colors.green[700],
                    textColor: Colors.white,
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style:
                              TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Register Here'),
            ),
          ]),
        ))));
  }
}

import 'package:flutter/material.dart';
import 'reqs.dart';
import 'dashboard.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'InDaBin',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<HomePage> createState() => _HomePageState();
}

//TODO paper ball toss background
class _HomePageState extends State<HomePage> {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10,10,10,10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0,120,0,30),
                child: const Text(
                  'InDaBin',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 48),
                )),
            SizedBox(
                height:250,
                width:250,
                child:
            CircleAvatar(backgroundImage:AssetImage('assets/IDB-logos.jpeg')),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10,30,10,10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                      login(emailController.text, passwordController.text).then((session){
                          if(session.token!=""){

                          Navigator.push(context, MaterialPageRoute(builder: 
                                  (context) => Dashboard(session: session)));
                          }
                      }
                      );
                    print(emailController.text);
                    print(passwordController.text);
                  },
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20,0,30,0),
                child:
                Row(

                  children: <Widget>[
                      TextButton(
                          child: 
                          Text('Don\'t have an account?',
                              style: TextStyle(color:Colors.green)),
                          onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterPage()),
                              );

                          }
                          
                    
                      ),
                      TextButton(child: 
                          Text('Forgot Password',
                              style: TextStyle(color:Colors.green)),
                          onPressed: (){
                          }
                      )

                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
            )
          ],
          ))
      ),
    );
  }
}
class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController blueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10,10,10,10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0,150,0,120),
                child: const Text(
                  'InDaBin',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 48),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: blueController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bluetooth Name',
                ),
              ),
            ),

            SizedBox(height: 40),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: ElevatedButton(
                  child: const Text('Register'),
                  onPressed: () {
                      register(emailController.text, passwordController.text, nameController.text, blueController.text).then(
                          (session){
                              Navigator.push(context, MaterialPageRoute(builder: 
                                  (context) => Dashboard(session: session)));
                          });


                    print(nameController.text);
                    print(passwordController.text);
                  },
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20,0,30,0),
                child:
                Row(

                  children: <Widget>[
                      TextButton(
                          child: 
                          Text('Already have an account?',
                              style: TextStyle(color:Colors.green)),
                          onPressed: (){
                              Navigator.pop(context);

                          }
                          
                    
                      ),
                      TextButton(child: 
                          Text('Forgot Password',
                              style: TextStyle(color:Colors.green)),
                          onPressed: (){
                          }
                      )

                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
            )
          ],
          ))
      ),
    );
  }
}

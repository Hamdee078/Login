import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zz/widgets/button_widget.dart';
import 'package:zz/widgets/textform_widget.dart';
import 'package:zz/widgets/textfrompassword_widget.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));

    emailController.text = "";
    passwordController.text = "";
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildHeader(),
                  TextFormWidget(
                    text: 'Username',
                    readOnly: false,
                    controller: emailController,
                    type: TextInputType.text,
                    inputFormat: [],
                  ),
                  const SizedBox(height: 12),
                  TextFormPasswordWidget(
                    text: 'Password',
                    controller: passwordController,
                    hidePassword: hidePassword,
                    icon: IconButton(
                      icon: hidePassword
                          ? const Icon(
                              Icons.visibility_outlined,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                            ),
                      onPressed: () => setState(() {
                        hidePassword = !hidePassword;
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                    label: 'Login',
                    color: Colors.blue,
                    onPressed: () => navigateToSecondPage(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() => Column(
        children: [
          Image.asset(
            'assets/login.png',
            height: 130,
          ),
          const Text(
            'ยินดีตอนรับ',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 8, 10, 9)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '652021078 นาย ฮัมดี ดอเลาะ',
            style: TextStyle(fontSize: 18, color: Color(0xff006d38)),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );

  void navigateToSecondPage() {
    final email = emailController.text.toString().trim();
    final password = passwordController.text.toString().trim();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(email: email, password: password),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String email;
  final String password;

  const SecondPage({required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email: $email'),
            Text('Password: $password'),
          ],
        ),
      ),
    );
  }
}

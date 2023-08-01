import 'package:flutter/material.dart';
import 'package:modern_school/components/my_button.dart';
import 'package:modern_school/components/my_textfield.dart';

Widget? widgyto;

class ActivateAccountScreen extends StatefulWidget {
  ActivateAccountScreen({super.key});

  final nameController = TextEditingController();
  @override
  State<ActivateAccountScreen> createState() => _ActivateAccountScreenState();
}

class _ActivateAccountScreenState extends State<ActivateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background_splash.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: widgyto = InformationEditing(),
          ),
        ),
      ),
    );
  }
}

class InformationEditing extends StatelessWidget {
  InformationEditing({super.key});

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Edit your personal informations',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
          ),
        ),
        Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: MyTextField(
                    controller: nameController,
                    hintText: 'Last name',
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: MyTextField(
                    controller: nameController,
                    hintText: 'First name',
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: MyTextField(
                    controller: nameController,
                    hintText: 'Phone',
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: MyTextField(
                    controller: nameController,
                    hintText: 'Email',
                    obscureText: true,
                  ),
                ),
              ],
            ),
            const Divider(height: 40),
            MyButton(
              onTap: () {
                widgyto = PasswdEditing();
              },
              textWidget: const Text('Ok'),
            )
          ],
        ),
      ],
    );
  }
}

class PasswdEditing extends StatelessWidget {
  PasswdEditing({super.key});

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Edit your password',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
          ),
        ),
        Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: MyTextField(
                    controller: nameController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: MyTextField(
                    controller: nameController,
                    hintText: 'Verify password',
                    obscureText: true,
                  ),
                ),
              ],
            ),
            const Divider(height: 40),
            MyButton(
              onTap: () {},
              textWidget: const Text('Ok'),
            )
          ],
        ),
      ],
    );
  }
}

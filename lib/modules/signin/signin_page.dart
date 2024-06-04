import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../signin/signin_controller.dart';
import '../user/user_data.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final controller = LoginController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool isButtonEnabled = false;
  bool passwordsMatch = true;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateInputs);
    _emailController.addListener(_validateInputs);
    _passwordController.addListener(_validateInputs);
    _confirmPasswordController.addListener(_validateInputs);
  }

  void _validateInputs() {
    setState(() {
      passwordsMatch = _passwordController.text == _confirmPasswordController.text;

      isButtonEnabled = _nameController.text.isNotEmpty &&
                        _emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty &&
                        _confirmPasswordController.text.isNotEmpty &&
                        passwordsMatch;
    });
  }

  void _registerUser() {
  if (isButtonEnabled) {
    final newUser = User(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      photos: [],
      index: userData.users.length,
    );
    userData.users.add(newUser);
    controller.login(context);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: body(context),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Center(
        child: DropdownButton<String>(
          value: "Português",
          style: const TextStyle(color: Colors.grey),
          underline: Container(height: 0),
          onChanged: (String? newValue) {},
          items: <String>['Português', '...']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Preencha os campos abaixo para criar sua conta.",
            style: const TextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Nome",
                      hintText: "Digite seu nome",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "E-mail",
                      hintText: "Digite seu e-mail",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Senha",
                      hintText: "Digite sua senha",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirmar Senha",
                      hintText: "Confirme sua senha",
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.all(8),
                      errorText: passwordsMatch ? null : "As senhas não são iguais",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: isButtonEnabled ? _registerUser : null,
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.grey;
                            }
                            return Color(0xFF5C0FFF);
                          },
                        ),
                        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/shared/themes/app_images.dart';

import 'login_controller.dart';
import '../user/user_data.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isButtonEnabled = false;
  bool loginFailed = false;
  bool obscurePassword = true; // Para controlar a visibilidade da senha

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateInputs);
    _passwordController.addListener(_validateInputs);
  }

  void _validateInputs() {
    setState(() {
      isButtonEnabled = _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    });
  }

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha todos os campos para entrar'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final userIndex = userData.users.indexWhere((user) => user.email == email && user.password == password);

    if (userIndex != -1) {
      userData.currentUserIndex = userIndex;
      controller.login(context);
    } else {
      setState(() {
        loginFailed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: body(context),
      bottomNavigationBar: buttonNav(context),
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
          Image.asset(AppImages.textLogo),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
            child: Column(
              children: [
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
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      hintText: "Digite sua senha",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(8),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            // Alternar a visibilidade da senha
                            obscurePassword = !obscurePassword;
                          });
                        },
                        icon: Icon(
                          // Ícone para exibir ou ocultar a senha
                          obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                if (loginFailed)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Email ou senha incorreto(s)",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: _login, // Removendo a verificação isButtonEnabled
                      child: const Text(
                        "Entrar",
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

  Widget buttonNav(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        child: Container(
          height: 24,
          child: Center(
            child: Text.rich(
              TextSpan(
                text: "Não tem uma conta?",
                style: TextStyle(fontSize: 12),
                children: [
                  TextSpan(
                    text: " cadastre-se aqui",
                    style: TextStyle(color: Color(0xFF5C0FFF)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => controller.signIn(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

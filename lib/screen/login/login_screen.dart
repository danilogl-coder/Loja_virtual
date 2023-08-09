import 'package:flutter/material.dart';

import '../../helpers/validators.dart';
import '../../models/user_manager.dart';
import '../../models/user_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
          child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formkey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "E-mail",
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (email) {
                  if (!emailValid(email.toString())) return 'E-mail invalido';
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: passController,
                decoration: const InputDecoration(
                  hintText: "Senha",
                ),
                autocorrect: false,
                obscureText: true,
                validator: (pass) {
                  if (pass!.isEmpty || pass.length < 6) return 'Senha invalida';
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {},
                    child: const Text('Esqueci minha senha')),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 44,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        textStyle: const TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        context.read<UserManager>().signIn(UserModel(
                            email: emailController.text,
                            password: passController.text));
                      }
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(fontSize: 18.0),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}

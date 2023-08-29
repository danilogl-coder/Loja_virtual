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
        automaticallyImplyLeading: false,
        title: const Text('Entrar'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/signup');
              },
              child: const Text(
                'Criar Conta',
                style: TextStyle(fontSize: 14.0, color: Colors.white),
              ))
        ],
      ),
      body: Center(
          child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formkey,
          child: Consumer<UserManager>(
            builder: (context, userManager, child) {
              return ListView(
                padding: const EdgeInsets.all(16.0),
                shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: emailController,
                    enabled: !userManager.loading,
                    decoration: const InputDecoration(
                      hintText: "E-mail",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      if (!emailValid(email.toString())) {
                        return 'E-mail invalido';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: passController,
                    enabled: !userManager.loading,
                    decoration: const InputDecoration(
                      hintText: "Senha",
                    ),
                    autocorrect: false,
                    obscureText: true,
                    validator: (pass) {
                      if (pass!.isEmpty || pass.length < 6) {
                        return 'Senha invalida';
                      } else {
                        return null;
                      }
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
                            disabledBackgroundColor:
                                Theme.of(context).primaryColor.withAlpha(100),
                            textStyle: const TextStyle(color: Colors.white)),
                        onPressed: userManager.loading
                            ? null
                            : () {
                                if (formkey.currentState!.validate()) {
                                  context.read<UserManager>().signIn(
                                      user: UserModel(
                                          email: emailController.text,
                                          password: passController.text),
                                      onFail: (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('Falha ao Entrar $e'),
                                          backgroundColor: Colors.red,
                                        ));
                                      },
                                      onSuccess: () {
                                        debugPrint('sucessos');
                                        Navigator.of(context).pop();
                                      });
                                }
                              },
                        child: userManager.loading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : const Text(
                                "Entrar",
                                style: TextStyle(fontSize: 18.0),
                              )),
                  )
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}

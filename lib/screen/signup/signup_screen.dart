import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../helpers/validators.dart";
import "../../models/user_manager.dart";
import "../../models/user_model.dart";

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final UserModel userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true,
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Nome Completo'),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (name.trim().split(' ').length <= 1) {
                      return 'Preencha seu Nome Completo';
                    }
                    return null;
                  },
                  onSaved: (name) => userModel.name = name,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (!emailValid(email)) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                  onSaved: (email) => userModel.email = email,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Senha'),
                  validator: (pass) {
                    if (pass!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (pass.length < 6) {
                      return 'Senha muito curta';
                    }
                    return null;
                  },
                  onSaved: (pass) => userModel.password = pass,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Repita a Senha'),
                  validator: (pass) {
                    if (pass!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (pass.length < 6) {
                      return 'Senha muito curta';
                    }
                    return null;
                  },
                  onSaved: (pass) => userModel.confirmPassword = pass,
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 44.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          disabledBackgroundColor:
                              Theme.of(context).primaryColor.withAlpha(100),
                          textStyle: const TextStyle(color: Colors.white)),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          if (userModel.password != userModel.confirmPassword) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Senhas não coincidem!'),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }
                          context.read<UserManager>().signUp()
                        }
                      },
                      child: const Text('Criar Conta',
                          style: TextStyle(fontSize: 18.0))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:access_token_practice/core/widgets/show_message_helper.dart';
import 'package:access_token_practice/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is LoginCompleteState) {
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        } else if (state is LoginErrorState) {
          showMessageHelper(state.error);
        }
      },
      builder: (BuildContext context, LoginState state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: context.watch<LoginCubit>().emailController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              TextFormField(
                controller: context.watch<LoginCubit>().passwordController,
                decoration: const InputDecoration(hintText: "Password"),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                context.read<LoginCubit>().login();
              },
              label: state is LoginLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const Text("Login")),
        );
      },
    );
  }
}

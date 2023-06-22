import 'package:access_token_practice/core/widgets/show_message_helper.dart';
import 'package:access_token_practice/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterCompleteState) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        } else if (state is RegisterErrorState) {
          showMessageHelper(state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: context.watch<RegisterCubit>().firstName,
                decoration: const InputDecoration(hintText: "First name"),
              ),
              TextFormField(
                controller: context.watch<RegisterCubit>().lastName,
                decoration: const InputDecoration(hintText: "Last name"),
              ),
              TextFormField(
                controller: context.watch<RegisterCubit>().email,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              TextFormField(
                controller: context.watch<RegisterCubit>().password,
                decoration: const InputDecoration(hintText: "Password"),
              ),
              TextFormField(
                controller: context.watch<RegisterCubit>().confirmPassword,
                decoration: const InputDecoration(hintText: "Comfirm password"),
              )
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
            children: [
              TextButton(onPressed: () {
                Navigator.pushNamed(context, "login");
              }, child: const Text("Login")),
              FloatingActionButton.extended(
                  onPressed: () {
                    context.read<RegisterCubit>().register();
                  },
                  label: state is RegisterLoadingState? const Center(child: CircularProgressIndicator(),) : const Text("Register")),
            ],
          ),
        );
      },
    );
  }
}


import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/model/auth_model.dart';
import '../data/service/auth_service.dart';

part 'register_cubit.dart';

abstract class RegisterState {
  RegisterState();
}

class RegisterInitialState extends RegisterState {
  RegisterInitialState();
}

class RegisterLoadingState extends RegisterState {
  RegisterLoadingState();
}

class RegisterErrorState extends RegisterState {
  final String error;
  RegisterErrorState(this.error);
}

class RegisterCompleteState extends RegisterState {
  RegisterCompleteState();
}

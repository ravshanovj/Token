part of 'register_states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

// instance
  AuthService service = AuthService();

// controllers
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Future<void> register() async {
    emit(RegisterLoadingState());
    await service
        .register(
            firstName: firstName.text,
            lastName: lastName.text,
            email: email.text,
            password: password.text,
            confirmPassword: confirmPassword.text)
        .then((dynamic response) async {
      if (response is AuthModel) {
        await Hive.openBox("access_token");
        await Hive.box("access_token").put("access_token", response.accessToken.toString());
        await Hive.box("access_token").close();
        emit(RegisterCompleteState());
      } else {
        emit(RegisterErrorState(response));
      }
    });
  }
}

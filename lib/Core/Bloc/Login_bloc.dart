import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginEvent {}

class LoadLogin extends LoginEvent {}

class TogglePassword extends LoginEvent {}

class LoginState {
  final bool isLoading;
  final bool obscureText;

  LoginState({this.isLoading = true, this.obscureText = true});

  LoginState copyWith({bool? isLoading, bool? obscureText}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoadLogin>((event, emit) async {
      await Future.delayed(Duration(milliseconds: 800));
      emit(state.copyWith(isLoading: false));
    });

    on<TogglePassword>((event, emit) {
      emit(state.copyWith(obscureText: !state.obscureText));
    });
  }
}
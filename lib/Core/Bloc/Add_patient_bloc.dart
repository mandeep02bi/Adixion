import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddPatientEvent {}

class SubmitPatient extends AddPatientEvent {}

abstract class AddPatientState {}

class AddPatientInitial extends AddPatientState {}
class AddPatientLoading extends AddPatientState {}
class AddPatientSuccess extends AddPatientState {}
class AddPatientError extends AddPatientState {}

class AddPatientBloc extends Bloc<AddPatientEvent, AddPatientState> {
  AddPatientBloc() : super(AddPatientInitial()) {
    on<SubmitPatient>((event, emit) async {
      emit(AddPatientLoading());

      await Future.delayed(const Duration(seconds: 2));

      emit(AddPatientSuccess());
    });
  }
}
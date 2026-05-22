import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignUp>(onAuthsignup);

    on<AuthSignOut>(onAuthSignout);
  }

  void onAuthsignup(AuthSignUp event, Emitter<AuthState> emit) async {
    try {
      if (event.email.isEmpty) {
        emit(AuthFailure(errMessage: 'Please enter email'));
        return;
      }

      if (event.password.length < 6) {
        emit(AuthFailure(errMessage: 'Password Should be length of 6'));
        return;
      }
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 1));

      emit(AuthSuccess(uid: 'Hi, ${event.email} -${event.password} '));
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }

  void onAuthSignout(AuthSignOut event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await Future.delayed(Duration(seconds: 2));

      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }

  @override
  void onChange(Change<AuthState> change) {
  
    super.onChange(change);

    print('change - $change');
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    
    super.onTransition(transition);

    print('transition -$transition');
  }
}

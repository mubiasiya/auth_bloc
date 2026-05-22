import 'package:auth_bloc/bloc/auth_bloc.dart';
import 'package:auth_bloc/home_page.dart';
import 'package:auth_bloc/widgets/elevButton.dart';
import 'package:auth_bloc/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class signupPage extends StatelessWidget {
  const signupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text('Sign Up'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
            );
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading || state is AuthSuccess) {
            return Center(child: CircularProgressIndicator());
          }

          return Center(
            child: SizedBox(
              height: 700,
              width: 700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textfield(email, 'Email'),
                  SizedBox(height: 20),
                  textfield(password, 'Password'),

                  SizedBox(height: 50),

                  elevbutton('Sign Up', () {
                    context.read<AuthBloc>().add(
                      AuthSignUp(email: email.text, password: password.text),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

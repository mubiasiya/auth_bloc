import 'package:auth_bloc/bloc/auth_bloc.dart';
import 'package:auth_bloc/signup_page.dart';
import 'package:auth_bloc/widgets/elevButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => signupPage()),
              (route) => false,
            );
          }
        },

        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is AuthSuccess) {
            return Center(
              child: Text(state.uid, style: TextStyle(color: Colors.white)),
            );
          }

          return Text('');
        },
      ),

      floatingActionButton: elevbutton('Logout', () {
        context.read<AuthBloc>().add(AuthSignOut());
      }),
    );
  }
}

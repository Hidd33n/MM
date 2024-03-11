import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mm/core/cases/errorcases.dart';
import 'package:mm/core/widgets/authtextfield.dart';
import 'package:mm/data/auth/verifyauth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    String username = '';
    String email = '';
    String password = '';

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        AuthTextField(
                          prefixIcon: Icons.person,
                          hintText: 'username'.tr(),
                          onChanged: (value) => username = value,
                        ),
                        const SizedBox(height: 20),
                        AuthTextField(
                          prefixIcon: Icons.email,
                          hintText: 'Email',
                          onChanged: (value) => email = value,
                        ),
                        const SizedBox(height: 20),
                        AuthTextField(
                          prefixIcon: Icons.lock,
                          hintText: 'pass'.tr(),
                          onChanged: (value) => password = value,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      bool registerSuccess = await authProvider.register(
                          username, email, password);
                      if (registerSuccess) {
                        ErrorCases.showRegistrationSuccess(context);
                      } else {
                        ErrorCases.showRegistrationError(context);
                      }
                    },
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'already',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                    ).tr(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Material(
                elevation: 4,
                shadowColor: Theme.of(context).splashColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).splashColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.moving_outlined,
                        size: 100,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'title'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 32),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mm/core/cases/errorcases.dart';
import 'package:mm/core/widgets/authtextfield.dart';
import 'package:mm/data/auth/verifyauth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    String email = '';
    String password = '';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Material(
              elevation: 4,
              shadowColor: Theme.of(context).splashColor,
              borderRadius: BorderRadius.circular(100),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        color: Theme.of(context).splashColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
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
                          Text('title'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontSize: 32)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                          prefixIcon: Icons.email,
                          hintText: 'Email',
                          onChanged: (value) => email = value,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),
                        AuthTextField(
                          prefixIcon: Icons.lock,
                          hintText: 'pass'.tr(),
                          onChanged: (value) => password = value,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      bool loginSuccess =
                          await authProvider.login(email, password, context);

                      if (loginSuccess) {
                        Navigator.pushReplacementNamed(context, '/cnav');
                      } else {
                        ErrorCases.showLoginError(context);
                      }
                    },
                    child: const Text('login').tr(),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      'notareregis?',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                    ).tr(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

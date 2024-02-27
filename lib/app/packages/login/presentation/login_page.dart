import 'package:flutter/material.dart';
import 'package:own_quest_app/app/commons/own_theme/core/theme/own_theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tokens = OwnTheme.getDesignTokensOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: tokens.colors.primary,
            fontFamily: tokens.font.family.base,
            fontWeight: tokens.font.weight.semiBold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: tokens.spacing.stack.xs),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: tokens.spacing.stack.xs),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement login logic
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

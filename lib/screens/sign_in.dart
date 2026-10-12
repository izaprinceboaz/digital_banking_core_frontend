import 'package:digital_banking_core_frontend/network/network.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> handleSignIn() async {
    final data = await Network().SignIn(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    if (!mounted) return;   // the screen may have closed while waiting

    if (data != null) {
      await Network().saveSession(data);
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign up failed. Try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
  final ColorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: ColorScheme.surface,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/M.png', width: 35, height: 35),
                const SizedBox(width: 8),
                const Text('Meridian'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    // color: theme.colorScheme.primary,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    const Text('Sign In'),
                    const SizedBox(height: 20,),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: handleSignIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Sign In',
                        // style: ,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('New to Meridian?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/sign-up'
                            );
                          },
                          style: TextButton.styleFrom(
                            overlayColor: Colors.black.withOpacity(0.05),
                          ),
                          child: const Text(
                            'Create an account.',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )
                        )
                      ]
                    ),
                  ],
                ),
              ),
            ),
            const Text("Meridian"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => {print("Email : $value")},
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onChanged: (value) => {print('Password: $value')},
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pushReplacementNamed(context, '/dashboard')
                      }, 
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

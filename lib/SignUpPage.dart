import 'package:appjamteam39/LoginPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.purple,
          title: Text('Kayıt Ol'),
        ),
        body: Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'İsim'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'İsim boş olamaz';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _surnameController,
              decoration: InputDecoration(labelText: 'Soyisim'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Soyisim boş olamaz';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-posta'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'E-posta boş olamaz';
                }
                // E-posta formatını kontrol etmek için düzenli ifade kullanılabilir
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Şifre'),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Şifre boş olamaz';
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Kayıt işlemi burada gerçekleştirilir
                  // Örneğin: _register();
                }
              },
              child: const Text('Kayıt Ol'),
            ),
            SizedBox(height: 10.0),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  const TextSpan(
                      text: "Hesabın var mı? ",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  TextSpan(
                    text: 'Giriş yap',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(context);
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
      );

  }
}
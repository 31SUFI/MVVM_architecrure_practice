import 'package:flutter/material.dart';
import 'package:mvvm_architecture/resource/Components/rounded_button.dart';
import 'package:mvvm_architecture/util/routes/utils.dart';
import 'package:mvvm_architecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewmodel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Optional: Add more email validation (e.g., format check)
                  return null;
                },
                onFieldSubmitted: (_) {
                  Utils.fieldFocusChange(
                      context, _emailFocusNode, _passwordFocusNode);
                },
              ),
              SizedBox(height: 16.0),
              ValueListenableBuilder(
                  valueListenable: _obscureText,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscureText: value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                          onPressed: () {
                            _obscureText.value = !_obscureText.value;
                          },
                        ),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    );
                  }),
              SizedBox(height: 16.0),
              RoundedButton(
                title: "Login",
                loading: authviewmodel.isLoading,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map<String, String> data = {
                      'email': _emailController.text.trim(),
                      'password': _passwordController.text.trim(),
                    };

                    print("Data to be sent: $data");

                    authviewmodel.login(data, context);
                  } else {
                    Utils.toastMessage("Please fill all fields correctly");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

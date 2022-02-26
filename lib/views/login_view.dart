import 'package:by_onboarding_login_page/utility/strings.dart';
import 'package:by_onboarding_login_page/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isCheckBox = false;
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isValidate = false;
  bool _isChecked = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 5,
        child: SingleChildScrollView(
          physics: _emailNode.hasFocus || _passwordNode.hasFocus
              ? const ScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppStrings().welcomeText,
                        style: Theme.of(context).textTheme.headline5,
                      )),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppStrings().signInText,
                        style: Theme.of(context).textTheme.headline3,
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      color: Color(0xFFFAFAFA),
                    ),
                    child: _textFields(),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form _textFields() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 10,
          right: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              focusNode: _emailNode,
              codeController: _mailController,
              labelText: AppStrings().emailText,
              textInputType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
              suffixIcon: null,
            ),
            CustomTextFormField(
              focusNode: _passwordNode,
              codeController: _passwordController,
              labelText: AppStrings().passwordText,
              hidePassword: true,
              textInputType: TextInputType.visiblePassword,
              prefixIcon: Icons.password,
              suffixIcon: Icons.visibility,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      activeColor: const Color(0xFF7C4DFF),
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                      value: _isChecked,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.height * 0.01),
                    Text(AppStrings().RememberMeText,
                        style: const TextStyle(
                          color: Color(0xFF7C4DFF),
                          fontSize: 15,
                        ))
                  ],
                ),
                Text(AppStrings().forgotPasswordText,
                    style: const TextStyle(
                      color: Color(0xFF7C4DFF),
                      fontSize: 15,
                    ))
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.75, 50),
                  maximumSize:
                      Size(MediaQuery.of(context).size.width * 0.75, 50),
                  primary: Colors.indigoAccent),
              onPressed: () {},
              child: Text(
                AppStrings().signInText,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(AppStrings().newAccountText,
                        style: const TextStyle(
                            color: Color(0xFF7C4DFF), fontSize: 16)),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings().signUp,
                          style: const TextStyle(
                              fontSize: 22, color: Color(0xFF7C4DFF)),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        ),
      ),
    );
  }
}

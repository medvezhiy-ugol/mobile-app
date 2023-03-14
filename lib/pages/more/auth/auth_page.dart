import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import 'bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: screenSize.height * 0.1,
                    ),
                    Text(
                      'Авторизация',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        fontFamily: AppFonts.unbounded,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Введите номер мобильного телефона',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.2,
                    ),
                    buildTextField(context, state),
                    const SizedBox(
                      height: 28,
                    ),
                    if (state is AuthWithButtonState)
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: buildGetCodeButton(context),
                            ),
                            const Spacer(),
                            Center(
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[
                                  Text(
                                    'Нажимая “получить код”, вы принимаете условия',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 12),
                                  ),
                                  CupertinoButton(
                                    onPressed: () {},
                                    borderRadius: BorderRadius.circular(5),
                                    child: Text(
                                      'Пользовательского соглашения',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Container buildGetCodeButton(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: AppColors.color26282F,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.pop(),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Получить код',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildTextField(BuildContext context, AuthState state) {
    return Container(
      height: 63,
      color: AppColors.color222222,
      alignment: Alignment.center,
      child: TextField(
        autofocus: true,
        textAlign: TextAlign.center,
        cursorHeight: 26,
        cursorColor: AppColors.colorFF9900,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        inputFormatters: [
          MaskTextInputFormatter(
            mask: '+7 (###) ###-##-##',
          )
        ],
        onChanged: (value) {
          if (value.length == 18) {
            context.read<AuthBloc>().add(AuthShowButtonEvent());
          } else if (state is AuthWithButtonState) {
            context.read<AuthBloc>().add(AuthHideButtonEvent());
          }
        },
      ),
    );
  }
}

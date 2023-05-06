import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medvezhiy_ugol/ui/primary_button.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../common_setup/routes.dart';
import '../../../services/auth_service.dart';
import '../../../ui/close_circle_button.dart';
import 'bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  static TextEditingController? phoneController;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    AuthPage.phoneController = TextEditingController();
    super.initState();
  }

  final authService = Injector().get<AuthService>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authService: authService),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthDefaultState || state is AuthWithButtonState) {
              return _buildFirstStageAuthBody(
                context: context,
                state: state,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildFirstStageAuthBody({
    required BuildContext context,
    required AuthState state,
  }) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: CloseCircleButton(
                onTap: () => context.pop(),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
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
            if (state is AuthWithButtonState || state is AuthSendCodeEvent)
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: PrimaryButton(
                        onTap: () {
                          context.push(Routes.moreAuthCode);
                          context.read<AuthBloc>().add(
                                AuthSendCodeEvent(
                                  phone: AuthPage.phoneController!.text,
                                ),
                              );
                        },
                        child: const Text(
                          'Получить код',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
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
  }

  Container buildTextField(
    BuildContext context,
    AuthState state,
  ) {
    return Container(
      height: 63,
      color: AppColors.color222222,
      alignment: Alignment.center,
      child: TextField(
        controller: AuthPage.phoneController,
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

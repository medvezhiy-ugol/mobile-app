import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../common_setup/routes.dart';
import '../../../../services/auth_service.dart';
import '../../../../ui/close_circle_button.dart';
import '../../../../ui/primary_button.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';

import '../auth_page/auth_page.dart';
import 'bloc/code_auth_bloc.dart';

class CodeAuthPage extends StatefulWidget {
  const CodeAuthPage({super.key});
  static TextEditingController? codeController;
  @override
  State<CodeAuthPage> createState() => _CodeAuthPageState();
}

class _CodeAuthPageState extends State<CodeAuthPage> {
  @override
  void initState() {
    CodeAuthPage.codeController = TextEditingController();
    super.initState();
  }

  final authService = Injector().get<AuthService>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CodeAuthBloc(authService: authService),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<CodeAuthBloc, CodeAuthState>(
          listener: (context, state) {
            if (state is CodeAuthErrorState) {
              _showSnackBar(context: context, text: state.error);
              CodeAuthPage.codeController!.clear();
            } else if (state is CodeAuthSuccessState) {
              context.go(Routes.more);
            }
          },
          builder: (context, state) {
            Size screenSize = MediaQuery.of(context).size;
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            context.pop();
                          },
                          customBorder: const CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.grey,
                                ),
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.05,
                    ),
                    Text(
                      'Верификация',
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
                      'Введите код из сообщения',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.2,
                    ),
                    _buildCodeTextField(context, state),
                    const SizedBox(
                      height: 28,
                    ),
                    if (state is CodeAuthWithButtonState)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.16),
                        child: PrimaryButton(
                          onTap: () async {
                            context.read<CodeAuthBloc>().add(
                                  CodeAuthVerificationEvent(
                                    phone: AuthPage.phoneController!.text,
                                    code: CodeAuthPage.codeController!.text,
                                  ),
                                );
                          },
                          child: const Text(
                            'Войти',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
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

  Widget _buildCodeTextField(BuildContext context, CodeAuthState state) {
    const length = 4;
    const Color borderColor = AppColors.color222222;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 24,
      ),
      decoration: BoxDecoration(
        color: AppColors.color222222,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Center(
      child: SizedBox(
        height: 68,
        child: Pinput(
          length: length,
          controller: CodeAuthPage.codeController,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyWith(
            height: 68,
            width: 64,
            decoration: defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: borderColor),
            ),
          ),
          forceErrorState: (state is CodeAuthErrorState),
          onChanged: (value) {
            if (CodeAuthPage.codeController!.text.length == 4) {
              context.read<CodeAuthBloc>().add(CodeAuthShowButtonEvent());
            } else if (CodeAuthPage.codeController!.text.length == 3) {
              context.read<CodeAuthBloc>().add(CodeAuthHideButtonEvent());
            }
          },
          errorPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              color: AppColors.colorBD3232,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  _showSnackBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }
}

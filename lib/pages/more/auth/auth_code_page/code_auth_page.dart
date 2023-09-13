import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/ui/back_arrow_button.dart';
import '../../../../services/auth_service.dart';
import '../../../../ui/primary_button.dart';
import '../../../../ui/pages/more/more_page.dart';
import '../auth_page/auth_page.dart';
import 'bloc/code_auth_bloc.dart';

class CodeAuthPage extends StatefulWidget {
  const CodeAuthPage({super.key});
  static TextEditingController? codeController;
  @override
  State<CodeAuthPage> createState() => _CodeAuthPageState();
}

class _CodeAuthPageState extends State<CodeAuthPage> {
  late final Timer timer;

  int time = 59;

  bool isSendAgain = false;
  bool isError = false;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time == 0) {
        isSendAgain = true;
      }
      else {
        time--;
      }
      setState(() {});
    });
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
        backgroundColor: const Color(0xff111216),
        body: BlocConsumer<CodeAuthBloc, CodeAuthState>(
          listener: (context, state) {
            if (state is CodeAuthErrorState) {
              _showSnackBar(context: context, text: state.error);
              CodeAuthPage.codeController!.clear();
            } else if (state is CodeAuthSuccessState) {
              context.read<CustomNavbarCubit>().getUser();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MorePage()));
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
                      alignment: Alignment.centerLeft,
                      child: BackArrowButton(
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.05,
                    ),
                    const Text(
                      'Код из смс',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        fontFamily: 'Unbounded',
                        color: Color(0xffFFFFFF)
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Мы отправили код на номер ${CodeAuthPage.codeController!.text}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffFFFFFF)
                      ),
                    ),
                    SizedBox(
                      height: 116
                    ),
                    _buildCodeTextField(context, state),
                    SizedBox(height: 4),
                    Center(
                      child: Text(
                        isError ? 'Неверный код' : '',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xffFB2D2D)
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 78,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: isSendAgain
                          ? GestureDetector(
                        onTap: () {
                          isSendAgain = false;
                          time = 59;
                          setState(() {});
                        },
                        child: const Text(
                            'Выслать код повторно',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xffB8B8B9)
                          ),
                        ),
                      )
                          : Text(
                        'Новый код можно получить через 00:$time',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xffB8B8B9)
                      ),
                      ),
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
                              color: Color(0xffFFFFFF)
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
    return Container(
        height: 63,
        width: double.infinity,
        color: Color(0xff191A1F),
        alignment: Alignment.center,
        child: TextField(
          maxLength: 4,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color(isError ? 0xffFB2D2D : 0xffFFFFFF)
          ),
          onChanged: (value) async {
            if (value.length == 4) {
              String response = 'error';
              response = await authService.authUser(
                phone: AuthPage.phoneController!.text,
                code: value,
              );
              if (response.contains('Token: ')) {
                context.read<CustomNavbarCubit>().getUser();
                Navigator.of(context).popUntil((route) => route.isFirst);
              } else {
                isError = true;
                setState(() {});
              }
            } else if (CodeAuthPage.codeController!.text.length == 3) {
              context.read<CodeAuthBloc>().add(CodeAuthHideButtonEvent());
            }
          },
        )
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



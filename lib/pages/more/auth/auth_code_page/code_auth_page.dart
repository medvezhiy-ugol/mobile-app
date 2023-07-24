import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/ui/back_arrow_button.dart';
import 'package:pinput/pinput.dart';
import '../../../../services/auth_service.dart';
import '../../../../ui/primary_button.dart';
import '../../../../utils/app_colors.dart';


import '../../more_page.dart';
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
        backgroundColor: const Color(0xff111216),
        body: BlocConsumer<CodeAuthBloc, CodeAuthState>(
          listener: (context, state) {
            if (state is CodeAuthErrorState) {
              _showSnackBar(context: context, text: state.error);
              CodeAuthPage.codeController!.clear();
            } else if (state is CodeAuthSuccessState) {
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
                    const Text(
                      'Мы отправили код на номер +79301032835',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffFFFFFF)
                      ),
                    ),
                    SizedBox(
                      height: 116
                    ),
                    _buildCodeTextField(context, state),
                    const SizedBox(
                      height: 96,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text('Новый код можно получить через 00:59',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xffB8B8B9)
                      ),),
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
    const length = 4;
    const Color borderColor = AppColors.color222222;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 24,
        color: Color(0xffFFFFFF)
      ),
      decoration: BoxDecoration(
        color: Color(0xff191A1F),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Center(
      child: Container(
        height: 63,
        width: double.infinity,
        color: Color(0xff191A1F),
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



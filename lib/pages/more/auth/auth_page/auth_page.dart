import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medvezhiy_ugol/ui/back_arrow_button.dart';
import 'package:medvezhiy_ugol/ui/primary_button.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../services/auth_service.dart';
import '../auth_code_page/code_auth_page.dart';
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
  bool showButton = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authService: authService),
      child: Scaffold(
        backgroundColor: const Color(0xff111216),
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthErrorState) {
              _showSnackBar(context: context, text: state.error);
              AuthPage.phoneController!.clear();
            } else if (state is AuthSuccessState) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CodeAuthPage()));
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
                      'Авторизация',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        fontFamily: 'Unbounded',
                        color: Color(0xffffffff)
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Введите номер мобильного телефона',
                      style: TextStyle(
                        fontSize: 16,
                          color: Color(0xffffffff)
                      ),
                    ),
                    SizedBox(
                      height: 116,
                    ),
                    buildTextField(context, state),
                    const SizedBox(
                      height: 28,
                    ),
                    if (showButton)
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: PrimaryButton(
                                onTap: () {
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
                                      color: Color(0xffffffff)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
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
                            const Spacer(),
                            // Center(
                            //   child: Stack(
                            //     alignment: Alignment.topCenter,
                            //     children: <Widget>[
                            //       Text(
                            //         'Нажимая “получить код”, вы принимаете условия',
                            //         textAlign: TextAlign.center,
                            //         style: TextStyle(
                            //             color: Colors.white.withOpacity(0.7),
                            //             fontSize: 12),
                            //       ),
                            //       CupertinoButton(
                            //         onPressed: () {},
                            //         borderRadius: BorderRadius.circular(5),
                            //         child: Text(
                            //           'Пользовательского соглашения',
                            //           style: const TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 12,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
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

  Container buildTextField(
    BuildContext context,
    AuthState state,
  ) {
    return Container(
      height: 63,
      width: double.infinity,
      color: Color(0xff191A1F),
      alignment: Alignment.center,
      child: TextField(
        maxLength: 18,
        controller: AuthPage.phoneController,
        autofocus: true,
        textAlign: TextAlign.center,
        cursorHeight: 26,
        cursorColor: AppColors.colorFF9900,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: InputBorder.none,
          //hintText: '+7 (###) ###-##-##',
          hintStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Colors.white.withOpacity(0.3)),
        ),
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: Color(0xffFFFFFF)
        ),
        inputFormatters: [
          MaskTextInputFormatter(
              mask: '+7 (###) ###-##-##',
              filter: {"#": RegExp(r'[0-9]')},
              type: MaskAutoCompletionType.lazy)
        ],
        onChanged: (value) {
          if (value.length == 18) {
            setState(() {
              showButton = true;
            });
          } else if (state is AuthWithButtonState) {
            setState(() {
              showButton = false;
            });
          }
        },
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

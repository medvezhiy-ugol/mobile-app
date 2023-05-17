import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/ui/primary_button.dart';

import '../../../services/auth_service.dart';
import '../../../utils/app_colors.dart';
import 'bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _textNameController = TextEditingController();
  TextEditingController _textBirthController = TextEditingController();
  TextEditingController _textSexController = TextEditingController();
  final authService = Injector().get<AuthService>();

  DateTime date = DateTime(2016, 10, 26);

  bool _isMale = false;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 302,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: BoxDecoration(
          color: Color(0xff111216),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40)
          )
        ),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(
                child: child,
              ),
              Material(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    color: Color(0xffFFB627),
                    alignment: Alignment.center,
                    child: Text(
                      "Сохранить",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xff121212)
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(authService: authService),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CloseCircleButton(
                            onTap: () {
                              context.pop();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        'Имя',
                        style: TextStyle(
                          color: AppColors.color808080,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      _buildTextField(
                        controller: _textNameController,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Дата рождения',
                        style: TextStyle(
                          color: AppColors.color808080,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        height: 60,
                        color: AppColors.color191A1F,
                        child: TextField(
                          onTap: () {
                            setState(() {
                              _textBirthController.text = '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
                            });
                            _showDialog(
                              CupertinoDatePicker(
                                initialDateTime: DateTime.now(),
                                mode: CupertinoDatePickerMode.date,
                                use24hFormat: true,
                                // This is called when the user changes the date.
                                onDateTimeChanged: (DateTime newDate) {
                                  setState(() => _textBirthController.text = '${newDate.day}.${newDate.month}.${newDate.year}');
                                },
                              ),
                            );
                          },
                          controller: _textBirthController,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Пол',
                        style: TextStyle(
                          color: AppColors.color808080,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        height: 60,
                        color: AppColors.color191A1F,
                        child: TextField(
                          onTap: () {
                            setState(() {
                              _textSexController.text = "Мужской";
                            });
                            _showDialog(
                              CupertinoPicker(
                                magnification: 1.22,
                                squeeze: 1.2,
                                useMagnifier: true,
                                itemExtent: 32.0,
                                // This sets the initial item.
                                scrollController: FixedExtentScrollController(
                                  initialItem: 0,
                                ),
                                // This is called when selected item is changed.
                                onSelectedItemChanged: (int selectedItem) {
                                  switch (selectedItem) {
                                    case 0:
                                      _textSexController.text = "Мужской";
                                      break;
                                    case 1:
                                      _textSexController.text = "Женский";
                                      break;
                                    case 2:
                                      _textSexController.text = "Не выбрано";
                                      break;
                                  }
                                  setState(() {});
                                },
                                children: [
                                  Center(
                                      child: Text(
                                          "Мужской",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xffFFFFFF)
                                        ),
                                      )
                                  ),
                                  Center(
                                    child: Text(
                                      "Женский",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xffFFFFFF)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          controller: _textSexController,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      PrimaryButton(
                        onTap: () {
                          _showSnackBar(
                            context: context,
                            text:
                                'В данный момент профиль в разработке, возможен только выход из аккаунта',
                          );
                        },
                        child: Text(
                          'Сохранить',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      PrimaryButton.icon(
                        onTap: () {
                          context.read<ProfileBloc>().add(
                                ProfileLogoutEvent(),
                              );
                          context.pop();
                        },
                        icon: Icons.exit_to_app_rounded,
                        label: Text(
                          'Выйти',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
  }) {
    return Container(
      height: 60,
      color: AppColors.color191A1F,
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
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

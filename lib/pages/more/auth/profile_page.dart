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
                    _buildTextField(
                      controller: _textBirthController,
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
                    _buildTextField(
                      controller: _textSexController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    PrimaryButton(
                      onTap: () {},
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
}

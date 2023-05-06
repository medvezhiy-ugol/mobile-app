import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';

import '../../../utils/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _textNameController = TextEditingController();
  TextEditingController _textBirthController = TextEditingController();
  TextEditingController _textSexController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CloseCircleButton(
                onTap: () {
                  context.pop();
                },
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
            ],
          ),
        ),
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import '../../ui/close_circle_button.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color1E1E1E,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(child: 
            Column(
              children: [
                const SizedBox(height: 12,),

                //Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CloseCircleButton(
                      onTap: () => context.pop(),
                    ),
                    const SizedBox(width: 2,)
                  ],
                ),
                const SizedBox(height: 27,),

                //Title
                const Text('Пользовательское положение', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 32,),

                //Text content
                const Text('''1. Общие положения
          1.1. Настоящее Пользовательское Соглашение регулирует отношения между Администрацией сайта https://bearcorner.ru и пользователями (далее – «Пользователь», «Пользователи») по использованию сервисов, расположенных на сайте https://bearcorner.ru (далее – «Интернет- ресурс», «сайт»).
          
          
          1.2. Сайт https://bearcorner.ru является собственностью ИП Красильщиков (ОГРН 2478372483728, ИНН/КПП 348294389/342893959, Юридический адрес: 150046, г. Ярославль, ул. 2-я комсомолькая, д. 30, 2-й эт., пом. VIII, ком. 1).
          
          
          1.3. Администрация сайта оставляет за собой право в любое время изменять, добавлять или удалять пункты настоящего Пользовательского Соглашения без уведомления Пользователя.
          
          
          1.4. Перед использованием Интернет-ресурса Пользователь обязан ознакомиться с настоящим Пользовательским соглашением и в случае согласия с его положениями присоединиться к нему путем проставления специальной отметки (галочки) напротив фразы:
          
          
          «Я даю свое согласие на обработку персональных данных. Я ознакомился и принимаю условия Политики конфиденциальности в отношении обработки персональных данных и пользовательского соглашения».''', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),),
                const SizedBox(height: 32,),

            ],)),
          ),
          )
          ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medvezhiy_ugol/pages/more/about_app/privacy_policy.dart';
import 'package:medvezhiy_ugol/ui/back_arrow_button.dart';
import 'package:medvezhiy_ugol/ui/widgets/more/about_app_tile.dart';
import '../../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({super.key});

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111216),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
  builder: (context, state) {
    return Column(
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  //  Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackArrowButton(
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(
                        width: 2,
                      )
                    ],
                  ),

                  // Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "О приложении",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  Row(
                    children: [
                      Image.asset(
                        'assets/images/about_app_page/bearLogo.png',
                        height: 120,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Text(
                          '''ИП “Красильщиков Роман”\nВерсия 0.1.build2''',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400,
                          color: Color(0xffffffff)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),

                  // "Пользовательское соглашение" Plate
                  const AboutAppTile(
                      widget: PrivacyPolicyPage(),
                      title: 'Пользовательское соглашение',
                    description: '1. Общие положения \n1.1. Настоящее Пользовательское Соглашение регулирует отношения между Администрацией сайта https://bearcorner.ru и пользователями (далее – «Пользователь», «Пользователи») по использованию сервисов, расположенных на сайте https://bearcorner.ru (далее – «Интернет- ресурс», «сайт»). \n\n1.2. Сайт https://bearcorner.ru является собственностью ИП Красильщиков (ОГРН 2478372483728, ИНН/КПП 348294389/342893959, Юридический адрес: 150046, г. Ярославль, ул. 2-я комсомолькая, д. 30, 2-й эт., пом. VIII, ком. 1). \n\n1.3. Администрация сайта оставляет за собой право в любое время изменять, добавлять или удалять пункты настоящего Пользовательского Соглашения без уведомления Пользователя. \n\n1.4. Перед использованием Интернет-ресурса Пользователь обязан ознакомиться с настоящим Пользовательским соглашением и в случае согласия с его положениями присоединиться к нему путем проставления специальной отметки (галочки) напротив фразы: «Я даю свое согласие на обработку персональных данных. Я ознакомился и принимаю условия Политики конфиденциальности в отношении обработки персональных данных и пользовательского соглашения».',
                  ),
                  const SizedBox(
                    height: 3,
                  ),

                  const AboutAppTile(
                      widget: PrivacyPolicyPage(),
                      title: 'Политика конфиденциальности',
                    description: '1. Общие положения \n1.1. Настоящее Пользовательское Соглашение регулирует отношения между Администрацией сайта https://bearcorner.ru и пользователями (далее – «Пользователь», «Пользователи») по использованию сервисов, расположенных на сайте https://bearcorner.ru (далее – «Интернет- ресурс», «сайт»). \n\n1.2. Сайт https://bearcorner.ru является собственностью ИП Красильщиков (ОГРН 2478372483728, ИНН/КПП 348294389/342893959, Юридический адрес: 150046, г. Ярославль, ул. 2-я комсомолькая, д. 30, 2-й эт., пом. VIII, ком. 1). \n\n1.3. Администрация сайта оставляет за собой право в любое время изменять, добавлять или удалять пункты настоящего Пользовательского Соглашения без уведомления Пользователя. \n\n1.4. Перед использованием Интернет-ресурса Пользователь обязан ознакомиться с настоящим Пользовательским соглашением и в случае согласия с его положениями присоединиться к нему путем проставления специальной отметки (галочки) напротив фразы: «Я даю свое согласие на обработку персональных данных. Я ознакомился и принимаю условия Политики конфиденциальности в отношении обработки персональных данных и пользовательского соглашения».',
                  ),
                  const SizedBox(
                    height: 3,
                  ),

                  const AboutAppTile(
                      widget: PrivacyPolicyPage(),
                      title: 'Положение об обработке персональных данных',
                    description: '1. Общие положения \n1.1. Настоящее Пользовательское Соглашение регулирует отношения между Администрацией сайта https://bearcorner.ru и пользователями (далее – «Пользователь», «Пользователи») по использованию сервисов, расположенных на сайте https://bearcorner.ru (далее – «Интернет- ресурс», «сайт»). \n\n1.2. Сайт https://bearcorner.ru является собственностью ИП Красильщиков (ОГРН 2478372483728, ИНН/КПП 348294389/342893959, Юридический адрес: 150046, г. Ярославль, ул. 2-я комсомолькая, д. 30, 2-й эт., пом. VIII, ком. 1). \n\n1.3. Администрация сайта оставляет за собой право в любое время изменять, добавлять или удалять пункты настоящего Пользовательского Соглашения без уведомления Пользователя. \n\n1.4. Перед использованием Интернет-ресурса Пользователь обязан ознакомиться с настоящим Пользовательским соглашением и в случае согласия с его положениями присоединиться к нему путем проставления специальной отметки (галочки) напротив фразы: «Я даю свое согласие на обработку персональных данных. Я ознакомился и принимаю условия Политики конфиденциальности в отношении обработки персональных данных и пользовательского соглашения».',
                  ),
                ],
              );
  },
)),
            ),
            const SizedBox(
              height: 22,
            ),
          ],
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import 'package:flutter/services.dart' show rootBundle;

import '../../../ui/close_circle_button.dart';
import '../../../utils/app_assets.dart';

class PersonalDataPolicyPage extends StatefulWidget {
  const PersonalDataPolicyPage({super.key});

  @override
  State<PersonalDataPolicyPage> createState() => _PersonalDataPolicyPageState();
}

class _PersonalDataPolicyPageState extends State<PersonalDataPolicyPage> {
  late Future<String> assetsPersonalDataPolicy;

  @override
  void initState() {
    assetsPersonalDataPolicy = _loadTextFile();
    super.initState();
  }

  Future<String> _loadTextFile() async {
    return await rootBundle.loadString(A.assetsPersonalDataPolicy);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.color111216,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CloseCircleButton(
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(
                        width: 2,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  const Text(
                    'Политика об обработке персональных данных',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  FutureBuilder<String>(
                    future: assetsPersonalDataPolicy,
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Text(
                          snapshot.data ?? 'Error loading file',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

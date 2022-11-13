import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_routes.dart';
import '../../../helpers/constants/constants.dart';
import '../../../localization/loalization.dart';
import '../../../models/config/config.dart';
import '../../../shared/beamer_history/beamer_history.dart';

class Body extends ConsumerWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locales = ref.watch(localeConfigProvider);
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisSize: mainMin,
            children: [
              Image.asset(
                'assets/images/logo-with-name.png',
                height: 100,
              ),
              const SizedBox(height: 50),
              Center(
                child: Text(
                  t!.projectName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: 600,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kPrimaryColor,
                    width: 1.5,
                  ),
                  borderRadius: defaultBorderRadius,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 100.0),
                        Expanded(
                          child: Card(
                            child: ListTile(
                              leading: Container(
                                height: 45.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kPrimaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                      'assets/images/supervisor.png'),
                                ),
                              ),
                              title: Text(t!.supervisorName),
                              subtitle: Text(t!.supervisor),
                            ),
                          ),
                        ),
                        const SizedBox(width: 100.0),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: ListTile(
                              leading: Container(
                                height: 45.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kPrimaryColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child:
                                      Image.asset('assets/images/student1.jpg'),
                                ),
                              ),
                              title: Text(t!.student1Name),
                              subtitle: Text(t!.student1),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: ListTile(
                              leading: Container(
                                height: 45.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kPrimaryColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child:
                                      Image.asset('assets/images/student2.jpg'),
                                ),
                              ),
                              title: Text(t!.student2Name),
                              subtitle: Text(t!.student2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: ListTile(
                              leading: Container(
                                height: 45.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kPrimaryColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child:
                                      Image.asset('assets/images/student3.jpg'),
                                ),
                              ),
                              title: Text(t!.student3Name),
                              subtitle: Text(t!.student3),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: ListTile(
                              leading: Container(
                                height: 45.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kPrimaryColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child:
                                      Image.asset('assets/images/student4.jpg'),
                                ),
                              ),
                              title: Text(t!.student4Name),
                              subtitle: Text(t!.student4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: mainMin,
                children: [
                  Text(locales == Locales.english
                      ? 'Language Change to Bangla'
                      : 'ভাষা পরিবর্তন করুন'),
                  const SizedBox(width: 20),
                  Switch(
                    value: locales == Locales.bengali,
                    onChanged: (_) async {
                      await changeLocale(
                        ref,
                        localeType == Locales.english
                            ? Locales.bengali
                            : Locales.english,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kPrimaryColor),
                ),
                onPressed: () {
                  Beamer.of(context).beamToNamed(AppRoutes.drawingBoardRoute);
                  printUrlHistory(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: Text(t!.startDrawing),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

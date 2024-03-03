import 'package:flutter/material.dart';

import '../widgets/custom_drop_down.dart';
import '../widgets/password_validation.dart';
import '../widgets/text_field.dart';

class PersonInfo extends StatefulWidget {
  final PageController pageController;
  const PersonInfo({Key? key, required this.pageController}) : super(key: key);

  @override
  State<PersonInfo> createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo> {
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool? isChecked = false;
  bool? isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'персональная информация'.toUpperCase(),
                style: const TextStyle(
                  fontFamily: 'DrukCyr',
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const AppTextField(
                hint: 'Имя',
                textType: TextInputType.text,
              ),
              const SizedBox(
                height: 4,
              ),
              const AppTextField(
                hint: 'Фамилия',
                textType: TextInputType.text,
              ),
              const SizedBox(
                height: 4,
              ),
              const CustomGenderDropDown(
                hint: 'Пол',
              ),
              const SizedBox(
                height: 32,
              ),
              const AppTextField(
                hint: 'Дата рождения',
                textType: TextInputType.datetime,
              ),
              const SizedBox(
                height: 32,
              ),
              const AppTextField(
                hint: 'Имя в приложении',
                textType: TextInputType.name,
              ),
              const SizedBox(
                height: 32,
              ),
              const AppTextField(
                hint: 'Почта',
                textType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 32,
              ),
              PasswordValidationWidget(),
              const SizedBox(
                height: 32,
              ),
              const AppTextField(
                hint: 'Повторите пароль',
                textType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Коммуникация:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0))),
                          activeColor: const Color.fromRGBO(153, 191, 212, 1),
                          isError: true,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        'Я хочу получать рекламные электронные\nписьма и информацию о приложениях',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Конфиденциальность:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0))),
                          activeColor: const Color.fromRGBO(153, 191, 212, 1),
                          isError: true,
                          value: isChecked2,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked2 = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "Я принимаю все ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )),
                            TextSpan(
                              text: "правила",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color.fromRGBO(153, 191, 212, 1),
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: isChecked! && isChecked2!
                      ? () {
                          if (widget.pageController.hasClients) {
                            int nextPage =
                                widget.pageController.page!.toInt() + 1;
                            widget.pageController.animateToPage(
                              nextPage,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        (isChecked ?? false) && (isChecked2 ?? false)
                            ? const Color.fromRGBO(153, 191, 212, 1)
                            : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36, vertical: 18),
                  ),
                  child: const Text(
                    'ШАГ 2 →',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

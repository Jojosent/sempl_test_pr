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
  TextEditingController _passwordController = TextEditingController();
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
                style: TextStyle(
                  fontFamily: 'DrukCyr',
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              AppTextField(
                hint: 'Имя',
                textType: TextInputType.text,
              ),
              SizedBox(
                height: 4,
              ),
              AppTextField(
                hint: 'Фамилия',
                textType: TextInputType.text,
              ),
              SizedBox(
                height: 4,
              ),
              CustomGenderDropDown(
                hint: 'Пол',
              ),
              SizedBox(
                height: 32,
              ),
              AppTextField(
                hint: 'Дата рождения',
                textType: TextInputType.datetime,
              ),
              SizedBox(
                height: 32,
              ),
              AppTextField(
                hint: 'Имя в приложении',
                textType: TextInputType.name,
              ),
              SizedBox(
                height: 32,
              ),
              AppTextField(
                hint: 'Почта',
                textType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 32,
              ),
              PasswordValidationWidget(),
              SizedBox(
                height: 32,
              ),
              AppTextField(
                hint: 'Повторите пароль',
                textType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Коммуникация:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  SizedBox(
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
                          activeColor: Color.fromRGBO(153, 191, 212, 1),
                          isError: true,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Я хочу получать рекламные электронные\nписьма и информацию о приложениях',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Конфиденциальность:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  SizedBox(
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
                          activeColor: Color.fromRGBO(153, 191, 212, 1),
                          isError: true,
                          value: isChecked2,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked2 = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
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
              SizedBox(
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
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        }
                      : null,
                  child: Text(
                    'ШАГ 2 →',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: (isChecked ?? false) && (isChecked2 ?? false)
                        ? Color.fromRGBO(153, 191, 212, 1)
                        : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

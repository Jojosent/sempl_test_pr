import 'package:flutter/material.dart';
import 'package:sempl_test_pr/widgets/text_field.dart';

class AdressInfoScreen extends StatefulWidget {
  final PageController pageController;
  const AdressInfoScreen({super.key, required this.pageController});

  @override
  State<AdressInfoScreen> createState() => _AdressInfoScreenState();
}

class _AdressInfoScreenState extends State<AdressInfoScreen> {
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController houseNumberController;
  late TextEditingController apartmentNumberController;
  late TextEditingController entranceController;
  late TextEditingController postalCodeController;

  late bool cityError;
  late bool streetError;
  late bool houseError;
  late bool apartError;
  late bool entranceError;
  late bool postalError;

  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    cityController = TextEditingController();
    streetController = TextEditingController();
    houseNumberController = TextEditingController();
    apartmentNumberController = TextEditingController();
    entranceController = TextEditingController();
    postalCodeController = TextEditingController();

    cityError = false;
    streetError = false;
    houseError = false;
    apartError = false;
    entranceError = false;
    postalError = false;

    cityController.addListener(checkIfFieldsAreFilled);
    streetController.addListener(checkIfFieldsAreFilled);
    houseNumberController.addListener(checkIfFieldsAreFilled);
    apartmentNumberController.addListener(checkIfFieldsAreFilled);
    entranceController.addListener(checkIfFieldsAreFilled);
    postalCodeController.addListener(checkIfFieldsAreFilled);
  }

  void checkIfFieldsAreFilled() {
    final isFieldsFilled = cityController.text.isNotEmpty &&
        streetController.text.isNotEmpty &&
        houseNumberController.text.isNotEmpty &&
        apartmentNumberController.text.isNotEmpty &&
        entranceController.text.isNotEmpty &&
        postalCodeController.text.isNotEmpty;

    setState(() {
      isButtonActive = isFieldsFilled;
    });
  }

  bool _showError = false;
  void validateFields() {
    setState(() {
      cityError = cityController.text.isEmpty;
      streetError = streetController.text.isEmpty;
      houseError = houseNumberController.text.isEmpty;
      apartError = apartmentNumberController.text.isEmpty;
      entranceError = entranceController.text.isEmpty;
      postalError = postalCodeController.text.isEmpty;
      _showError = cityError ||
          streetError ||
          houseError ||
          apartError ||
          entranceError ||
          postalError;
    });
  }

  @override
  void dispose() {
    cityController.dispose();
    streetController.dispose();
    houseNumberController.dispose();
    apartmentNumberController.dispose();
    entranceController.dispose();
    postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'адрес доставки'.toUpperCase(),
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
                  hint: 'Город',
                  textType: TextInputType.text,
                ),
                SizedBox(
                  height: 4,
                ),
                AppTextField(
                  hint: 'Улица',
                  textType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2.3,
                      child: AppTextField(
                        hint: 'Номер дома',
                        textType: TextInputType.streetAddress,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2.3,
                      child: AppTextField(
                        hint: 'Номер квартиры',
                        textType: TextInputType.streetAddress,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2.3,
                      child: AppTextField(
                        hint: 'Подъезд',
                        textType: TextInputType.streetAddress,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2.3,
                      child: AppTextField(
                        hint: 'Почтовый индекс',
                        textType: TextInputType.streetAddress,
                      ),
                    ),
                  ],
                ),
                if (_showError = false)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '*Поля обязательные для заполнения',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'После регистрации адрес можно изменить в личном кабинете',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      validateFields();
                      if (!cityError &&
                          !streetError &&
                          !houseError &&
                          !apartError &&
                          !entranceError &&
                          !postalError) {
                        // Proceed to the next page
                        widget.pageController.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      'ШАГ 3 →',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(153, 191, 212, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

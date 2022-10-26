import 'dart:developer';

import 'package:currency_converter_app/modals/converter.dart';
import 'package:currency_converter_app/providers/app_theme_provider.dart';
import 'package:currency_converter_app/providers/converter_helper.dart';
import 'package:currency_converter_app/providers/converter_provider.dart';
import 'package:currency_converter_app/utils/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int val1 = 0;
  int val2 = 1;
  int amount = 1;
  TextEditingController amountController = TextEditingController();


  defaultData() {
    Provider.of<ConverterProvider>(context,listen: false).convertCurrencies(want: "${currencyName[val2]}", have: "${currencyName[val1]}", amount: double.parse(amountController.text));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController.text = amount.toString();
    defaultData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                    "Currency\nConverter",
                    style: TextStyle(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor, fontSize: 28),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false).changeTheme();
                    },
                    icon: Icon(
                      Icons.brightness_6,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "From : ",
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: 350,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xff484858),
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(

                      borderRadius: BorderRadius.circular(10),
                      value: val1,
                      isExpanded: true,
                      items: currencyName
                          .map((e) => DropdownMenuItem(
                                value: currencyName.indexOf(e),
                                child: Text(
                                  e,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          log(value.toString(), name: "value");
                          val1 = value!;
                        });
                      },
                      style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 17),
                      iconEnabledColor: Theme.of(context).secondaryHeaderColor,
                      dropdownColor: Theme.of(context).backgroundColor,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),

              // Second
              SizedBox(
                height: 20,
              ),
              Text(
                "To : ",
                style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: 350,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xff484858),
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: val2,
                      isExpanded: true,
                      items: currencyName
                          .map((e) => DropdownMenuItem(
                                value: currencyName.indexOf(e),
                                child: Text(
                                  e,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          log(value.toString(), name: "value");
                          val2 = value!;
                        });
                      },
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 17,
                      ),
                      iconEnabledColor: Theme.of(context).secondaryHeaderColor,
                      dropdownColor: Theme.of(context).backgroundColor,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Amount : ",
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                        controller: amountController,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () async {
                        Provider.of<ConverterProvider>(context,listen: false).convertCurrencies(want: "${currencyName[val2]}", have: "${currencyName[val1]}", amount: double.parse(amountController.text));
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Convert",
                            style: TextStyle(
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Result : ",
                style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "${amountController.text} ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 35,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      text: "${currencyName[val1]}"),
                  TextSpan(
                    text: " : ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 35,
                        color: Theme.of(context).primaryColor,
                      ),
                      text: "${Provider.of<ConverterProvider>(context).data?.amount} "),
                  TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 35,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      text: "${currencyName[val2]}"),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

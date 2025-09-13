import 'package:flutter/material.dart';

Widget customTextFormField(
  BuildContext context, {
  TextEditingController? controller,
  String? hint,
  String? icon,
  String? frontLogo = '',
  bool? obSecure,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
    child: Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white12, // light background
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (frontLogo != '')
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset('assets/logos/formLogos/$frontLogo'),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: controller,
                obscureText: obSecure ?? false,
                decoration: InputDecoration(
                  hintText: hint ?? "",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                  border: InputBorder.none, // remove default underline
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Image.asset(
              'assets/logos/formLogos/$icon',
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

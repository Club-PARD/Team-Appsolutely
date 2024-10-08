import 'package:flutter/material.dart';

import 'app_text_styles.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.contents,
    required this.controller,
    required this.onChanged,
    required this.validation,
  });

  final String contents;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String? Function(String? value) validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 10),
        hintText: contents,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFFC0C0C0)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        hintStyle: Body1Style(),
      ),
      onChanged: (value) => onChanged(value),
      validator: validation,
    );
  }
}

class MyButton extends StatelessWidget {
  final void Function() pressed;
  final String string;

  const MyButton({
    super.key,
    required this.pressed,
    required this.string,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0XFF2145FF),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.fromLTRB(66, 17, 66, 17),
        side: const BorderSide(width: 1.0, color: Color(0XFF2145FF)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(height: 3),
              Image.asset(
                'assets/img/Lock.png',
                height: 17,
                width: 17,
              ),
            ],
          ),
          const SizedBox(width: 10),
          Text(
            string,
            style: Title4Style(color: const Color(0XFF2145FF)),
          ),
        ],
      ),
    );
  }
}

class MyWidget {
  Widget Dot() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Image.asset('assets/img/Dot.png', height: 4, width: 4),
      ],
    );
  }

  Widget TextFieldCenter(contents, controller, onChanged) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        hintText: contents,
        contentPadding: const EdgeInsets.only(top: 10),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFFC0C0C0)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        hintStyle: Body1Style(),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF2145FF)),
        ),
      ),
      onChanged: (value) => onChanged(value),
    );
  }
}

List<String> list = <String>['SKT', 'KT', 'LG U+', '알뜰폰'];

class DropdownButtonCode extends StatefulWidget {
  const DropdownButtonCode({super.key});

  @override
  State<DropdownButtonCode> createState() => _DropdownButtonCodeState();
}

class _DropdownButtonCodeState extends State<DropdownButtonCode> {
  String dropdownValue = list.first;
  final List<String> _valueList = ['통신사', 'SKT', 'KT', 'LG U+', '알뜰폰'];
  String _selectedValue = '통신사';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedValue,
      // style: Body1Style(color: Colors.black),
      items: _valueList.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedValue = value.toString();
        });
      },
    );
  }
}

class AddTextFormField extends StatelessWidget {
  const AddTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    required this.validation,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String? value) validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      validator: validation,
    );
  }
}

class EditTextFormField extends StatefulWidget {
  const EditTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    required this.validation,
    required this.content,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String? value) validation;
  final String? content;

  @override
  State<EditTextFormField> createState() => _EditTextFormFieldState();
}

class _EditTextFormFieldState extends State<EditTextFormField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.text = widget.content!;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      validator: widget.validation,
    );
  }
}

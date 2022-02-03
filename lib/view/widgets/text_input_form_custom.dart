import 'package:flutter/material.dart';

class TextInputFormCustom extends StatelessWidget {
  const TextInputFormCustom({Key? key, required this.hint, required this.func})
      : super(key: key);
  final String hint;
  final Function func;

  @override
  Widget build(BuildContext context) {
    final _textEditingController = TextEditingController();
    final _devSize = MediaQuery.of(context).size;
    return SizedBox(
      width: _devSize.width * .8,
      height: _devSize.height * .1,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: hint,
          fillColor: Colors.white,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.zero),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.zero),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
        ),
        controller: _textEditingController,
        onSaved: (newValue) => func(newValue),
        validator: (value) {
          if (value == null || value.length < 4) {
            return "must be at least 4 charachters";
          }
        },
      ),
    );
  }
}

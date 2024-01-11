import 'package:flutter/material.dart';

class AgregarCampo extends StatefulWidget {
  final TextEditingController controller;
  final bool readOnly;
  const AgregarCampo(
      {Key? key,
      required this.controller,
      this.readOnly = false,
      required InputDecoration decoration})
      : super(key: key);

  @override
  _AgregarCampoState createState() => _AgregarCampoState();
}

class _AgregarCampoState extends State<AgregarCampo> {
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();

    // Divide el texto guardado en líneas individuales.
    List<String> savedTexts = widget.controller.text.split('\n');

    // Si hay texto guardado, inicializa los controladores con él.
    if (savedTexts.isNotEmpty) {
      _controllers =
          savedTexts.map((text) => TextEditingController(text: text)).toList();
    } else {
      // Si no hay texto guardado, inicializa con un controlador vacío.
      _controllers.add(TextEditingController());
    }
  }

  void _updateMainController() {
    String combinedText = _controllers.map((c) => c.text).join('\n');
    widget.controller.text = combinedText;
  }

  void _addNewTextField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _removeTextField(int index) {
    setState(() {
      if (_controllers.length > 1) {
        _controllers.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < _controllers.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controllers[i],
                    readOnly: widget.readOnly,
                    style: const TextStyle(fontSize: 18),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.justify,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      hintText: i == 0 ? 'a) Escribe aquí...' : null,
                    ),
                    onChanged: (_) => _updateMainController(),
                  ),
                ),
                if (!widget.readOnly)
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => _removeTextField(i),
                  ),
              ],
            ),
          ),
        if (!widget.readOnly)
          Align(
            alignment: Alignment.centerRight,
            child: FloatingActionButton(
              onPressed: _addNewTextField,
              child: const Icon(Icons.add, color: Color(0xFF003366)),
              backgroundColor: Colors.green,
              mini: true,
            ),
          ),
      ],
    );
  }
}

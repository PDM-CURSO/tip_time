import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _costController = TextEditingController();
  bool _isRoundedRequested = false; // para redondear propina
  int? _currentRadioGroupValue; // indica el radio marcado como seleccionado
  double _propina = 0.0;

  var _radioGroupValues = {
    0: "Amazing 20%",
    1: "Good 18%",
    2: "Ok 15%",
  };

  var _radioGroupAssets = {
    0: "assets/like_amazing.png",
    1: "assets/like_good.png",
    2: "assets/like_ok.png",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _costController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Cost of service",
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          // El grupo de radios
          Column(children: radioGroupGenerator()),
          // El switch de redondeo
          SwitchListTile(
            title: Text("Round up tip"),
            secondary: Icon(Icons.card_giftcard),
            value: _isRoundedRequested,
            onChanged: (newValue) {
              setIsRoundedSelected(newValue);
            },
          ),
          MaterialButton(
            child: Text("CALCULATE"),
            onPressed: () {
              // Llama a tip calculation
              tipCalculation();
            },
          ),
          Text("Tip amount: \$$_propina"),
        ],
      ),
    );
  }

  // Crea un grupo de N radios en base a N datos que queramos enlistar
  List<ListTile> radioGroupGenerator() {
    return _radioGroupValues.entries
        .map(
          (entry) => ListTile(
            leading: Image.asset(
              _radioGroupAssets[entry.key]!,
              height: 36,
              width: 36,
            ),
            title: Text("${entry.value}"),
            trailing: Radio(
              value: entry.key,
              groupValue: _currentRadioGroupValue,
              onChanged: (int? selectedRadio) {
                setSelectedRadio(selectedRadio);
              },
            ),
          ),
        )
        .toList();
  }

  void setIsRoundedSelected(bool updatedSwitchValue) {
    _isRoundedRequested = updatedSwitchValue;
    setState(() {});
  }

  void setSelectedRadio(int? updatedRadioValue) {
    _currentRadioGroupValue = updatedRadioValue;
    setState(() {});
  }

  void tipCalculation() {
    // TODO: completar metodo para calcular cuanta propina se dejara
    if (_costController.text.isEmpty) return;
    if (_currentRadioGroupValue == null) return;
  }
}

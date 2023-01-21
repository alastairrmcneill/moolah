import 'package:flutter/material.dart';
import 'package:moolah/notifiers/notifiers.dart';
import 'package:provider/provider.dart';

class CurrencyDropDown extends StatelessWidget {
  const CurrencyDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsNotifier settingsNotifier = Provider.of<SettingsNotifier>(context);
    return DropdownButton<String>(
      dropdownColor: const Color(0xFFE1E7FF),
      iconEnabledColor: const Color(0xFFE1E7FF),
      value: settingsNotifier.currency,
      items: currencyList
          .map(
            (currency) => DropdownMenuItem<String>(
              value: currency,
              child: Text(
                currency,
                style: TextStyle(fontSize: 22, color: Theme.of(context).scaffoldBackgroundColor),
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        settingsNotifier.setCurrency(value!);
      },
      selectedItemBuilder: (BuildContext ctxt) {
        return currencyList.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item, style: const TextStyle(fontSize: 22, color: Color(0xFFE1E7FF))),
          );
        }).toList();
      },
      underline: Container(),
    );
  }
}

List<String> currencyList = [
  '₡',
  '€',
  'Rp',
  '¥',
  'kr',
  '£',
  '\$',
];

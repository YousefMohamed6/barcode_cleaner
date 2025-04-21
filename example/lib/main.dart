import 'package:barcode_cleaner/clean_options/clean_barcode_option.dart';
import 'package:barcode_cleaner/clean_options/custom_clean_option.dart';
import 'package:barcode_cleaner/src/barcode_cleaner_base.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Cleaner Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BarcodeCleanerExample(),
    );
  }
}

class BarcodeCleanerExample extends StatefulWidget {
  const BarcodeCleanerExample({super.key});

  @override
  State<BarcodeCleanerExample> createState() => _BarcodeCleanerExampleState();
}

class _BarcodeCleanerExampleState extends State<BarcodeCleanerExample> {
  final TextEditingController _barcodeController = TextEditingController();
  final BarcodeCleaner _barcodeCleaner = BarcodeCleaner();
  String _result = '';

  void _cleanBarcode() {
    final barcode = _barcodeController.text;
    if (barcode.isEmpty) return;

    setState(() {
      // Example of using different cleaning methods
      _result = '''
Original: $barcode
Remove leading zeros: ${_barcodeCleaner.removeStartZero(barcode)}
Limit to 5 characters: ${_barcodeCleaner.removeIncreasedLetter(barcode, 5)}
Only numbers: ${_barcodeCleaner.clean(
        barcode: barcode,
        cleanBarCodeOption: CleanBarCodeOption.onlyNumbers,
      )}
Alphanumeric only: ${_barcodeCleaner.clean(
        barcode: barcode,
        cleanBarCodeOption: CleanBarCodeOption.alphaNumericAndAsciiCharOnly,
      )}
English characters and numbers: ${_barcodeCleaner.customClean(
        barcode: barcode,
        customCleanOption: CustomCleanOption.enCharSmallAndBigPlusNumbers,
      )}
''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Cleaner Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _barcodeController,
              decoration: const InputDecoration(
                labelText: 'Enter barcode',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _cleanBarcode,
              child: const Text('Clean Barcode'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _result,
                  style: const TextStyle(fontFamily: 'monospace'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _barcodeController.dispose();
    super.dispose();
  }
}

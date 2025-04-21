<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->

# Barcode Cleaner

A Flutter package for cleaning and formatting barcodes with various options.

## Features

- Remove leading zeros
- Limit barcode length
- Clean barcodes with various options:
  - Only numbers
  - Alphanumeric and ASCII characters
  - Symbols and ASCII characters
  - Custom cleaning options for different character sets

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  barcode_cleaner: ^1.0.0
```

## Usage

```dart
import 'package:barcode_cleaner/barcode_cleaner.dart';

void main() {
  final barcodeCleaner = BarcodeCleaner();
  
  // Remove leading zeros
  final cleanedBarcode = barcodeCleaner.removeStartZero('00012345');
  print(cleanedBarcode); // '12345'
  
  // Limit barcode length
  final limitedBarcode = barcodeCleaner.removeIncreasedLetter('123456789', 5);
  print(limitedBarcode); // '12345'
  
  // Clean barcode with basic options
  final basicCleaned = barcodeCleaner.clean(
    barcode: 'ABC123!@#',
    cleanBarCodeOption: CleanBarCodeOption.onlyNumbers,
  );
  print(basicCleaned); // '123'
  
  // Clean barcode with custom options
  final customCleaned = barcodeCleaner.customClean(
    barcode: 'ABC123!@#',
    customCleanOption: CustomCleanOption.enCharSmallAndBigPlusNumbers,
  );
  print(customCleaned); // 'ABC123'
}
```

## Available Cleaning Options

### Basic Cleaning Options
- `none`: No cleaning
- `onlyNumbers`: Keep only numbers
- `alphaNumericAndAsciiCharOnly`: Keep alphanumeric and ASCII characters
- `onlySymbolsAndAsciiChar`: Keep symbols and ASCII characters

### Custom Cleaning Options
- `onlyNumbers`: Keep only numbers
- `enCharSmallAndBig`: Keep English characters (both cases)
- `enCharSmallAndBigPlusNumbers`: Keep English characters and numbers
- `enCharBig`: Keep only uppercase English characters
- `enCharBigPlusNumbers`: Keep uppercase English characters and numbers
- `enCharSmall`: Keep only lowercase English characters
- `enCharSmallPlusNumbers`: Keep lowercase English characters and numbers
- `arChar`: Keep only Arabic characters
- `arCharPlusNumbers`: Keep Arabic characters and numbers
- `arCharAndEnCharBigAndSmall`: Keep Arabic and English characters
- `arCharAndEnCharBigAndSmallPlusNumbers`: Keep Arabic, English characters, and numbers

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License

## Support

If you encounter any issues or have questions, please file an issue on the [GitHub repository](https://github.com/YousefMohamed6/barcode_cleaner/issues).

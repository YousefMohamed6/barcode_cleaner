import 'package:barcode_cleaner/clean_options/clean_barcode_option.dart';
import 'package:barcode_cleaner/clean_options/custom_clean_option.dart';
import 'package:barcode_cleaner/src/barcode_cleaner_base.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BarcodeCleaner barcodeCleaner;

  setUp(() {
    barcodeCleaner = BarcodeCleaner();
  });

  group('BarcodeCleaner Tests', () {
    test('removeStartZero removes leading zeros', () {
      expect(barcodeCleaner.removeStartZero('00012345'), '12345');
      expect(barcodeCleaner.removeStartZero('12345'), '12345');
      expect(barcodeCleaner.removeStartZero('0'), '');
    });

    test('removeIncreasedLetter limits barcode length', () {
      expect(barcodeCleaner.removeIncreasedLetter('123456789', 5), '12345');
      expect(barcodeCleaner.removeIncreasedLetter('123', 5), '123');
    });

    test('clean with onlyNumbers option', () {
      expect(
        barcodeCleaner.clean(
          barcode: 'ABC123!@#',
          cleanBarCodeOption: CleanBarCodeOption.onlyNumbers,
        ),
        '123',
      );
    });

    test('clean with alphaNumericAndAsciiCharOnly option', () {
      expect(
        barcodeCleaner.clean(
          barcode: 'ABC123!@#',
          cleanBarCodeOption: CleanBarCodeOption.alphaNumericAndAsciiCharOnly,
        ),
        'ABC123',
      );
    });

    test('customClean with EnCharSmallAndBigPlusNumbers option', () {
      expect(
        barcodeCleaner.customClean(
          barcode: 'ABC123!@#',
          customCleanOption: CustomCleanOption.enCharSmallAndBigPlusNumbers,
        ),
        'ABC123',
      );
    });

    test('customClean with ArChar option', () {
      expect(
        barcodeCleaner.customClean(
          barcode: 'مرحبا123',
          customCleanOption: CustomCleanOption.arChar,
        ),
        'مرحبا',
      );
    });

    test('customClean with ARCharAndEnCharBigAndSmallPlusNumbers option', () {
      expect(
        barcodeCleaner.customClean(
          barcode: 'مرحباHello123!@#',
          customCleanOption:
              CustomCleanOption.arCharAndEnCharBigAndSmallPlusNumbers,
        ),
        'مرحباHello123',
      );
    });
  });
}

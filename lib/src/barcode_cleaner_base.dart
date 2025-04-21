import 'package:barcode_cleaner/clean_options/clean_barcode_option.dart';
import 'package:barcode_cleaner/clean_options/custom_clean_option.dart';

/// A utility class for cleaning and formatting barcodes with various options.
///
/// This class provides methods to:
/// - Remove leading zeros from barcodes
/// - Limit barcode length
/// - Clean barcodes using predefined patterns
/// - Perform custom cleaning operations
class BarcodeCleaner {
  /// Removes characters beyond the specified maximum length.
  ///
  /// If the barcode length is less than [maxLength], the original barcode is returned.
  /// Otherwise, the barcode is truncated to [maxLength] characters.
  ///
  /// Example:
  /// ```dart
  /// final cleaner = BarcodeCleaner();
  /// final result = cleaner.removeIncreasedLetter('123456789', 5); // Returns '12345'
  /// ```
  String removeIncreasedLetter(String barcode, int maxLength) {
    if (barcode.length < maxLength) {
      return barcode;
    }
    return barcode.substring(0, maxLength);
  }

  /// Removes leading zeros from the barcode.
  ///
  /// This method removes all consecutive zeros at the beginning of the barcode.
  /// If the barcode contains only zeros, an empty string is returned.
  ///
  /// Example:
  /// ```dart
  /// final cleaner = BarcodeCleaner();
  /// final result = cleaner.removeStartZero('00012345'); // Returns '12345'
  /// ```
  String removeStartZero(String barcode) {
    return barcode.replaceFirst(RegExp(r'^0+'), '');
  }

  /// Cleans the barcode based on the specified cleaning option.
  ///
  /// The [cleanBarCodeOption] parameter determines which characters to keep:
  /// - [CleanBarCodeOption.none]: Returns the original barcode
  /// - [CleanBarCodeOption.onlyNumbers]: Keeps only numeric characters
  /// - [CleanBarCodeOption.alphaNumericAndAsciiCharOnly]: Keeps alphanumeric and ASCII characters
  /// - [CleanBarCodeOption.onlySymbolsAndAsciiChar]: Keeps symbols and ASCII characters
  ///
  /// Example:
  /// ```dart
  /// final cleaner = BarcodeCleaner();
  /// final result = cleaner.clean(
  ///   barcode: 'ABC123!@#',
  ///   cleanBarCodeOption: CleanBarCodeOption.onlyNumbers,
  /// ); // Returns '123'
  /// ```
  String clean({
    required String barcode,
    required CleanBarCodeOption cleanBarCodeOption,
  }) {
    if (cleanBarCodeOption == CleanBarCodeOption.none) return barcode;
    barcode = barcode.replaceAll(" ", "");
    final String regx = _getCleanTypeRegx(
      customCleanOption: cleanBarCodeOption,
    );
    final RegExp regExp = RegExp(regx, unicode: true);
    final Iterable<Match> matches = regExp.allMatches(barcode);
    return matches.map((m) => m.group(0)).join();
  }

  /// Returns the regular expression pattern based on the cleaning option.
  String _getCleanTypeRegx({required CleanBarCodeOption customCleanOption}) {
    switch (customCleanOption) {
      case CleanBarCodeOption.onlyNumbers:
        return r'\d+';
      case CleanBarCodeOption.alphaNumericAndAsciiCharOnly:
        return r'[a-zA-Z0-9\u0600-\u06FF]+';
      case CleanBarCodeOption.onlySymbolsAndAsciiChar:
        return r'[a-zA-Z\u0600-\u06FF!@#\$%^&*(),.?":{}|<>_\-+=/\\]+';
      default:
        return r'\d+';
    }
  }

  /// Performs custom cleaning based on the specified cleaning option.
  ///
  /// The [customCleanOption] parameter provides more specific cleaning options:
  /// - [CustomCleanOption.onlyNumbers]: Keeps only numeric characters
  /// - [CustomCleanOption.enCharSmallAndBig]: Keeps English characters (both cases)
  /// - [CustomCleanOption.enCharSmallAndBigPlusNumbers]: Keeps English characters and numbers
  /// - [CustomCleanOption.enCharBig]: Keeps only uppercase English characters
  /// - [CustomCleanOption.enCharBigPlusNumbers]: Keeps uppercase English characters and numbers
  /// - [CustomCleanOption.enCharSmall]: Keeps only lowercase English characters
  /// - [CustomCleanOption.enCharSmallPlusNumbers]: Keeps lowercase English characters and numbers
  /// - [CustomCleanOption.arChar]: Keeps only Arabic characters
  /// - [CustomCleanOption.arCharPlusNumbers]: Keeps Arabic characters and numbers
  /// - [CustomCleanOption.arCharAndEnCharBigAndSmall]: Keeps Arabic and English characters
  /// - [CustomCleanOption.arCharAndEnCharBigAndSmallPlusNumbers]: Keeps Arabic, English characters, and numbers
  ///
  /// Example:
  /// ```dart
  /// final cleaner = BarcodeCleaner();
  /// final result = cleaner.customClean(
  ///   barcode: 'ABC123!@#',
  ///   customCleanOption: CustomCleanOption.enCharSmallAndBigPlusNumbers,
  /// ); // Returns 'ABC123'
  /// ```
  String customClean({
    required CustomCleanOption customCleanOption,
    required String barcode,
  }) {
    barcode = barcode.replaceAll(" ", "");
    final String regx = _getCustomCleanTypeRegx(
      customCleanOption: customCleanOption,
    );
    final RegExp regExp = RegExp(regx, unicode: true);
    final Iterable<Match> matches = regExp.allMatches(barcode);
    return matches.map((m) => m.group(0)).join();
  }

  /// Returns the regular expression pattern based on the custom cleaning option.
  String _getCustomCleanTypeRegx({
    required CustomCleanOption customCleanOption,
  }) {
    switch (customCleanOption) {
      case CustomCleanOption.onlyNumbers:
        return r'[0-9]+';
      case CustomCleanOption.enCharSmallAndBig:
        return r'[a-zA-Z]+';
      case CustomCleanOption.enCharSmallAndBigPlusNumbers:
        return r'[a-zA-Z0-9]+';
      case CustomCleanOption.enCharBig:
        return r'[A-Z]+';
      case CustomCleanOption.enCharBigPlusNumbers:
        return r'[A-Z0-9]+';
      case CustomCleanOption.enCharSmall:
        return r'[a-z]+';
      case CustomCleanOption.enCharSmallPlusNumbers:
        return r'[a-z0-9]+';
      case CustomCleanOption.arChar:
        return r'[\u0600-\u06FF]+';
      case CustomCleanOption.arCharPlusNumbers:
        return r'[0-9\u0600-\u06FF]+';
      case CustomCleanOption.arCharAndEnCharBigAndSmall:
        return r'[a-zA-Z\u0600-\u06FF]+';
      case CustomCleanOption.arCharAndEnCharBigAndSmallPlusNumbers:
        return r'[a-zA-Z0-9\u0600-\u06FF]+';
    }
  }
}

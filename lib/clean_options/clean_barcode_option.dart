/// Enum representing basic barcode cleaning options.
///
/// These options provide basic cleaning functionality for barcodes:
/// - [none]: No cleaning is performed
/// - [onlyNumbers]: Keeps only numeric characters
/// - [alphaNumericAndAsciiCharOnly]: Keeps alphanumeric and ASCII characters
/// - [onlySymbolsAndAsciiChar]: Keeps symbols and ASCII characters
enum CleanBarCodeOption {
  /// No cleaning is performed
  none,

  /// Keeps only numeric characters
  onlyNumbers,

  /// Keeps alphanumeric and ASCII characters
  alphaNumericAndAsciiCharOnly,

  /// Keeps symbols and ASCII characters
  onlySymbolsAndAsciiChar,
}

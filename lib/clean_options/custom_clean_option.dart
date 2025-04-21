/// Enum representing custom barcode cleaning options.
///
/// These options provide more specific cleaning functionality for barcodes:
/// - [onlyNumbers]: Keeps only numeric characters
/// - [enCharSmallAndBig]: Keeps English characters (both cases)
/// - [enCharSmallAndBigPlusNumbers]: Keeps English characters and numbers
/// - [enCharBig]: Keeps only uppercase English characters
/// - [enCharBigPlusNumbers]: Keeps uppercase English characters and numbers
/// - [enCharSmall]: Keeps only lowercase English characters
/// - [enCharSmallPlusNumbers]: Keeps lowercase English characters and numbers
/// - [arChar]: Keeps only Arabic characters
/// - [arCharPlusNumbers]: Keeps Arabic characters and numbers
/// - [arCharAndEnCharBigAndSmall]: Keeps Arabic and English characters
/// - [arCharAndEnCharBigAndSmallPlusNumbers]: Keeps Arabic, English characters, and numbers
enum CustomCleanOption {
  /// Keeps only numeric characters
  onlyNumbers,

  /// Keeps English characters (both cases)
  enCharSmallAndBig,

  /// Keeps English characters and numbers
  enCharSmallAndBigPlusNumbers,

  /// Keeps only uppercase English characters
  enCharBig,

  /// Keeps uppercase English characters and numbers
  enCharBigPlusNumbers,

  /// Keeps only lowercase English characters
  enCharSmall,

  /// Keeps lowercase English characters and numbers
  enCharSmallPlusNumbers,

  /// Keeps only Arabic characters
  arChar,

  /// Keeps Arabic characters and numbers
  arCharPlusNumbers,

  /// Keeps Arabic and English characters
  arCharAndEnCharBigAndSmall,

  /// Keeps Arabic, English characters, and numbers
  arCharAndEnCharBigAndSmallPlusNumbers,
}

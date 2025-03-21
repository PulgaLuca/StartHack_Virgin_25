import 'package:encrypt/encrypt.dart';

class AESHelper {
  static final key = Key.fromUtf8('my32lengthsupersecretnooneknows!');
  static final iv = IV.allZerosOfLength(16); // Super safe IV lol

  /// Encrypt a string
  static String encrypt(String plainText) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  /// Decrypt a string
  static String decrypt(String encryptedText) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}

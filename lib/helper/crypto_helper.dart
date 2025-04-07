import 'package:ayan_healthcare/assets/styles/strings/app_constants.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:encrypt/encrypt.dart';


class CryptoHelper {
  static final _encrypter = Encrypter(
      AES(Key.fromUtf8(Keys.cryptoKey), mode: AESMode.cbc, padding: "PKCS7"));

  static final _iv = IV.allZerosOfLength(16);

  static String decryption(String value) {
    String finalValue = value.replaceAll(" ", "+").trim();
    try {
      return _encrypter.decrypt64(finalValue, iv: _iv);
    } catch (e, s) {
      Debug.log("Error::: $e , $s");
    }
    return "";
  }

  static String encryption(String value) {
    late Encrypted encrypted;
    try {
      encrypted = _encrypter.encrypt(value, iv: _iv);
    } catch (e) {
      Debug.log(e);
    }
    return encrypted.base64;
  }
}

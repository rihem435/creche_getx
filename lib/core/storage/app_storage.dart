import 'package:app/core/storage/storage.dart';

class AppStorage {
  static String keyName = "lastName";

  static String keyEmail = "email";
  static String keyId = "id";

  static saveId(String id) {
    SecureStorage.writeSecureData(key: keyId, value: id);
  }

  static String? readId() {
    String? id = SecureStorage.readSecureData(keyId);
    return id;
  }

  static saveName(String name) {
    SecureStorage.writeSecureData(key: keyName, value: name);
  }

  static String? readName() {
    String? name = SecureStorage.readSecureData(keyName);
    return name;
  }

  static saveEmail(String email) {
    SecureStorage.writeSecureData(key: keyEmail, value: email);
  }

  static String? readEmail() {
    return SecureStorage.readSecureData(keyEmail);
  }
}

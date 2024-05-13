const int SIZE_UPLOAD_IMAGE = 1024;
const int SIZE_UPLOAD_HIGH_QUALITY_IMAGE = 1024;

const int LIMIT = 20;

const int PLACEHOLDER_ITEM_LENGTH = 30;
const int LONG_TITLE_LENGTH = 10;
const int SHORT_TITLE_LENGTH = 5;

final String LONG_TITLE_PLACEHOLDER = List.generate(LONG_TITLE_LENGTH, (index) => index).join("").toString();

final String SHORT_TITLE_PLACEHOLDER = List.generate(SHORT_TITLE_LENGTH, (index) => index).join("").toString();

class AgoraChatConfig {
  static const String appKey = "611043294#1333146";
  static const String userId = "GVR2nwwDoRMiu9bnNUqvs4FepM23";
  static const String agoraToken =
      "007eJxTYDh76+CThctYAvedXmbse5eLfcb35V11Wdd5vT5vsr51bt1uBQZDQ1Njs2RzY8PUlDQTI4O0pESzZEPTZMtEyxTjxBSLpJL9jmkNgYwMGVGKLIwMrAyMQAjiqzAYGyaapJmkGOgaGqRZ6hoapqbpWhpZJOqmWSYamSUamKYamFgCAI2cKXE=";
}

class CollectionName {
  static const String USERS = "users";
}

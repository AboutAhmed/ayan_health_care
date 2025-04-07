class Utilities {
  static String getImageExtension(String imagePath) {
    // Split the path by the period (.) character
    List<String> parts = imagePath.split('.');

    // The last part after the split will be the extension
    String extension = parts.last;

    return extension.toLowerCase(); // Return the extension in lowercase
  }
}

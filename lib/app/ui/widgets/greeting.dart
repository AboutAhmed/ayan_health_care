class AppGreeting {
  static String showGreetings() {
    String greeting() {
      int timeNow = DateTime.now().hour;
      if (timeNow < 12) {
        return 'Good Morning';
      } else if ((timeNow >= 12) && (timeNow <= 16)) {
        return 'Good Afternoon';
      } else if ((timeNow > 16) && (timeNow <= 20)) {
        return 'Good Evening';
      } else {
        return 'Good Night';
      }
    }

    return greeting();
  }
}

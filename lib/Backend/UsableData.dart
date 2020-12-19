class UsableData {
  static String datetimeToString(DateTime timestamp) {
    String date = timestamp.day.toString() +
        ' ' +
        getMonthName(timestamp.month) +
        ', ' +
        timestamp.year.toString();
    return date;
  }

  static List<String> monthName = [
    'Not availabel',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static getMonthName(int n) {
    return monthName[n];
  }

  static String id;
  static getSetMillisecondsId() {
    UsableData.id = DateTime.now().millisecondsSinceEpoch.toString();
    return new DateTime.now().millisecondsSinceEpoch.toString();
  }

  static String timeToString(DateTime nowMil) {
    String uploaded = nowMil.day.toString() +
        ' ' +
        UsableData.getMonthName(nowMil.month) +
        ', ' +
        nowMil.year.toString();
    return uploaded;
  }
}

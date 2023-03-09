class DateFormatHelper {
  static String convertToDDMMAA(DateTime value) {
    var day = value.day.toString();
    if (day.length == 1) {
      day = "0" + day;
    }
    var month = value.month.toString();
    if (month.length == 1) {
      month = "0" + month;
    }
    var year = value.year.toString();
    return "$day/$month/$year";
  }
}

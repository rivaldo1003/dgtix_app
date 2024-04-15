import 'package:intl/intl.dart';

String dateTimeConvert(DateTime dateTime) {
  // Format tanggal dalam bahasa Indonesia
  String formattedDate =
      DateFormat('EEEE, dd MMMM yyyy', 'id').format(dateTime);

  // Format waktu
  String formattedTime = DateFormat('HH.mm').format(dateTime);

  // Gabungkan format tanggal dan waktu
  String result = '$formattedDate | $formattedTime';

  return result;
}

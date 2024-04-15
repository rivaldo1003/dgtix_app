import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

pw.Widget buildTicketContent() {
  return pw.Column(
    children: [
      pw.Text('Nama Acara: Diamond Conference IV 2024'),
      pw.Text('Tanggal: 8 April 2024'),
      pw.Text('Lokasi: Bukit Doa Immanuel'),
    ],
  );
}

Future<pw.Document> generateTicketPdf() async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(build: (pw.Context context) {
      return buildTicketContent();
    }),
  );
  return pdf;
}

void downloadTicketPdf() async {
  final pdf = await generateTicketPdf();
  final output = await getTemporaryDirectory();
  final file = File('${output.path}/ticket.pdf');
  await file.writeAsBytes(await pdf.save());
}

import 'dart:io';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../features/inspection/domain/inspection_result.dart';

class PdfBuilder {
  static Future<Uint8List> buildInspectionReport({
    required String inspectionId,
    required List<Map<String, String>> items,
    required List<File> photos,
    File? signature,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),
        build: (context) => [
          _header(inspectionId),
          pw.SizedBox(height: 16),
          _itemsTable(items),
          pw.SizedBox(height: 16),
          if (photos.isNotEmpty) _photosSection(photos),
          pw.SizedBox(height: 16),
          if (signature != null) _signatureSection(signature),
        ],
      ),
    );

    return pdf.save();
  }

  static pw.Widget _header(String id) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'DENETİM RAPORU',
          style: pw.TextStyle(
            fontSize: 22,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Text('Denetim ID: $id'),
        pw.Text('Tarih: ${DateTime.now()}'),
      ],
    );
  }

  static pw.Widget _itemsTable(List<Map<String, String>> items) {
    return pw.Table.fromTextArray(
      headers: ['Madde', 'Sonuç'],
      data: items.map((e) => [e['title'], e['result']]).toList(),
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      cellAlignment: pw.Alignment.centerLeft,
      headerDecoration:
      const pw.BoxDecoration(color: PdfColors.grey300),
    );
  }

  static pw.Widget _photosSection(List<File> photos) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Fotoğraf Kanıtlar',
          style: pw.TextStyle(
            fontSize: 16,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Wrap(
          spacing: 8,
          runSpacing: 8,
          children: photos
              .map(
                (f) => pw.Image(
              pw.MemoryImage(f.readAsBytesSync()),
              width: 150,
              height: 150,
              fit: pw.BoxFit.cover,
            ),
          )
              .toList(),
        ),
      ],
    );
  }

  static pw.Widget _signatureSection(File signature) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'İmza',
          style: pw.TextStyle(
            fontSize: 16,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Image(
          pw.MemoryImage(signature.readAsBytesSync()),
          width: 200,
          height: 100,
        ),
      ],
    );
  }
}

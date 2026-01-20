import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

import '../../../data/local/db/app_database.dart';
import '../../../data/local/db/database_provider.dart';
import '../../../pdf/pdf_builder.dart';

final pdfControllerProvider = Provider<PdfController>((ref) {
  final db = ref.watch(databaseProvider);
  return PdfController(db);
});

class PdfController {
  final AppDatabase db;
  PdfController(this.db);

  Future<void> generateAndPreview(String inspectionId) async {
    final itemsQuery = db.select(db.inspectionItems)
      ..where((t) => t.inspectionId.equals(inspectionId));
    final items = await itemsQuery.get();

    final photosQuery = db.select(db.photos)
      ..where((t) => t.inspectionId.equals(inspectionId));
    final photos = await photosQuery.get();

    final signatureQuery = db.select(db.signatures)
      ..where((t) => t.inspectionId.equals(inspectionId));
    final signature = await signatureQuery.getSingleOrNull();

    final pdfBytes = await PdfBuilder.buildInspectionReport(
      inspectionId: inspectionId,
      items: items
          .map((e) => {
        'title': e.title,
        'result': e.result,
      })
          .toList(),
      photos: photos.map((e) => File(e.filePath)).toList(),
      signature:
      signature == null ? null : File(signature.filePath),
    );

    final dir = await getApplicationDocumentsDirectory();
    final file =
    File(p.join(dir.path, 'denetim_$inspectionId.pdf'));

    await file.writeAsBytes(pdfBytes);

    await Printing.layoutPdf(
      onLayout: (_) => pdfBytes,
    );
  }
}

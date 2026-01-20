import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:signature/signature.dart';

import '../application/signature_controller.dart' as app;
import '../application/signature_providers.dart';

class SignaturePage extends ConsumerStatefulWidget {
  final String inspectionId;

  const SignaturePage({super.key, required this.inspectionId});

  @override
  ConsumerState<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends ConsumerState<SignaturePage> {
  late SignatureController pad;

  @override
  void initState() {
    super.initState();
    pad = SignatureController(
      penStrokeWidth: 3,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
  }

  @override
  void dispose() {
    pad.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (pad.isEmpty) return;

    final Uint8List? data = await pad.toPngBytes();
    if (data == null) return;

    await ref
        .read(app.signatureControllerProvider)
        .saveSignatureBytes(
      inspectionId: widget.inspectionId,
      bytes: data,
    );

    ref.invalidate(
      inspectionSignatureProvider(widget.inspectionId),
    );

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İmza'),
        actions: [IconButton(icon: const Icon(Icons.save), onPressed: _save)],
      ),
      body: Column(
        children: [
          Expanded(
            child: Signature(
              controller: pad,
              backgroundColor: Colors.grey.shade200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: pad.clear,
                  child: const Text('Temizle'),
                ),
                const Spacer(),
                FilledButton(onPressed: _save, child: const Text('Kaydet')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

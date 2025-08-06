import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerPage extends StatelessWidget {
  final String title;
  final String pdfUrl;

  const PDFViewerPage({Key? key, required this.title, required this.pdfUrl}) : super(key: key);

  Future<void> _downloadFile(BuildContext context) async {
    try {
      // Ask for storage permission
      if (await Permission.storage.request().isGranted) {
        // Get app directory
        Directory dir = await getApplicationDocumentsDirectory();
        String savePath = '${dir.path}/${title.replaceAll(" ", "_")}.pdf';

        // Download file
        Dio dio = Dio();
        await dio.download(pdfUrl, savePath);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File downloaded to: $savePath')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Storage permission denied')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        title: Text(
          title,
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: theme.colorScheme.onSurface,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.download,
              color: theme.colorScheme.primary,
            ),
            onPressed: () => _downloadFile(context),
          ),
        ],
      ),
      body: SfPdfViewer.network(
        pdfUrl,
        canShowPaginationDialog: true,
        canShowScrollHead: true,
        canShowScrollStatus: true,
        pageLayoutMode: PdfPageLayoutMode.continuous,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:login_page/notifications_api/post_notifications.dart';
import 'notification_model.dart';
import 'package:flutter/services.dart';

class NotificationInputScreen extends StatefulWidget {
  const NotificationInputScreen({super.key});

  @override
  State<NotificationInputScreen> createState() => _NotificationInputScreenState();
}

class _NotificationInputScreenState extends State<NotificationInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  String title = '';
  String message = '';
  String sender = '';
  String timing = '';
  DateTime? eventDate;

  bool isPosting = false;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: eventDate ?? DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != eventDate) {
      setState(() {
        eventDate = picked;
      });
    }
  }

  Future<void> _pasteFromClipboard() async {
    final clipboardData = await Clipboard.getData('text/plain');
    final pastedText = clipboardData?.text ?? '';

    if (pastedText.isNotEmpty) {
      _controller.text = pastedText;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pasted from clipboard')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Clipboard is empty')),
      );
    }
  }

  Future<void> _submitNotification() async {
    if (_formKey.currentState!.validate() && eventDate != null) {
      _formKey.currentState!.save();
      setState(() => isPosting = true);

      final notification = NotificationModel(
        title: title,
        message: message,
        sender: sender,
        timing: timing,
        //eventDate: DateFormat('yyyy-MM-dd').format(eventDate!),
        eventDate: eventDate!,
        id: 0,
        datePosted: 'now',
      );

      await postNotification(notification, "24ucs202@lnmiit.ac.in");

      setState(() => isPosting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Notification Posted Successfully")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white,), // or use Icons.close
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
            "Post Notification",
          style: GoogleFonts.poppins(
            fontSize: 30,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFF012636),
      ),
      backgroundColor: const Color(0xFF001219),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DefaultTextStyle(
                style: GoogleFonts.inter(),
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(labelText: "Title", labelStyle: TextStyle(color: Colors.white)),
                      onSaved: (value) => title = value!,
                      validator: (value) => value == null || value.isEmpty ? "Enter title" : null,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: _controller,
                            decoration: const InputDecoration(labelText: "Message", labelStyle: TextStyle(color: Colors.white), border: OutlineInputBorder()),
                            onSaved: (value) => message = value!,
                            validator: (value) => value == null || value.isEmpty ? "Enter message" : null,
                          ),
                        ),
                        IconButton(onPressed: _pasteFromClipboard, icon: Icon(Icons.paste), tooltip: 'Paste from Clipboard',)
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(labelText: "Sender", labelStyle: TextStyle(color: Colors.white)),
                      onSaved: (value) => sender = value!,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(labelText: "Timing", labelStyle: TextStyle(color: Colors.white)),
                      onSaved: (value) => timing = value ?? '',
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      title: Text(
                        eventDate != null
                            ? "Event Date: ${DateFormat('dd MMM yyyy').format(eventDate!)}"
                            : "Select Event Date",
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: const Icon(Icons.calendar_today, color: Colors.white),
                      onTap: _pickDate,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isPosting ? null : _submitNotification,
                      child: isPosting
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text("Post Notification", style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Colors.black
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

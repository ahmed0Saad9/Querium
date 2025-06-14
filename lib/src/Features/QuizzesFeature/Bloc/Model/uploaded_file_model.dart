class UploadedFile {
  final int id;
  final String fileName;
  final String fileUrl;
  final String status;
  final DateTime uploadedAt;

  UploadedFile({
    required this.id,
    required this.fileName,
    required this.fileUrl,
    required this.status,
    required this.uploadedAt,
  });

  factory UploadedFile.fromJson(Map<String, dynamic> json) {
    return UploadedFile(
      id: json['id'],
      fileName: json['fileName'],
      fileUrl: json['fileUrl'],
      status: json['status'],
      uploadedAt: DateTime.parse(json['uploadedAt']),
    );
  }
}

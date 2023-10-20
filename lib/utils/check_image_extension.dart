bool isSvgImage(String attachment) {
  final extension = attachment.split('.').last.toLowerCase();
  return extension == 'svg';
}

bool isImageAttachment(String attachment) {
  final imageExtensions = ['jpg', 'jpeg', 'png', 'gif'];
  final extension = attachment.split('.').last.toLowerCase();
  return imageExtensions.contains(extension);
}

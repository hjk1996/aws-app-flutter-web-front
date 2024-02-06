class DomainManager {
  static const String _apex = 'amazonphotoquery.site';
  static String get authDomain => 'https://auth.$_apex';
  static String get apiDomain => 'https://api.$_apex';
  static String get s3Domain =>
      'https://rapa-app-image-bucket.s3.amazonaws.com';
}

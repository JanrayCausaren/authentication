class Services {
  Services({String? host, int? port})
    : _host = host ?? 'localhost',
      _port = port ?? 8080;

  final String _host;
  final int _port;
}


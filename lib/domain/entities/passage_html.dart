import 'package:equatable/equatable.dart';

class PassageHtml extends Equatable {
  final String query;
  final String canonical;
  final List<List<int>> parsed;
  final List<Map<String, dynamic>> passageMeta;
  final List<String> messages;

  const PassageHtml({
    required this.query,
    required this.canonical,
    required this.parsed,
    required this.passageMeta,
    required this.messages,
  });

  @override
  List<Object?> get props => [
    query,
    canonical,
    parsed,
    passageMeta,
    messages,
  ];
}

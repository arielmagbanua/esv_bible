import 'dart:io';
import 'package:equatable/equatable.dart';

/// PassageAudio
///
/// The entity class for PassageAudio data response that
/// contains an audio file.
class PassageAudio extends Equatable {
  final String query;

  final File audio;

  PassageAudio({
    required this.query,
    required this.audio,
  });

  @override
  List<Object?> get props => [
        query,
        audio,
      ];
}

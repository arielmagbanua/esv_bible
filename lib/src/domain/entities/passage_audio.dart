import 'dart:io';
import 'package:equatable/equatable.dart';

/// PassageAudio
///
/// The entity class for PassageAudio data response that
/// contains an audio file.
class PassageAudio extends Equatable {
  /// The query term used.
  final String query;

  /// The audio file instance of the passage.
  final File audio;

  /// Constructor
  ///
  /// The [query] is the query term used.
  /// The [audio] is the audio file instance of the passage.
  PassageAudio({
    required this.query,
    required this.audio,
  });

  /// Retrieves all properties of this class.
  @override
  List<Object?> get props => [
        query,
        audio,
      ];
}

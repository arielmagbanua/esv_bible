import '../../domain/entities/passage_text.dart' as entity;

class PassageText extends entity.PassageText {
  const PassageText({
    required super.query,
    required super.canonical,
    required super.parsed,
    required super.passageMeta,
    required super.messages,
  });
}

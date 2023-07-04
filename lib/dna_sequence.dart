import 'dart:math';

class DNASequence {
  final String _sequence;

  DNASequence._(this._sequence);

  factory DNASequence.random(int length) {
    if (length <= 0) {
      throw ArgumentError('Tamanho da sequência deve ser maior que zero');
    }

    final random = Random();
    final sequence = StringBuffer();

    for (int i = 0; i < length; i++) {
      final nucleotide = _getRandomNucleotide(random);
      sequence.write(nucleotide);
    }

    return DNASequence._(sequence.toString());
  }

  String get sequence => _sequence;

  DNASequence get reversed => _createReversedSequence();

  DNASequence get complement => _createComplementSequence();

  int countNucleotide(String nucleotide) {
    if (!_isValidNucleotide(nucleotide)) {
      throw ArgumentError('Nucleotídeo inválido: $nucleotide');
    }

    return _countNucleotideOccurrences(nucleotide);
  }

  static String _getRandomNucleotide(Random random) {
    final nucleotides = ['A', 'T', 'C', 'G'];
    return nucleotides[random.nextInt(nucleotides.length)];
  }

  DNASequence _createReversedSequence() {
    final reversedSequence = StringBuffer();

    for (int i = _sequence.length - 1; i >= 0; i--) {
      final nucleotide = _sequence[i];
      reversedSequence.write(nucleotide);
    }

    return DNASequence._(reversedSequence.toString());
  }

  DNASequence _createComplementSequence() {
    final complementSequence = StringBuffer();

    for (int i = 0; i < _sequence.length; i++) {
      final nucleotide = _sequence[i];
      final complement = _getComplementNucleotide(nucleotide);
      complementSequence.write(complement);
    }

    return DNASequence._(complementSequence.toString());
  }

  String _getComplementNucleotide(String nucleotide) {
    switch (nucleotide) {
      case 'A':
        return 'T';
      case 'T':
        return 'A';
      case 'C':
        return 'G';
      case 'G':
        return 'C';
      default:
        throw ArgumentError('Nucleotídeo inválido: $nucleotide');
    }
  }

  bool _isValidNucleotide(String nucleotide) {
    final validNucleotides = ['A', 'T', 'C', 'G'];
    return validNucleotides.contains(nucleotide);
  }

  int _countNucleotideOccurrences(String nucleotide) {
    return _sequence.split(nucleotide).length - 1;
  }
}

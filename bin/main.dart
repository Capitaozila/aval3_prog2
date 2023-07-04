import 'package:aval3/dna_sequence.dart';

void main() {
  try {
    var tabs = '\t' * 5;
    print('${'-' * 21}SEQUENCIAS${'-' * 21}');
    final sequence = DNASequence.random(10);
    print('DNA:$tabs ${sequence.sequence}');

    tabs = '\t' * 4;
    final complementSequence = sequence.complement;
    print('Complemento:$tabs ${complementSequence.sequence}');

    final reversedSequence = sequence.reversed;
    print('Invertida:$tabs ${reversedSequence.sequence}');

    print('${'-' * 20}OCORRENCIAS${'-' * 21}');

    tabs = '\t' * 3;
    var nucleotide = 'A';
    var count = sequence.countNucleotide(nucleotide);
    print('Número de ocorrências de $nucleotide:$tabs $count');

    nucleotide = 'T';
    count = sequence.countNucleotide(nucleotide);
    print('Número de ocorrências de $nucleotide:$tabs $count');

    nucleotide = 'C';
    count = sequence.countNucleotide(nucleotide);
    print('Número de ocorrências de $nucleotide:$tabs $count');

    nucleotide = 'G';
    count = sequence.countNucleotide(nucleotide);
    print('Número de ocorrências de $nucleotide:$tabs $count');
    print('${'-' * 21}ERROS${'-' * 26}');

    nucleotide = 'H';
    count = sequence.countNucleotide(nucleotide);
    print('Número de ocorrências de $nucleotide:$tabs $count');
  } catch (e) {
    print('Erro: $e');
  }
}

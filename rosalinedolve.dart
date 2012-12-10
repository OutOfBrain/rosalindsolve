import 'dart:html';


class RosalindSolver {
  dna(String input) {
    // init counter
    var counter = {'A' : 0, 'C' : 0, 'G' : 0, 'T' : 0};

    for (var char in input.splitChars()) {
      if (counter.containsKey(char)) { // necessary since dart does not linke when element does not exist yet
        ++counter[char];
      }
    }

    // since Map.values is not stable or anything
    return '${counter["A"]} ${counter["C"]} ${counter["G"]} ${counter["T"]}';
  }

  rna(String input) {
    return '';
  }
}


void main() {
  // create solver
  RosalindSolver solver = new RosalindSolver();

  // get elements
  TextAreaElement input  = query('#input');
  TextAreaElement output = query('#output');

  SelectElement problem  = query('#problem');

  // register events
  input.on.input.add((event) {
    var solveMethod = null;

    // get the current problem
    switch (problem.value) {
      case 'dna': solveMethod = solver.dna; break;
      case 'rna': solveMethod = solver.rna; break;
    }

    if (solveMethod != null) {
      output.value = solveMethod(input.value);
    }
  });
}

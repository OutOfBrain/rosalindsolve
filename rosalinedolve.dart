import 'dart:html';


class RosalindSolver {
  dna(String input) {
    // init counter
    var counter = new Map();
    counter['A'] = 0;
    counter['C'] = 0;
    counter['G'] = 0;
    counter['T'] = 0;

    for (var char in input.splitChars()) {
      if (counter.containsKey(char)) { // necessary since dart does not linke if element does not exist yet
        counter[char]+=1;
      }
    }

    // since Map.values is not stable or anything
    return '${counter["A"]} ${counter["C"]} ${counter["G"]} ${counter["T"]}';
  }
}

void main() {
  // create solver
  RosalindSolver solver = new RosalindSolver();

  // get elements
  TextAreaElement input  = query('#input');
  TextAreaElement output = query('#output');

  // register events
  input.on.input.add((event) { output.value = solver.dna(input.value); });
}

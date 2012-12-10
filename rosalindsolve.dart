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
    return input.replaceAll('T', 'U');
  }


  revc(String input) {

    var reverse = (String input) {
      print('reverse');
      var charlist = new List();

      for (int i = input.length-1; i >= 0; --i) {
        charlist.addLast(input.charCodeAt(i));
      }

      return new String.fromCharCodes(charlist);
    };

    var complement = (String input) {
      print('complement');
      StringBuffer output = new StringBuffer();

      for (int i = 0; i < input.length; ++i) {
        String currentChar = input[i];

        switch (currentChar) {
          case 'A': currentChar = 'T'; break;
          case 'T': currentChar = 'A'; break;
          case 'C': currentChar = 'G'; break;
          case 'G': currentChar = 'C'; break;
        }

        output.add(currentChar);
      }

      return output.toString();
    };

    return reverse(complement(input));
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
      case 'dna':  solveMethod = solver.dna;  break;
      case 'rna':  solveMethod = solver.rna;  break;
      case 'revc': solveMethod = solver.revc; break;
    }

    if (solveMethod != null) {
      output.value = solveMethod(input.value);
    }
  });
}

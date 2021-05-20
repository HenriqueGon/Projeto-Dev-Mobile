import 'dart:io';

void main(List<String> arguments) {
  print('Digite um número: ');
  var num1 = int.parse(stdin.readLineSync()!);

  print('Digite outro número: ');
  var num2 = int.parse(stdin.readLineSync()!);

  if (num1 > num2) {
    print('O primeiro valor: $num1 é maior que o segundo valor: $num2');
  } else if (num1 < num2) {
    print('O segundo valor: $num2 é maior que o primeiro valor: $num1');
  } else {
    print('Os dois valores são iguais!');
  }

  print('Digite a quantidade de vezes que deseja checar se um número é par ou impar: ');
  var x = int.parse(stdin.readLineSync()!);

  for (var i = 0; i < x; i++) {
    print('Digite um número para ser checado: ');
    var n = int.parse(stdin.readLineSync()!);

    if (n % 2 == 0) {
      print('O número é par');
    } else {
      print('O número é impar');
    }
  }

}

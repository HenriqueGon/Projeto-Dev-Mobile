
import 'dart:io';

void main(List<String> arguments) {
  
  // Função anonima com objetivo de mostrar uma mensagem 
  mensagemOpcional(() => {
    print('Determinada msg')
  });

  // Função anonima com objetivo de mostrar uma mensagem
  // e utilizando o outro parametro para passar outra mensagem
  mensagemOpcional(() => {
    print('Determinada msg')
  }, msg: 'teste');

  somarComParametroSemRetorno(10, 20, () => {
    print(10 + 10)
  });
}

// Função com objetivo de somar dois número que vem por
// parametro e somar e printar eles.
void somarComParametroSemRetorno(int num1, int num2, Function funcao) {
  print('A soma dos dois valores é ${num1  + num2}');

  funcao();
}


// Função com objetivo de somar dois números que vem por 
// parametro e retornar o resultado da soma deles.
int somarComParametroComRetorno(int num1, int num2) {
  return num1 + num2;
}


// Função com objetivo de somar dois números que serão
// digitados dentro da função e printar o resultado.
void somarSemParametroSemRetorno() {
  print('Digite um número');
  var num1 = int.parse(stdin.readLineSync()!);

  print('Digite outro número');
  var num2 = int.parse(stdin.readLineSync()!);

  print('A soma dos dois valores é ${num1  + num2}');
}


// Função com objetivo de somar dois números
// sendo que o segundo valor caso não seja passado
// no parametro será 5 por padrão
void somarComOpcional({int num2 = 5}) {
  print(10 + num2);
}

// Função com objetivo de mostrar uma mensagem e caso
// não seja passado no parametro então é printado 
// "ocorreu um erro"
void mensagemOpcional(Function funcao, {String msg = 'Ocorreu um erro'}) {
  print(msg);
  funcao();
}

// Função com objetivo de multiplicar dois números
// sendo que o segundo valor caso não seja passado
// no parametro será 1 por padrão
void multiplicarOpcional({int num1 = 1}) {
  print(10 * num1);
}

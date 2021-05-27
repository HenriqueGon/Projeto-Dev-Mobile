import 'dart:io';

var qualquerCoisa = [];
void main(List<String> arguments) {

  int opcao;

  do {
    opcao = opcoes();

    if (opcao == 0) {
      return;
    }

    switch(opcao) {
      case 1: {
        adicionar();
      }
      break;

      case 2: {
        verTodos();
      }
      break;
      case 3: {
        remover();
      }
      break;
      default: {
        print('Opção Inválida');
      }
    }        
  } while(opcao != 0);

}

int opcoes() {
  print('(1) Adicionar um valor');
  print('(2) Ver todos os valores');
  print('(3) Remover um valor');
  print('(0) Sair');
  
  print('Escolha a opção');

  return int.parse(stdin.readLineSync()!);
}

void adicionar() {
  print('Digite qualquer coisa: ');
    dynamic algo = stdin.readLineSync()!;

    qualquerCoisa.add(algo);
}

void verTodos() {
  for (var a in qualquerCoisa) {
    print(a);
  }
}

void remover() {
  for (var i = 0; i < qualquerCoisa.length; i++) {
    print('Id: $i');
    print('Valor: ${qualquerCoisa[i]} \n');
  }

  print('Digite o id do valor que deseja remover: ');
  var id = int.parse(stdin.readLineSync()!);

  qualquerCoisa.removeAt(id);
}

Future main() async {
  await printMessagemProduto();
}

Future printMessagemProduto() async {
  print('Buscando produtos...');
  
  await buscarProdutos();
}

Future buscarProdutos() {
  return Future.delayed(Duration(seconds: 4), () => {
    print('Produtos buscados com sucesso!')}
  );
}


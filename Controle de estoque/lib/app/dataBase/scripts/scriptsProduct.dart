
final createTableProduct = '''
  CREATE TABLE produto (
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(50) NOT NULL
    ,descricao VARCHAR(255)
    ,quantidade INT NOT NULL
  );
''';

final insertProduct = '''
  INSERT INTO produto (nome, descricao, quantidade)
  VALUES ('Cadeira', '', 10)
''';

final insertProduct1 = '''
  INSERT INTO produto (nome, descricao, quantidade)
  VALUES ('Sófa', 'Sófa muito confortável', 12)
''';

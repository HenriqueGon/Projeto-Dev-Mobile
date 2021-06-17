
final createTableProduct = '''
  CREATE TABLE produto (
    id INT PRIMARY KEY
    ,descricao VARCHAR(255) NOT NULL
    ,quantidade INT NOT NULL
  );
''';

final insertProduct = '''
  INSERT INTO produto (descricao, quantidade)
  VALUES ('Cadeira', 10)
''';

final insertProduct1 = '''
  INSERT INTO produto (descricao, quantidade)
  VALUES ('Cadeira', 12)
''';

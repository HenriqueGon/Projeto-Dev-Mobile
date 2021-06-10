
final createTable = """
  CREATE TABLE produto (
    id INT NOT NULL PRIMARY KEY
    ,descricao VARCHAR(255) NOT NULL
    ,quantidade INT NOT NULL
  );
""";

final insert = """
  INSERT INTO produto (descricao, quantidade)
  VALUES ('Cadeira', 10)
""";
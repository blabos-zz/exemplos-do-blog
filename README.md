# Exemplos de código do blog

## Executando os exemplos

Partimos do pressuposto que você instalou e confugurou o seu ambiente de
desenvolvimento como descrito
[aqui](https://blog.blabos.org/posts/instalando-uma-versao-especifica-de-perl-com-o-plenv)
e [aqui](https://blog.blabos.org/posts/instalando-modulos-perl-com-cpanm-e-carton).

A menos que o exemplo tenha alguma instrução específica de cada exemplo,
entre no diretório do exemplo e execute o comando abaixo para instalar
as dependências:

```
user@host$ carton install
```

Seguido do comando semelhante ao abaixo para executar:

```
user@host$ carton exec -- perl ./exemplo-que-quero-executar.pl
```


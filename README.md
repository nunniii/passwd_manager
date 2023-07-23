# passwd_manager

**There is an older version written in go lang of this repository: [personal-access-tokens-guard](https://github.com/nunniii/personal-access-tokens-guard)**

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.png?v=103)](https://github.com/ellerbrock/open-source-badges/)
[![License](https://img.shields.io/github/license/nunniii/passwd_manager)](./LICENSE)

<hr>
🐫 📓 This is a new version of my personal password manager written in OCaml

**[creation progress](./progress.md)**

### How to use:

Este programa possui apenas a função de armazenar um token de forma não tão exposta quando apenas salvar, a criptografia usada é a de César, o deslocamento padrão no código é 78, basta apenas alterar todos os valores no arquivo [`main.ml`](./main.ml) caso queira, assim como a senha padrão, que é "0".

#### Como salvar um dado:

Você deve passar o argumento "new" precedido ao nome e token secreto:

```./main.exe new <nome> <token>```


#### Como visualizar:

Utilize o argumento "vie" precedido da senha padão que você optou em escolher:

```./main.exe vie <nome> <senha padrão>```

### To compile:

A compilação é simples pois optei por usar o dune, caso não tenha familiaridade, acesse o tutorial:

**Faça a instalação das ferramentas nescessárias:**
- [OCaml](https://ocaml.org/install)

- [how to use dune](https://ocaml.org/docs/up-and-running#starting-a-new-project)

**Para compilar basta usar o comando:**

```dune build```



## Contributing

Please, follow the steps of [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) to contribute.


<hr>
<p align="center">
made with ♥ by a student
<p/>

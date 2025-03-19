# GitHub

# Solucao
Nesse projeto foi utilizado a arquitetura MVVM pensando justamente na separacao da logica da vizualizacao e facilitacao na criacao dos testes unitarios. Foi utilizado o modelo de viewCode para criacao das telas, o projeto atualmente nao conta com nenhum pod ou dependencia, mas pode ser pensado em adicionar futuramente.
Alem do mais, o projeto utiliza de Design Patterns, boas praticas de programacao, codigo limpo, conceitos SOLID e gereciamento de memoria ARC.
Os testes unitarios implementados foram usados XCTest e a camada de rede foi utilizado URLSession.
O projeto conta com tratativas de Erros, Loading e Opcionais.

# LIBRARY

Não foi implementada nenhuma lib por enquanto.

# Arquitetura

MVVM(model-view-viewModel)

# ESCOLHAS

- Uso de view code ao inves de xib ou storyboard pela facil manuntencao de codigo e legibilidade.
- Uso do URLSession pelo fato de estar mais adpatado do que o alamofire.
- Uso XCTest pelo mesmo motivo de estar mais adpatado ao uso do que quick nimble.
- Uso da arquitetura MVVM pelo fato da arquitetura trazer uma estrutura de separacao de logica com view e ser uma arquitetura de facil entendimento e manuntencao, facilitando ate mesmo na criacao dos testes Unitarios.
- Uso de um projeto monolito e nao modular pelo fato de trazer velocidade no desenvolvimento e nao ser um projeto de larga escala.
- Uso do target 17.4


# requirements

![Xcode](https://img.shields.io/badge/Xcode-15.3%2B-blue)
![Swift](https://img.shields.io/badge/Swift-5.0%2B-orange)
![iOS](https://img.shields.io/badge/iOS-17.4%2B-lightgrey)

OBSERVAÇÕES: O projeto atualmente nao possui a implementacao do cocoapods e não é um projeto modular. Para rodar o projeto basta fazer o clone na pasta em que deseja, abrir a pasta Github-iOS, abrir o arquivo em azul Github-iOS.xcodeproj e buildar.

O projeto roda apenas em iPhone e Ipad.
O projeto roda apenas em portrait( ou seja, apenas na vertical)

# Movies (IOs Swift)
## Este repositório contém o desafio da Tokenlab

## Requisitos mínimos
* Mac OS 10.13+
* Xcode 9.3+
* Cocoapod 1.6.1
* Swift 4.1

## Testes 
Para executar os testes você pode utilizar o seguinte comando
 `xcodebuild test -project Movies.xcworkspace -scheme Movies -destination 'platform=iOS,name=Development iPod touch'`
 
## Executar no emulador

1. Para executar, faça o clone em seu computador.
2. Navegue até o diretório Movies `cd Movies`. 
3. Abra o terminal e execute `pod install` 
4. Com o xcode, abra o araquivo `Movies.xcworkspace`
5. Escolha o emulador e clique em Run


## Informações

* Projeto criado utilizando MVC
* Alamofire para fazer requisições REST
* Kingerfish para fazer cache das imagens 
* Material Components/MaterialCards para os cards das imagens
* Há três testes automatizados, por enquanto só..
* Voldemort é o nome do meu usuário (hehe) não se assustem...

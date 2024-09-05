# Tractian App

Teste prático para a TRACTIAN


### ✔️ Projeto
- Projeto desenvolvido com Flutter versão 3.24.1
- Gestão de Estado - [GetX](https://pub.dev/packages/get)
- Client HTTP - [Dio](https://pub.dev/packages/dio)
- Local Storage - [SharedPreferences](https://pub.dev/packages/shared_preferences)
- Imagens - [FlutterSVG](https://pub.dev/packages/flutter_svg)
---
<br />

### ✔️ Arquitetura
- Projeto Clean Code
- Projeto dividido em camadas do clean architecture
- **Camada Domain**
  - Definição das entidades da aplicação, casos de uso, repositorios e enums;
- **Camada Data**
  - Implementação da camada de domínio; definição dos data sources e cliente http;
- **Camada Infra**
  - Implementação dos data sources e cliente http definidos na camada de dados;
- **Camada Design System**
  - Implementação dos componentes de design system utilizados na aplicação: icones, buttons, cores, input e estilos de texto.
- **Camada Presentation**
  - Implementação das telas e widgets da aplicação;
- Translations para permitir múltiplos idiomas
  - Suporte adicionado para o idioma pt-BR;
---
<br />

### ✔️ Testes
- Testes unitário e widgets implementados na pasta **/test**
- Resultados:
  <img src="screenshots/test/test.png" width="300" height="150" title="hover text"> 
- Testes de integração implementados na pasta **/integration_test**
- Resultados:

<p align="center"> 
  <img src="screenshots/integration_test/menu.png" width="300" height="150" title="hover text"> 
  <img src="screenshots/integration_test/assets.png" width="300" height="150"  title="hover text"> 
</p>

- Cobertura de código em **70%** medido pelo Flutter Coverage
  <img src="screenshots/test/coverage.png" width="300" height="150"  title="hover text">

### 📡 API de dados
- API Rest utilizada para consultar dados do aplicativo
- Base Url: https://fake-api.tractian.com
- Endpoint para busca de empresas: GET https://fake-api.tractian.com/companies
- Endpoint para consulta da coleção de localizações de uma empresa: GET https://fake-api.tractian.com/companies/{{companyId}}/locations
- Endpoint para consulta da coleção de assets e componentes de uma empresa: GET https://fake-api.tractian.com/companies/{{companyId}}/assets
- Collections mapeada pelo Insomnia e adicionada na pasta **/api**
---
<br />

### ✔️ Performance
- Programação concorrente utilizando **isolates** do dart para criar threads independentes e poder manipular grande volume de dados sem perder a performace do aplicação.
- Aplicação API Cache utilizando o SharedPreferences para permitir **Offile First**, quando o usuário não possuir conexão com a internet.

---
<br />

### 🗺️ Telas do Aplicativo
A seguir algumas imagens do App
<p align="center"> 
  <img src="screenshots/splash.jpeg" width="30%" title="hover text"> 
  <img src="screenshots/menu.jpeg" width="30%" title="hover text"> 
</p>
<p align="center"> 
  <img src="screenshots/company_jaguar.jpeg" width="30%" title="hover text"> 
  <img src="screenshots/company_tobias.jpeg" width="30%" title="hover text"> 
  <img src="screenshots/company_apex.jpeg" width="30%" title="hover text"> 
</p>
<p align="center"> 
  <img src="screenshots/filter_search.jpeg" width="30%" title="hover text"> 
  <img src="screenshots/filter_alert.jpeg" width="30%" title="hover text"> 
  <img src="screenshots/filter_status_alert.jpeg" width="30%" title="hover text"> 
</p>

---
<br />

### 🔥 Executar Tractian App
- O App está disponível na raíz do projeto e pode ser baixado clicando no link: [tractian-app-release.apk](https://github.com/cassiomeira12/tractian/blob/master/tractian-app-release.apk)
- O App pode ser executado rodando os comandos do Flutter
  - **flutter pub get**
  - **flutter run**
---
<br />

<footer>
  <p style="float:right; width: 40%;"> Copyright © Cássio Meira Silva 
</p>
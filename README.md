# Tractian App

Practical test for TRACTIAN

### ✔️ Project
- Project developed with Flutter version 3.24.1
- State management - [GetX](https://pub.dev/packages/get)
- Client HTTP - [Dio](https://pub.dev/packages/dio)
- Local Storage - [SharedPreferences](https://pub.dev/packages/shared_preferences)
- Images - [FlutterSVG](https://pub.dev/packages/flutter_svg)
---
<br />

### ✔️ Architecture
- Project Clean Code
- Clean architecture layered design
- **Domain Layer**
  - Defining entities, use cases, repositories and enums;
- **Data Layer**
  - Implementation of the domain layer; definition of data sources and http client;
- **Infra Layer**
  - Implementation of data sources and http client defined in the data layer;
- **Presentation Layer**
  - Implementation of application screens and widgets;
- **Design System**
  - Implementation of the design system components used in the application: icons, buttons, colors, input and text styles.
- Translations to allow multiple languages
  - Added support for pt-BR language;
---
<br />

### ✔️ Flutter Tests
- Unit tests and widgets implemented in the folder **/test**

- Results:
<p align="left"> 
  <img src="screenshots/test/test.png" width="300" height="150" title="hover text"> 
</p>

- Integration tests implemented in the folder **/integration_test**
- Results:

<p align="left"> 
  <img src="screenshots/integration_test/menu.png" width="300" height="150" title="hover text"> 
  <img src="screenshots/integration_test/assets.png" width="300" height="150"  title="hover text"> 
</p>

- Code coverage at **70%** as measured by Flutter Coverage

<p align="left"> 
  <img src="screenshots/test/coverage.png" width="300" height="150"  title="hover text">
</p>


### 📡 API
- Rest API used to query application data
- Base Url: https://fake-api.tractian.com
- Endpoint for company search: GET https://fake-api.tractian.com/companies
- Endpoint for querying a company's location collection: GET https://fake-api.tractian.com/companies/{companyId}/locations
- Endpoint for querying a company's collection of assets and components: GET https://fake-api.tractian.com/companies/{companyId}/assets
>
- Collections mapped by Insomnia and added to the folder **/api**
---
<br />

### ✔️ Performance
- Concurrent programming using dart **isolates** to create independent threads and be able to manipulate large volumes of data without losing application performance.
- API Cache application using SharedPreferences to allow **Offline First**, when the user does not have an internet connection.

---
<br />

### 🗺️ Application Screens
Below are some images of the App
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

### 🔥 How to Run Tractian App
- The App is available at the root of the project and can be downloaded by clicking on the link: [tractian-app-release.apk](https://github.com/cassiomeira12/tractian/blob/master/tractian-app-release.apk)
- The App can be run by running Flutter commands
  - **flutter pub get**
  - **flutter run**
---
<br />

<footer>
  <p style="float:right; width: 40%;"> Copyright © Cássio Meira Silva 
</p>
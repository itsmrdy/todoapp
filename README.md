# todoapp

For this sample code I am using clean code architecture using BLOC (Business Logic Compononent) State Management. 
It is a domain driven architecture wherein the domain,services,presentation,application (BLOC)
are separated from each other. I also implemented dependency injection for me to easily catch dependecies or 
register dependencies I am going to use. 

The architecture also having a separated pubspec.yaml for each services for me to easily identify where 
the package belong. 


#HOW TO GET PACKAGES OF THE APP 
flutter pub get
flutter pub get modules/features/application
flutter pub get modules/features/service
flutter pub get modules/features/presentation
flutter pub get modules/features/domain

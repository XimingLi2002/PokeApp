# pokemon_app
Una app desarrollada por Ximing (Kiwuh).

## Utility flutter commands:
flutter pub run build_runner build - (RetroFit + SerializableJson)
flutter clean - ( Clear all packages )
flutter pub get - ( Get all packages )

## Folder structure [../lib/]
- enums: Here are all the enums, e.g.: AppColors, AppImages, etc...
- models: Here you will find all the models.
- pages: Here you will find all the navigation pages used by the app.
- providers: All providers of the app go here. The state architecture of the app uses a Provider Pattern through Riverpod.
    - controllers: Here you will find all the controllers. 
- routes: Here you will find all the routing paths related to the pages.
- services: Here you will find all the backend and local storage of the app.
- utils: Here you will find all the utilities used by the app, for example: the dialogs, the input validators, etc.
- widgets: Here will be all the reusable components for the construction of the design.
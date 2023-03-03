# bangla_handwritten_math_solver_flutter_app

A new Flutter project.

- model-train-machine-learning: https://github.com/sabikrahat/bangla_handwritten_math_solver

- back-end-django-server: https://github.com/sabikrahat/bangla_handwritten_math_solver_backend_server

- front-end-flutter-app: https://github.com/sabikrahat/bangla_handwritten_math_solver_flutter_app

# Server run:
    - real ip: ```103.113.227.244```
    - port: ```1000```
    - command: py manage.py runserver ```0.0.0.0:1000```

# Browser security disable
    - Go to flutter\bin\cache and remove a file named: flutter_tools.stamp
    - C:\src\flutter\bin\cache\flutter_tools.stamp
    - Go to flutter\packages\flutter_tools\lib\src\web and open the file chrome.dart.
    - C:\src\flutter\packages\flutter_tools\lib\src\web\chrome.dart
    - Find '--disable-extensions' remove and add next step
    - Add '--disable-web-security'
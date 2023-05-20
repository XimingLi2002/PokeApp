bool isValidEmail(String value) => RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
    .hasMatch(value);

bool isValidPassword(String value) =>
    RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$')
        .hasMatch(value);

bool isValidUsername(String value) =>
    RegExp(r'^(?!.*\.\.)(?!.*\.$)[^\W][\w.]{3,16}$').hasMatch(value);
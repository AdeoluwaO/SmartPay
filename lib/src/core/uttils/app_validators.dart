
/// A collection of common Appdators that can be reused
class AppValidators {
  //? regex to detech web urls
  //(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z]{2,}(\.[a-zA-Z]{2,})(\.[a-zA-Z]{2,})?\/[a-zA-Z0-9]{2,}|((https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z]{2,}(\.[a-zA-Z]{2,})(\.[a-zA-Z]{2,})?)|(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}(\.[a-zA-Z0-9]{2,})?
  //https?://\S+(?![)])|www\.\S+(?![)])
  static final RegExp webUrlsPattern = RegExp(
      r'(?<=\s|^)(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z]{2,}(\.[a-zA-Z]{2,})(\.[a-zA-Z]{2,})?\/[a-zA-Z0-9]{2,}|((https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z]{2,}(\.[a-zA-Z]{2,})(\.[a-zA-Z]{2,})?)|(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}(\.[a-zA-Z0-9]{2,})?',
      caseSensitive: false);

  static final emailPattern = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
    r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}"
    r"[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}"
    r"[a-zA-Z0-9])?)+$",
  );

  static Validator notEmpty() {
    return (String? value) {
      return (value?.isEmpty ?? true) ? "This field can not be empty." : null;
    };
  }

  static Validator confirmPass(String val1, String val2) {
    return (String? value) {
      if (val2 != val1) {
        return "Passwords do not match";
      } else {
        return null;
      }
    };
  }

  static Validator phone() {
    return (String? value) {
      final validPhoneNumber = RegExp(
          r'^(\+\d{1,3})[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{3}$|^[0-9]{11}$|^(\+\d{1,3})?[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$');

      return (validPhoneNumber.hasMatch(value!)) ? null : "Invalid phone.";
    };
  }

  static Validator date() {
    return (String? value) {
      if (value!.isEmpty) {
        return null;
      }
      if (value.length < 10) {
        return "Invalid date.";
      }
      return null;
    };
  }

  static Validator name() {
    return (String? value) {
      if (value!.isEmpty) {
        return "Field cannot be empty.";
      }
      if (!value.contains(" ")) {
        return "Seperate names with spaces";
      }
      return null;
    };
  }

  static Validator accountNumber() {
    return (String? value) {
      return (value!.length < 10) ? "Invalid account number." : null;
    };
  }

  static Validator minLength(int minLength) {
    return (String? value) {
      if ((value?.length ?? 0) < minLength) {
        return "Must contain a minimum of $minLength characters.";
      }
      return null;
    };
  }

  static bool isValid(String pin, String pin2) =>
      (pin.isNotEmpty && pin2.isNotEmpty && pin == pin2);
  static Validator matchPattern(Pattern pattern, [String? patternName]) {
    return (String? value) {
      if (value == null || (pattern.allMatches(value).isEmpty)) {
        return "Please enter a valid ${patternName ?? "value"}.";
      }
      return null;
    };
  }

  static Validator email() {
    return matchPattern(emailPattern, "email");
  }

 ///
  /// The provided Appvalidators are applied in the order in which
  /// they're specified in the list.
  static Validator multiple(
    List<Validator> validators, {
    bool shouldTrim = true,
  }) {
    return (String? value) {
      value = shouldTrim ? value?.trim() : value;
      for (Validator validator in validators) {
        if (validator(value) != null) {
          return validator(value);
        }
      }
      return null;
    };
  }
}

typedef Validator = String? Function(String? value);
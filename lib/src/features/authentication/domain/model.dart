class LoginParams {
    LoginParams({
        required this.email,
        required this.password,
        required this.deviceName,
    });

    final String? email;
    final String? password;
    final String? deviceName;

    LoginParams copyWith({
        String? email,
        String? password,
        String? deviceName,
    }) {
        return LoginParams(
            email: email ?? this.email,
            password: password ?? this.password,
            deviceName: deviceName ?? this.deviceName,
        );
    }

    factory LoginParams.fromJson(Map<String, dynamic> json){ 
        return LoginParams(
            email: json["email"],
            password: json["password"],
            deviceName: json["device_name"],
        );
    }

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "device_name": deviceName,
    };

}


class LoginResponse {
  LoginResponse({
    this.user,
    this.token,
  });

  final User? user;
  final String? token;

  LoginResponse copyWith({
    User? user,
    String? token,
  }) {
    return LoginResponse(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  User({
    this.id,
    this.fullName,
    this.username,
    this.email,
    this.phone,
    this.phoneCountry,
    this.country,
    this.avatar,
  });

  final String? id;
  final String? fullName;
  final String? username;
  final String? email;
  final dynamic phone;
  final dynamic phoneCountry;
  final String? country;
  final dynamic avatar;

  User copyWith({
    String? id,
    String? fullName,
    String? username,
    String? email,
    dynamic? phone,
    dynamic? phoneCountry,
    String? country,
    dynamic? avatar,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      phoneCountry: phoneCountry ?? this.phoneCountry,
      country: country ?? this.country,
      avatar: avatar ?? this.avatar,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      fullName: json["full_name"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      phoneCountry: json["phone_country"],
      country: json["country"],
      avatar: json["avatar"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "username": username,
        "email": email,
        "phone": phone,
        "phone_country": phoneCountry,
        "country": country,
        "avatar": avatar,
      };
}

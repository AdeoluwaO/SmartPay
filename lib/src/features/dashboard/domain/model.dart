class HomePageData {
  HomePageData({
    this.secret,
  });

  final String? secret;

  HomePageData copyWith({
    String? secret,
  }) {
    return HomePageData(
      secret: secret ?? this.secret,
    );
  }

  factory HomePageData.fromJson(Map<String, dynamic> json) {
    return HomePageData(
      secret: json["secret"],
    );
  }

  Map<String, dynamic> toJson() => {
        "secret": secret,
      };
}

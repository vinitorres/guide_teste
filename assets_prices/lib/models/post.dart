class Post {
  Post({
    required this.timezone,
    required this.start,
    required this.end,
    required this.gmtoffset,
  });

  String timezone;
  int start;
  int end;
  int gmtoffset;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        timezone: json["timezone"],
        start: json["start"],
        end: json["end"],
        gmtoffset: json["gmtoffset"],
      );
}
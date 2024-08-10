class Post {
  final String title;
  final double donationAmount;
  final String deadline;
  final String description;
  final String postedBy;
  final String location;
  final String imageUrl;
  final double totalAmount;
  bool volunteerStatus;
  bool donationStatus;

  Post({
    required this.title,
    required this.donationAmount,
    required this.totalAmount,
    required this.deadline,
    required this.description,
    required this.imageUrl,
    required this.postedBy,
    required this.location,
    this.volunteerStatus = false,
    this.donationStatus = false,
  });
}

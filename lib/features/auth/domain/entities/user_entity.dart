class UserEntity {
  final String id;
  final String? name;
  final String email;
  final String? photoUrl;

  const UserEntity({
    required this.id,
    required this.email,
    this.name,
    this.photoUrl,
  });
}

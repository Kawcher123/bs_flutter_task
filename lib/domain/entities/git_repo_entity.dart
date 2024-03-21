
class GitRepoEntity{
  int id;
  String name;
  String ownerName;
  String? ownerPhoto;
  int starCount;
  String? description;
  String updatedAt;

   GitRepoEntity(
      {required this.id,
      required this.name,
      required this.ownerName,
      this.ownerPhoto,
      required this.starCount,
      this.description,
      required this.updatedAt});






}

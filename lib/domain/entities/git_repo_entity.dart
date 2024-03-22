
class GitRepoEntity{
  int id;
  String name;
  String ownerName;
  String? ownerPhoto;
  int starCount;
  String? description;
  String? url;
  String? ownerGit;
  String updatedAt;

   GitRepoEntity(
      {required this.id,
      required this.name,
      required this.ownerName,
      this.ownerPhoto,
      required this.starCount,
      this.description,
        this.url,
        this.ownerGit,
      required this.updatedAt});






}

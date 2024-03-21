
import 'package:equatable/equatable.dart';

class GitRepoEntity extends Equatable{
 final int id;
 final String name;
 final String ownerName;
 final String? ownerPhoto;
 final int starCount;
 final String? description;
 final String updatedAt;

  const GitRepoEntity(
      {required this.id,
      required this.name,
      required this.ownerName,
      this.ownerPhoto,
      required this.starCount,
      this.description,
      required this.updatedAt});

  @override
  // TODO: implement props
  List<Object?> get props => [id];




}

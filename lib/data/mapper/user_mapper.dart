import 'package:wajve_coding_challenge/data/mapper/gender_mapper.dart' as gender_mapper;
import 'package:wajve_coding_challenge/data/mapper/status_mapper.dart' as status_mapper;
import 'package:wajve_coding_challenge/data/network/dto/user.dart' as network;
import 'package:wajve_coding_challenge/domain/model/user.dart' as domain;

domain.User map(network.User dto) {
  return domain.User(
    dto.id,
    dto.name,
    dto.email,
    gender_mapper.map(dto.gender),
    status_mapper.map(dto.status),
  );
}

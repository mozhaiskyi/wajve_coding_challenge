import 'package:wajve_coding_challenge/data/network/dto/user.dart' as network;
import 'package:wajve_coding_challenge/domain/model/user.dart' as domain;

domain.Gender map(network.Gender dto) {
  switch (dto) {
    case network.Gender.male: return domain.Gender.male;
    case network.Gender.female: return domain.Gender.female;
    case network.Gender.unknown: return domain.Gender.unknown;
  }
}

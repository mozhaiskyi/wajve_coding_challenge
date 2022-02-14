import 'package:wajve_coding_challenge/data/network/dto/user.dart' as network;
import 'package:wajve_coding_challenge/domain/model/user.dart' as domain;

domain.Status map(network.Status dto) {
  switch (dto) {
    case network.Status.active: return domain.Status.active;
    case network.Status.inactive: return domain.Status.inactive;
    case network.Status.unknown: return domain.Status.unknown;
  }
}

import 'package:teq_flutter_core/teq_flutter_core.dart';

class SearchEvent extends BaseEvent {
  final String search;
  SearchEvent({this.search = ''});
}

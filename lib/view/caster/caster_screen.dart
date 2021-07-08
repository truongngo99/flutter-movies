import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/view/caster/caster_bloc.dart';
import 'package:flutter_movies/view/caster/caster_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class CasterScreen extends StatefulWidget {
  const CasterScreen({Key? key}) : super(key: key);

  @override
  _CasterScreenState createState() => _CasterScreenState();
}

class _CasterScreenState extends BaseBlocState<CasterScreen> {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => bloc as CasterBloc),
      ], child: BaseBlocBuilder<CasterState>(bloc as CasterBloc, _buildBody));

  @override
  BaseBloc createBloc() => CasterBloc();

  Widget _buildBody(BuildContext context, CasterState state) {
    return BlocBuilder<CasterBloc, CasterState>(
        builder: (context, CasterState state) {
      if (state is CasterStateSuccess) {
        return Scaffold(
          body: Image.network(
              'https://image.tmdb.org/t/p/original${state.personCaster!.profile_path}'),
        );
      }
      return Center(child: CircularProgressIndicator());
    });
  }
}

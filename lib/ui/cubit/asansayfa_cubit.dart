import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repostory.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit():super(<Kisiler>[]);

  var krepo = KisilerDaoRepostory();

  Future<void>KisileriYukle() async{
    var list = await krepo.KisileriYukle();
    emit(list);
  }

  Future<void>ara(String aramaKelimesi) async{
    var liste = await krepo.ara(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int kisi_id) async{
    await krepo.sil(kisi_id);
    await KisileriYukle();
  }
}
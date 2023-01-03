import 'package:mvvm_flutter_example/data/network/network_service.dart';
import 'package:mvvm_flutter_example/model/PicSumModel.dart';

class ListPicturesViewModel{
  List<PicturesViewModel>? pictures;
  Future<void> fetchPictures() async{
    final apiResult = await NetworkService().fetchPicturesAPI();
    this.pictures = apiResult.map((e) => PicturesViewModel(e)).toList();
  }

}

class PicturesViewModel {
  final PicSumModel? picSumModel;
  PicturesViewModel(this.picSumModel);
}
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mvvm_flutter_example/view_model/list_pictures_viewmodel.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListPicturesViewModel listPicturesViewModel = new ListPicturesViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM Flutter Demo'),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: List.generate(
                  30,
                  (index) => Container(
                    margin: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 2.0)),
                    child: Column(
                      children: [
                        FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: listPicturesViewModel
                              .pictures![index].picSumModel!.downloadUrl
                              .toString(),
                          fit: BoxFit.fitWidth,
                        ),
                        Text(
                          listPicturesViewModel
                              .pictures![index].picSumModel!.author
                              .toString(),
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
        future: listPicturesViewModel.fetchPictures(),
      ),
    );
  }
}

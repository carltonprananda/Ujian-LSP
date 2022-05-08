part of 'views.dart';

class ViewDataKoleksi extends StatefulWidget {
  ViewDataKoleksi({Key key}) : super(key: key);

  @override
  State<ViewDataKoleksi> createState() => _ViewDataKoleksiState();
}

class _ViewDataKoleksiState extends State<ViewDataKoleksi> {
  List dataKoleksi = [];

  void getdatakoleksi() {
    DKolReadData().getdatakoleksi().then((value) {
      setState(() {
        dataKoleksi = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getdatakoleksi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Koleksi Buku Perpus"),
      ),
      body: RefreshIndicator(
        onRefresh: (){getdatakoleksi;},
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
              child: dataKoleksi == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: dataKoleksi.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(dataKoleksi[i]['judulbuku']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(dataKoleksi[i]['descbuku']),
                            Text('Penulis Buku : ' + dataKoleksi[i]['penulisbuku']),
                            Text('Penerbit Buku : ' + dataKoleksi[i]['penerbitbuku']),
                            Text('Penerbit Buku : ' + dataKoleksi[i]['tahunbuku']),
                            Text('Kategori : '  + dataKoleksi[i]['namakategori']),
                          ]),
                        );
                      },
                    )),
        ),
      ),
    );
  }
  }
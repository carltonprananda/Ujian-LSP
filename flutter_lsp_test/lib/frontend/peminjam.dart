part of 'views.dart';

class ViewDataPeminjam extends StatefulWidget {
  ViewDataPeminjam({Key key}) : super(key: key);

  @override
  State<ViewDataPeminjam> createState() => _ViewDataPeminjamState();
}

class _ViewDataPeminjamState extends State<ViewDataPeminjam> {
  List dataPeminjam = [];

  void getdatapeminjam() {
    DPReadData().getdatapeminjam().then((value) {
      setState(() {
        dataPeminjam = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getdatapeminjam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Peminjam"),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            ElevatedButton(onPressed: null, child: Text("Tambah Peminjam")),
            SingleChildScrollView(
              child: Container(
                  height: 200,
                  child: dataPeminjam == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: dataPeminjam.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              title: Text(dataPeminjam[i]['namapeminjam']),
                              subtitle: Column(children: [
                                Text(dataPeminjam[i]['tanggalpeminjam']),
                                Text(dataPeminjam[i]['judulbuku']),
                                Text(dataPeminjam[i]['tanggalkembali']),
                              ]),
                            );
                          },
                        )),
            ),
          ],
        ),
      ),
    );
  }
}

class TambahKataPeninjam extends StatefulWidget {
  TambahKataPeninjam({Key key}) : super(key: key);

  @override
  State<TambahKataPeninjam> createState() => _TambahKataPeninjamState();
}

class _TambahKataPeninjamState extends State<TambahKataPeninjam> {
  final picker = ImagePicker();
  TextEditingController inputnama;
  TextEditingController inputdeskripsi;
  TextEditingController inputnomorbuku;
  TextEditingController tanggalpeminjaman;
  TextEditingController tanggalpengembalian;


  Future _pilihtanggal() async {
    DateTime pilih = await showDatePicker(
        context: context,
        initialDate: tanggalpinjam,
        firstDate: new DateTime(2006),
        lastDate: new DateTime(2025));
    if (pilih != null) {
      setState(() => tanggalpeminjaman = pilih as TextEditingController);
    }
  }

  static DateTime tanggalpinjam = DateTime.now();
  String formattanggal = DateFormat('yyyy-MM-dd - kk:mm:ss').format(tanggalpinjam);
  static DateTime deadlinepembalikan = tanggalpinjam.add(Duration(days: 7));
  String formattanggal2 =
      DateFormat('yyyy-MM-dd - kk:mm').format(deadlinepembalikan);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: inputnama,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nama Peminjam',
              ),
            ),
            TextFormField(
              controller: inputdeskripsi,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'nomor buku',
              ),
            ),
            TextFormField(
              initialValue: formattanggal,
              onTap: () {
                picker;
              },
              controller: tanggalpeminjaman,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Tanggal Peminjaman',
              ),
            ),
            Text("Tanggal Pinjam" + tanggalpinjam.toString()),
            Text("Batas Pengembalian Buku" + deadlinepembalikan.toString()),
            ButtonBar(
              children: [
                ElevatedButton(onPressed: (){
                  String namapeminjam = inputnama.text;
                  int nomorbuku = int.parse(inputnomorbuku.text);
                  
                }
                
                , child: Text("Submit")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

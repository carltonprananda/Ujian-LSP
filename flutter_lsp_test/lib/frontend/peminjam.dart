part of 'views.dart';

class ViewDataPeminjaman extends StatefulWidget {
  ViewDataPeminjaman({Key key}) : super(key: key);

  @override
  State<ViewDataPeminjaman> createState() => _ViewDataPeminjamanState();
}

class _ViewDataPeminjamanState extends State<ViewDataPeminjaman> {
  List dataPeminjam = [];

  void getdatapeminjam() {
    DPReadData().getdatapeminjam().then((value) {
      setState(() {
        dataPeminjam = value;
      });
    });
  }

  void hapusdatapeminjam(int index) {
    var url = "https://lspperpus.000webhostapp.com/deletedatapeminjam.php";
    http.post(Uri.parse(url), body: {'userid': dataPeminjam[index]['userid']});
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
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TambahKataPeninjam()),
                  );
                },
                child: Text("Tambah Peminjam")),
            SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: dataPeminjam == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                            itemCount: dataPeminjam.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Text(dataPeminjam[i]['namapeminjam']),
                                trailing: IconButton(
                                  onPressed: () {
                                    hapusdatapeminjam(i);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                                subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Tanggal Pinjam : " +
                                          dataPeminjam[i]['tanggalpeminjam']),
                                      Text("Buku : " +
                                          dataPeminjam[i]['judulbuku']),
                                      Text(
                                        "Deadline Pengembalian Buku : " +
                                            dataPeminjam[i]['tanggalkembali'],
                                      ),
                                    ]),
                              );
                            },
                          ),
                        )),
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
  TextEditingController inputnama = new TextEditingController();
  TextEditingController inputnomorbuku = new TextEditingController();
  TextEditingController tanggalpeminjaman;
  TextEditingController tanggalpengembalian;

  Future _pilihtanggal() async {
    DateTime pilih = await showDatePicker(
            context: context,
            initialDate: tanggalpinjam,
            firstDate: DateTime(2006),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        tanggalpinjam = value;
        deadlinepembalikan = value.add(Duration(days: 7));
      });
    });
  }

  void tambahdatapeminjam() {
    DPCreateData dpCreateData = DPCreateData();
    dpCreateData.namapeminjam = inputnama.text;
    dpCreateData.nomorbuku = int.parse(inputnomorbuku.text);
    dpCreateData.tanggalpinjam = formattanggal;
    dpCreateData.tanggalkembali = formattanggal2;
    print("test");
    DPReadData()
        .postdatapeminjam(dptojson(dpCreateData))
        .then((value) => print('success'));
  }

  static DateTime tanggalpinjam = DateTime.now();
  String formattanggal = DateFormat('yyyy-MM-dd').format(tanggalpinjam);
  static DateTime deadlinepembalikan = tanggalpinjam.add(Duration(days: 7));
  String formattanggal2 = DateFormat('yyyy-MM-dd').format(deadlinepembalikan);

  @override
  void initState() {
    super.initState();
  }

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
              controller: inputnomorbuku,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nomor buku',
              ),
            ),
            TextFormField(
              initialValue: formattanggal,
              onTap: () {
                _pilihtanggal();
              },
              controller: tanggalpeminjaman,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Tanggal Peminjaman',
              ),
            ),
            Text("Tanggal Pinjam : " + formattanggal),
            Text("Batas Pengembalian Buku: " + formattanggal2),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      tambahdatapeminjam();
                      Navigator.of(context).pop(MaterialPageRoute(builder: (_) {
                        return ViewDataPeminjaman();
                      }));
                    },
                    child: Text("Submit")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

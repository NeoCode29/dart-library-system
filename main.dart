import './perpustakaan.dart';
import "./buku.dart";

void main() {
  var perpus = Perpustakaan();

  perpus.menambahkanBuku(
      Buku(id: '1', judul: 'Pemrograman Dart', penulis: 'Alice'));
  perpus.menambahkanBuku(
      Buku(id: '2', judul: 'Flutter untuk Pemula', penulis: 'Bob'));
  perpus.menambahkanBuku(
      Buku(id: '3', judul: 'Menguasai Flutter', penulis: 'Charlie'));
  perpus
      .menambahkanBuku(Buku(id: '4', judul: 'Dart Lanjutan', penulis: 'Alice'));

  perpus.menampilkanListBuku();
}

import "./buku.dart";
import "./stack.dart";

class Perpustakaan {
  List<Buku> listBuku = [];
  Stack historyPeminjaman = Stack<Map>();

  Perpustakaan() {
    listBuku = [];
    historyPeminjaman = Stack<Map>();
  }

  void menambahkanBuku(Buku buku) {
    listBuku.add(buku);
    print("berhasil menambahkan buku ${buku.judul}");
  }

  void menghapusBuku(Buku buku) {
    listBuku.remove(buku);
    print("berhasil menghapus buku ${buku.judul}");
  }

  void menampilkanListBuku() {
    listBuku.sort((a, b) => a.judul.compareTo(b.judul));
    listBuku.forEach((buku) => {print(buku.toString())});
  }
}

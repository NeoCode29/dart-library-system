class Buku {
  String judul;
  String penulis;
  bool _dipinjam = false;

  Buku({required this.judul, required this.penulis});

  bool getDipinjam() {
    return _dipinjam;
  }

  // Method untuk mengembalikan buku
  void pinjam() {
    if (!_dipinjam) {
      _dipinjam = true;
    } else {
      print('Buku sudah dipinjam.');
    }
  }

  // Method untuk mengembalikan buku
  void kembalikan() {
    if (_dipinjam) {
      _dipinjam = false;
    } else {
      print('Buku tidak sedang dipinjam.');
    }
  }

  // Method toString()
  @override
  String toString() {
    return '- buku $judul oleh $penulis (${!getDipinjam() ? "tersedia" : "tidak tersedia"})';
  }
}

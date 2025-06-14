import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _reviews = [];

  String _nama = '';
  String _komentar = '';
  double _rating = 3.0;

  void _submitReview() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _reviews.insert(0, {
          'nama': _nama,
          'komentar': _komentar,
          'rating': _rating,
          'tanggal': DateTime.now().toString().split(' ')[0],
        });
      });
      _formKey.currentState!.reset();
      _rating = 3.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulasan Pengguna'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 📝 Form Ulasan
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tinggalkan Ulasan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Nama',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Nama wajib diisi' : null,
                          onSaved: (value) => _nama = value!,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Komentar',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          validator: (value) =>
                              value!.isEmpty ? 'Komentar wajib diisi' : null,
                          onSaved: (value) => _komentar = value!,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Text('Rating:'),
                            Expanded(
                              child: Slider(
                                value: _rating,
                                min: 1,
                                max: 5,
                                divisions: 4,
                                label: _rating.toString(),
                                activeColor: Colors.amber,
                                onChanged: (value) {
                                  setState(() {
                                    _rating = value;
                                  });
                                },
                              ),
                            ),
                            Text('${_rating.toStringAsFixed(1)} ⭐'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: _submitReview,
                            icon: const Icon(Icons.send),
                            label: const Text('Kirim Ulasan'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 📄 Daftar Ulasan
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Daftar Ulasan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              _reviews.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Belum ada ulasan.'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _reviews.length,
                      itemBuilder: (context, index) {
                        final review = _reviews[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          elevation: 3,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.teal,
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              '${review['nama']} • ⭐ ${review['rating']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(review['komentar']),
                                const SizedBox(height: 4),
                                Text(
                                  review['tanggal'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

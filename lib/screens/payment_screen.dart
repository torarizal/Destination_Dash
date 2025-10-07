import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';


class PaymentScreen extends StatefulWidget {
  final String? imageUrl;
  final String? name;
  final int? price;

  const PaymentScreen({
    super.key,
    this.imageUrl,
    this.name,
    this.price,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

enum PaymentMethod { qris, gopay, dana }

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod? _selectedMethod;
  bool _isLoading = false;
  int _ticketCount = 1;

  // Tambahkan controller dan error state untuk email
  final TextEditingController _emailController = TextEditingController();
  String? _emailError;

  void _showNotification(String title, String message, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSuccess ? Colors.green.shade100 : Colors.red.shade100,
                shape: BoxShape.circle,
              ),
              child: FaIcon(
                isSuccess ? FontAwesomeIcons.check : FontAwesomeIcons.times,
                color: isSuccess ? Colors.green.shade800 : Colors.red.shade800,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                  Text(message, style: const TextStyle(color: Colors.black87)),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }

  void _processPayment() async {
    // Validasi email
    final email = _emailController.text.trim();
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    setState(() {
      if (email.isEmpty) {
        _emailError = 'Email tidak boleh kosong';
      } else if (!emailRegex.hasMatch(email)) {
        _emailError = 'Format email tidak valid';
      } else {
        _emailError = null;
      }
    });
    if (_emailError != null) return;

    if (_selectedMethod == null) {
      _showNotification('Gagal!', 'Silakan pilih metode pembayaran terlebih dahulu.', false);
      return;
    }

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 1500));
    _showNotification('Pembayaran Berhasil!', 'Pembayaran dengan ${_selectedMethod!.name.toUpperCase()} sedang diproses.', true);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 1024;

    return Scaffold(
      // Tambahkan AppBar transparan dengan tombol kembali
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          tooltip: 'Kembali',
        ),
      ),
      body: SelectableRegion(
        focusNode: FocusNode(),
        selectionControls: materialTextSelectionControls,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: isLargeScreen
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 5, child: _buildPaymentDetails(isLargeScreen)),
                          Expanded(flex: 4, child: _buildOrderSummary(isLargeScreen)),
                        ],
                      )
                    : Column(
                        children: [
                          _buildOrderSummary(isLargeScreen),
                          _buildPaymentDetails(isLargeScreen),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary(bool isLargeScreen) {
    final String imageUrl = widget.imageUrl ??
        'https://placehold.co/80x80/eef2ff/4f46e5?text=Pro';
    final String name = widget.name ?? 'Paket Premium';
    final int price = widget.price ?? 1200000;

    // Hitung total berdasarkan jumlah tiket
    final int subtotal = price * _ticketCount;
    final int pajak = (subtotal * 0.11).round();
    const int biayaLayanan = 5000;
    final int total = subtotal + pajak + biayaLayanan;

    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: isLargeScreen
            ? const BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ringkasan Pesanan',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  width: 80,
                  height: 80,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 80,
                    color: const Color(0xFFEEF2FF),
                    child: const Center(
                        child: FaIcon(FontAwesomeIcons.image, color: Color(0xFF4F46E5))),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
                    Text('Pesanan Wisata', style: TextStyle(color: Colors.grey.shade400)),
                  ],
                ),
              ),
              Text(
                'Rp${subtotal.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Tambahkan fitur jumlah tiket
          Row(
            children: [
              const Text('Jumlah Tiket:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.white),
                      onPressed: _ticketCount > 1
                          ? () => setState(() => _ticketCount--)
                          : null,
                    ),
                    Text(
                      '$_ticketCount',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () => setState(() => _ticketCount++),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Color(0xFF334155), height: 60),
          DetailRow(
            label: 'Subtotal',
            value: 'Rp${subtotal.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}',
          ),
          const SizedBox(height: 16),
          DetailRow(
            label: 'Pajak (11%)',
            value: 'Rp${pajak.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}',
          ),
          const SizedBox(height: 16),
          const DetailRow(label: 'Biaya Layanan', value: 'Rp5.000'),
          const Divider(color: Color(0xFF334155), height: 60),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                Text(
                  'Rp${total.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: -1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Text(
              'Transaksi aman dengan enkripsi 256-bit SSL.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaymentDetails(bool isLargeScreen) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pembayaran Aman',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
          const SizedBox(height: 8),
          Text('Isi detail di bawah untuk menyelesaikan transaksimu.',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
          const SizedBox(height: 40),
          const Text('Alamat Email', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 8),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
              hintText: 'anda@email.com',
              filled: true,
              fillColor: const Color(0xFFF8FAFC),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)), borderSide: BorderSide(color: Color(0xFFE2E8F0))),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)), borderSide: BorderSide(color: Color(0xFFE2E8F0))),
              errorText: _emailError,
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (_) {
              if (_emailError != null) {
                setState(() => _emailError = null);
              }
            },
          ),
          const SizedBox(height: 24),
          const Text('Pilih Metode Pembayaran', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 16),
          PaymentMethodTile(
            method: PaymentMethod.qris,
            icon: FontAwesomeIcons.qrcode,
            label: 'QRIS',
            isSelected: _selectedMethod == PaymentMethod.qris,
            onTap: () => setState(() => _selectedMethod = PaymentMethod.qris),
          ),
          const SizedBox(height: 16),
          PaymentMethodTile(
            method: PaymentMethod.gopay,
            icon: FontAwesomeIcons.wallet,
            label: 'Gopay',
            isSelected: _selectedMethod == PaymentMethod.gopay,
            onTap: () => setState(() => _selectedMethod = PaymentMethod.gopay),
          ),
          const SizedBox(height: 16),
          PaymentMethodTile(
            method: PaymentMethod.dana,
            icon: FontAwesomeIcons.moneyBillWave,
            label: 'Dana',
            isSelected: _selectedMethod == PaymentMethod.dana,
            onTap: () => setState(() => _selectedMethod = PaymentMethod.dana),
          ),
          const SizedBox(height: 40),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _processPayment,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 5,
                shadowColor: Colors.indigo.withOpacity(0.4),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  alignment: Alignment.center,
                  child: _isLoading
                      ? const SizedBox(
                          width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(FontAwesomeIcons.shieldHalved, size: 18),
                            SizedBox(width: 12),
                            Text('Bayar Rp1.337.000',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                          ],
                        ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const DetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade400)),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final PaymentMethod method;
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.method,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFEEF2FF) : Colors.transparent,
            border: Border.all(
              color: isSelected ? const Color(0xFF4F46E5) : const Color(0xFFE2E8F0),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Center logo/icon in the box
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF4F46E5) : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center, // memastikan icon di tengah
                child: FaIcon(icon, color: isSelected ? Colors.white : const Color(0xFF374151), size: 28),
              ),
              const SizedBox(width: 16),
              Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
              const Spacer(),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                child: isSelected
                    ? const FaIcon(FontAwesomeIcons.solidCheckCircle, color: Color(0xFF4F46E5), key: ValueKey('check'))
                    : const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.grey, key: ValueKey('chevron')),
              )
            ],
          ),
        ),
      ),
    );
  }
}


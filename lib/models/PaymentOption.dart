import 'package:flutter/material.dart';


class PaymentOption {
  final String icon;
  final String bankName;




  PaymentOption({
    required this.icon,
    required this.bankName,


  });
}


List<PaymentOption> demoPayment = [
  PaymentOption(
      icon: 'assets/icons/iconshoppepay.svg',
      bankName: 'Ví ShopeePay'),
  PaymentOption(
      icon: 'assets/icons/iconnganhang.svg',
      bankName: 'Thẻ Tín dụng/Ghi nợ'),
  PaymentOption(
      icon: 'assets/icons/iconthanhtoansau.svg',
      bankName: 'Thanh toán khi nhận hàng'),
];


PaymentOption currentPayment = demoPayment[0];


void resetPayment() {
  currentPayment = demoPayment[0];
}

import 'package:pay/pay.dart';

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

// In your Widget build() method
GooglePayButton(
paymentConfigurationAsset: 'sample_payment_configuration.json',
paymentItems: _paymentItems,
style: GooglePayButtonStyle.black,
type: GooglePayButtonType.pay,
onPaymentResult: onGooglePayResult,
),


// In your Stateless Widget class or State
void onGooglePayResult(paymentResult) {
  // Send the resulting Google Pay token to your server or PSP
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_gold_dashboard/Features/auth/login/screen/login_screen.dart';
import 'package:my_gold_dashboard/Features/auth/otp/presentation/screen/otp_screen.dart';
import 'package:my_gold_dashboard/Features/banner/screen/banner_screen.dart';
import 'package:my_gold_dashboard/Features/home/screens/home_screen.dart';
import 'package:my_gold_dashboard/Features/merchant_management/merchant_details_screen/presentation/screens/merchant_detail_screen.dart';
import 'package:my_gold_dashboard/Features/order_management/screen/order_managment_screen.dart';
import 'package:my_gold_dashboard/Features/reports/presentation/screen/reports_screen.dart';
import 'package:my_gold_dashboard/Features/settings/screen/serrings_screen.dart';
import 'package:my_gold_dashboard/Features/sidebar/screen/sidebar_screen.dart';
import 'package:my_gold_dashboard/core/routes/routes.dart';

import '../../Features/complaints_management/presentation/screen/complaints_management_screen.dart';
import '../../Features/customer_managemen_details/presentation/customer_management_details.dart';
import '../../Features/customer_management/presentation/screen/customer_management.dart';
import '../../Features/customer_rating_review/presantation/screen/customer_rating_review.dart';
import '../../Features/customer_rating_review/presantation/screen/customer_rating_review_body.dart';
import '../../Features/delivery_personnel/presantation/screen/delivery_personnel_screen.dart';
import '../../Features/merchant_management/merchant_details_screen/presentation/model/mer_det_model.dart';
import '../../Features/merchant_management/merchant_details_screen/presentation/screens/merchant_detail_body.dart';

import '../../Features/merchant_management/presentation/screen/merchant_management_screen.dart';
import '../../Features/payment_management/presantation/screen/payment_management.dart';
import '../../Features/reports/presentation/cubit/reports_details_cubit.dart';
import '../../Features/reports/presentation/screen/detailed_report_screen.dart';
import '../../Features/returns_managment/presentation/screens/returns_management_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.login,
  // Routes.homeScreen,
  routes: [
    // Login route (outside of shell)
    GoRoute(
      name: "تسجيل الدخول",
      path: Routes.login,
      builder:
          (context, state) => const LoginScreen(), // You'll need to create this
    ),

    GoRoute(
      path: Routes.otp,
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>?;
        final phone = data?['phone'] as String? ?? '';
        return OtpScreen(phone: phone);
      },
    ),
    // Shell route with sidebar
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
          // NetworkWrapper(
          //   child:
          SideBarScreen(navigationShell: navigationShell),
      // ),
      branches: [
        // Dashboard branch
        StatefulShellBranch(
          initialLocation: Routes.homeScreen,
          routes: [
            GoRoute(
              name: "Dashboard",
              path: Routes.homeScreen,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),

        // Order Management branch
        StatefulShellBranch(
          initialLocation: Routes.orderManagement,
          routes: [
            GoRoute(
              name: "Order Management",
              path: Routes.orderManagement,
              builder:
                  (context, state) => const OrderManagmentScreen(),
            ),
            // Include original order routes
            GoRoute(
              name: "جميع الطلبات",
              path: Routes.allorders,
              builder: (context, state) => const Text("All Orders"),
            ),
            GoRoute(
              name: "طلبات قيد التنفيذ",
              path: Routes.pendingOrders,
              builder: (context, state) => const Text("Pending Orders"),
            ),
            GoRoute(
              name: "بيانات الطلب",
              path: '${Routes.pendingOrderDetails}/:orderId',
              builder: (context, state) {
                final orderId = state.pathParameters['orderId'];
                return Text("Order Details: $orderId");
              },
            ),
            GoRoute(
              name: "طلب جديد",
              path: Routes.newOrder,
              builder: (context, state) => const Text("New Order"),
            ),
          ],
        ),

        // Merchant Management branch
        StatefulShellBranch(
          initialLocation: Routes.merchantManagement,
          routes: [
            GoRoute(
              name: "Merchant Management",
              path: Routes.merchantManagement,
              builder:
                  (context, state) =>  MerchantManagementScreen(),
                  //const Text("Merchant Management Screen"),
            ),
            GoRoute(
              name: "Add Merchant",
              path: Routes.addMerchant,
              builder: (context, state) => const Text("Add Merchant Screen"),
            ),
            // GoRoute(
            //   name: "Edit Merchant",
            //   path: '${Routes.editMerchant}/:merchantId',
            //   builder: (context, state) {
            //     final merchantId = state.pathParameters['merchantId'];
            //     return Text("Edit Merchant: $merchantId");
            //   },
            // ),
            GoRoute(
              name: "Edit Merchant",
              path: '${Routes.editMerchant}/:merchantId',
              builder: (context, state) {
                final merchantId = state.pathParameters['merchantId']!;
                return MerchantDetailScreen(merchantId: merchantId);
              },
            ),


          ],
        ),

        // Delivery Personnel branch
        StatefulShellBranch(
          initialLocation: Routes.deliveryPersonnel,
          routes: [
            GoRoute(
              name: "Delivery Personnel",
              path: Routes.deliveryPersonnel,
              builder:
                  (context, state) => DeliveryPersonnelScreen(),
                  //const Text("Delivery Personnel Screen"),
            ),
            GoRoute(
              name: "Add Delivery Person",
              path: Routes.addDeliveryPerson,
              builder:
                  (context, state) => const Text("Add Delivery Person Screen"),
            ),
            GoRoute(
              name: "Edit Delivery Person",
              path: '${Routes.editDeliveryPerson}/:personId',
              builder: (context, state) {
                final personId = state.pathParameters['personId'];
                return Text("Edit Delivery Person: $personId");
              },
            ),
            // Include original worker routes
            GoRoute(
              name: "ملفات العاملين",
              path: Routes.workerAccounts,
              builder: (context, state) => const Text("Worker Accounts"),
            ),
            GoRoute(
              name: "اضافة عامل",
              path: Routes.addWorker,
              builder: (context, state) => const Text("Add Worker"),
            ),
            GoRoute(
              name: "بيانات الحساب",
              path: Routes.accountDetails,
              builder:
                  (context, state) => Text("Account Details: ${state.extra}"),
            ),
          ],
        ),

        // Banner Management branch
        StatefulShellBranch(
          initialLocation: Routes.bannerManagement,
          routes: [
            GoRoute(
              name: "Banner Management",
              path: Routes.bannerManagement,
              builder:
                  (context, state) => const BannerScreen(),
            ),
            GoRoute(
              name: "Add Banner",
              path: Routes.addBanner,
              builder: (context, state) => const Text("Add Banner Screen"),
            ),
            GoRoute(
              name: "Edit Banner",
              path: '${Routes.editBanner}/:bannerId',
              builder: (context, state) {
                final bannerId = state.pathParameters['bannerId'];
                return Text("Edit Banner: $bannerId");
              },
            ),
          ],
        ),

        // Customer Management branch
        StatefulShellBranch(
          initialLocation: Routes.customerManagement,
          routes: [
            GoRoute(
              name: "Customer Management",
              path: Routes.customerManagement,
              builder:
                  (context, state) =>  CustomerManagement(),
                  //const Text("Customer Management Screen"),
            ),
            GoRoute(
              name: "Customer Details",
              path: '${Routes.customerManagement}/:customerId',
              builder: (context, state) {
                final customerId = state.pathParameters['customerId'];
                return CustomerManagementDetails(customerId: customerId ?? '',);
                //return Text("Customer Details: $customerId");
              },
            ),
            GoRoute(
              name: "Edit Customer",
              path: '${Routes.editCustomer}/:customerId',
              builder: (context, state) {
                final customerId = state.pathParameters['customerId'];
                return Text("Edit Customer: $customerId");
              },
            ),
          ],
        ),

        // Payment Management branch
        StatefulShellBranch(
          initialLocation: Routes.paymentManagement,
          routes: [
            GoRoute(
              name: "Payment Management",
              path: Routes.paymentManagement,
              builder:
                  (context, state) =>  PaymentManagementScreen(),
                  //const Text("Payment Management Screen"),
            ),
            GoRoute(
              name: "Payment Details",
              path: '${Routes.paymentDetails}/:paymentId',
              builder: (context, state) {
                final paymentId = state.pathParameters['paymentId'];
                return Text("Payment Details: $paymentId");
              },
            ),
            GoRoute(
              name: "Refund Management",
              path: Routes.refundManagement,
              builder:
                  (context, state) => const Text("Refund Management Screen"),
            ),
          ],
        ),

        // Customer Rating Review branch
        StatefulShellBranch(
          initialLocation: Routes.customerRatingReview,
          routes: [
            GoRoute(
              name: "Customer Rating Review",
              path: Routes.customerRatingReview,
              builder:
                  (context, state) => CustomerRatingReview(),
                     // const Text("Customer Rating Review Screen"),
            ),
          ],
        ),

        // Complaints Management branch
        StatefulShellBranch(
          initialLocation: Routes.complaintsManagement,
          routes: [
            GoRoute(
              name: "Complaints Management",
              path: Routes.complaintsManagement,
              builder:
                  (context, state) =>
                     ComplaintsManagementScreen(),
            ),
            GoRoute(
              name: "Complaint Details",
              path: '${Routes.complaintDetails}/:complaintId',
              builder: (context, state) {
                final complaintId = state.pathParameters['complaintId'];
                return Text("Complaint Details: $complaintId");
              },
            ),
            GoRoute(
              name: "Resolve Complaint",
              path: '${Routes.resolveComplaint}/:complaintId',
              builder: (context, state) {
                final complaintId = state.pathParameters['complaintId'];
                return Text("Resolve Complaint: $complaintId");
              },
            ),
          ],
        ),

        // Return Management branch
        StatefulShellBranch(
          initialLocation: Routes.returnManagement,
          routes: [
            GoRoute(
              name: "Return Management",
              path: Routes.returnManagement,
              builder:
                  (context, state) => const ReturnsManagementScreen(),
            ),
            GoRoute(
              name: "Return Details",
              path: '${Routes.returnDetails}/:returnId',
              builder: (context, state) {
                final returnId = state.pathParameters['returnId'];
                return Text("Return Details: $returnId");
              },
            ),
            GoRoute(
              name: "Process Return",
              path: '${Routes.processReturn}/:returnId',
              builder: (context, state) {
                final returnId = state.pathParameters['returnId'];
                return Text("Process Return: $returnId");
              },
            ),
          ],
        ),

        // Reports branch
        StatefulShellBranch(
          initialLocation: Routes.reports,
          routes: [
            GoRoute(
              name: "Reports",
              path: Routes.reports,
              builder: (context, state) => ReportsScreen(),
              //const Text("Reports Screen"),
            ),
            GoRoute(
              name: "Generate Report",
              path: Routes.generateReport,
              builder: (context, state) => const Text("Generate Report Screen"),
            ),
            GoRoute(
              name: "Report Details",
              //path: '${Routes.reportDetails}/:reportId',
              path: Routes.reportDetails,
              builder: (context, state) => BlocProvider(
                create: (context) => DetailedReportCubit(),
                child: const DetailedReportScreen(),
              ),
              // builder: (context, state) {
              //   final reportId = state.pathParameters['reportId'];
              //   return Text("Report Details: $reportId");
              // },
            ),
          ],
        ),

        // Settings branch
        StatefulShellBranch(
          initialLocation: Routes.settings,
          routes: [
            GoRoute(
              name: "Settings",
              path: Routes.settings,
              builder: (context, state) => const SystemSettingsScreen(),
            ),
            GoRoute(
              name: "User Settings",
              path: Routes.userSettings,
              builder: (context, state) => const Text("User Settings Screen"),
            ),
            GoRoute(
              name: "App Settings",
              path: Routes.appSettings,
              builder: (context, state) => const Text("App Settings Screen"),
            ),
            GoRoute(
              name: "System Settings",
              path: Routes.systemSettings,
              builder: (context, state) => const Text("System Settings Screen"),
            ),
          ],
        ),
      ],
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_gold_dashboard/Features/auth/login/screen/login_screen.dart';
import 'package:my_gold_dashboard/Features/auth/otp/otp_screen.dart';
import 'package:my_gold_dashboard/Features/banner/screen/banner_screen.dart';
import 'package:my_gold_dashboard/Features/home/screens/home_screen_body.dart';
import 'package:my_gold_dashboard/Features/order_management/screen/order_managment_screen.dart';
import 'package:my_gold_dashboard/Features/settings/screen/serrings_screen.dart';
import 'package:my_gold_dashboard/Features/sidebar/screen/sidebar_screen.dart';
import 'package:my_gold_dashboard/core/routes/routes.dart';

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
      name: "OTP",
      path: Routes.otp,
      builder:
          (context, state) => const OtpScreen(), // You'll need to create this
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
              builder: (context, state) => const HomeScreenBody(),
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
                  (context, state) => const Text("Merchant Management Screen"),
            ),
            GoRoute(
              name: "Add Merchant",
              path: Routes.addMerchant,
              builder: (context, state) => const Text("Add Merchant Screen"),
            ),
            GoRoute(
              name: "Edit Merchant",
              path: '${Routes.editMerchant}/:merchantId',
              builder: (context, state) {
                final merchantId = state.pathParameters['merchantId'];
                return Text("Edit Merchant: $merchantId");
              },
            ),
            GoRoute(
              name: "Merchant Details",
              path: '${Routes.merchantDetails}/:merchantId',
              builder: (context, state) {
                final merchantId = state.pathParameters['merchantId'];
                return Text("Merchant Details: $merchantId");
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
                  (context, state) => const Text("Delivery Personnel Screen"),
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
                  (context, state) => const Text("Customer Management Screen"),
            ),
            GoRoute(
              name: "Customer Details",
              path: '${Routes.customerDetails}/:customerId',
              builder: (context, state) {
                final customerId = state.pathParameters['customerId'];
                return Text("Customer Details: $customerId");
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
                  (context, state) => const Text("Payment Management Screen"),
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
                  (context, state) =>
                      const Text("Customer Rating Review Screen"),
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
                      const Text("Complaints Management Screen"),
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
                  (context, state) => const Text("Return Management Screen"),
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
              builder: (context, state) => const Text("Reports Screen"),
            ),
            GoRoute(
              name: "Generate Report",
              path: Routes.generateReport,
              builder: (context, state) => const Text("Generate Report Screen"),
            ),
            GoRoute(
              name: "Report Details",
              path: '${Routes.reportDetails}/:reportId',
              builder: (context, state) {
                final reportId = state.pathParameters['reportId'];
                return Text("Report Details: $reportId");
              },
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

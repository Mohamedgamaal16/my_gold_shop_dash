class Routes {
  // Authentication
  static const String login = '/login';
  static const String otp = '/otp';

  
  // Main Dashboard
  static const String homeScreen = '/home';
  
  // Original routes
  static const String allorders = '/all-orders';
  static const String pendingOrders = '/pending-orders';
  static const String pendingOrderDetails = '/pending-order-details';
  static const String workerAccounts = '/worker-accounts';
  static const String addWorker = '/add-worker';
  static const String accountDetails = '/account-details';
  static const String newOrder = '/new-order';
  
  // Enhanced navigation routes
  static const String orderManagement = '/order-management';
  static const String merchantManagement = '/merchant-management';
  static const String deliveryPersonnel = '/delivery-personnel';
  static const String bannerManagement = '/banner-management';
  static const String customerManagement = '/customer-management';
  static const String paymentManagement = '/payment-management';
  static const String customerRatingReview = '/customer-rating-review';
  static const String complaintsManagement = '/complaints-management';
  static const String returnManagement = '/return-management';
  static const String reports = '/reports';
  static const String settings = '/settings';
  
  // Sub-routes for detailed management
  static const String addMerchant = '/add-merchant';
  static const String editMerchant = '/edit-merchant';
  static const String merchantDetails = '/merchant-details';
  
  static const String addDeliveryPerson = '/add-delivery-person';
  static const String editDeliveryPerson = '/edit-delivery-person';
  static const String deliveryPersonDetails = '/delivery-person-details';
  
  static const String addBanner = '/add-banner';
  static const String editBanner = '/edit-banner';
  
  static const String customerDetails = '/customer-details';
  static const String editCustomer = '/edit-customer';
  
  static const String paymentDetails = '/payment-details';
  static const String refundManagement = '/refund-management';
  
  static const String complaintDetails = '/complaint-details';
  static const String resolveComplaint = '/resolve-complaint';
  
  static const String returnDetails = '/return-details';
  static const String processReturn = '/process-return';
  
  static const String generateReport = '/generate-report';
  static const String reportDetails = '/report-details';
  
  static const String userSettings = '/user-settings';
  static const String appSettings = '/app-settings';
  static const String systemSettings = '/system-settings';



}
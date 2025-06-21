import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/Features/delivery_personnel/presantation/model/agent_model.dart';
import 'package:my_gold_dashboard/Features/delivery_personnel/presantation/widget/delevery_data_source.dart';
import 'package:my_gold_dashboard/Features/order_management/widgets/order_table_footer.dart';
import 'package:my_gold_dashboard/core/service/table_page_number.dart';
import 'package:my_gold_dashboard/core/shared_widget/generic_tables.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';

class DeliveryPersonnelTable extends StatefulWidget {
  const DeliveryPersonnelTable({super.key});

  @override
  State<DeliveryPersonnelTable> createState() => _OrdersTableState();
}

class _OrdersTableState extends State<DeliveryPersonnelTable> {
  final int _rowsPerPage = 8;
  int _currentPage = 0;

  final ScrollController _horizontalScrollController = ScrollController(); 

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  void _nextPage() {
    if ((_currentPage + 1) * _rowsPerPage < orders.length) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _goToPage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int totalOrders = agents.length;
    final int startIndex = _currentPage * _rowsPerPage;
    final int endIndex =
        ((startIndex + _rowsPerPage) > totalOrders)
            ? totalOrders
            : (startIndex + _rowsPerPage);
    final paginatedOrders = agents.sublist(startIndex, endIndex);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: ScrollbarTheme(
            data: ScrollbarThemeData(
              crossAxisMargin:  4,
              thumbColor: WidgetStateProperty.all(AppColors.texturesHeadersTexture),
              trackColor: WidgetStateProperty.all(AppColors.greyScaleLightGrey),
            ),
            child: Scrollbar(
              controller: _horizontalScrollController,
              thumbVisibility: true,
              trackVisibility: true,
              interactive: true,
              radius: const Radius.circular(0),
              thickness: 10,
              child: SingleChildScrollView(
                controller: _horizontalScrollController, 
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.sizeOf(context).width,
                    maxWidth: double.infinity,
                  ),
                  child: GenericDataTable(
                    columns: const [
                      "Return ID",
                      'Order ID',
                      'Customer Name',
                      'Reason',
                      'Merchant',
                     
                    ],
                    source: DeleveryDataSource(
                      context,
                      paginatedOrders,
                     
                    
                    ),
                    rowsPerPage: _rowsPerPage,
                    width: 1200,
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),
        if (totalOrders > _rowsPerPage)
          PaginationFooter(
            startIndex: startIndex,
            endIndex: endIndex,
            rowCount: totalOrders,
            currentPage: _currentPage,
            totalPages: (totalOrders / _rowsPerPage).ceil(),
            onPreviousPage: _previousPage,
            onNextPage: _nextPage,
            buildPageNumbers: () => buildPageNumbers(
              (totalOrders / _rowsPerPage).ceil(),
              _currentPage,
              _goToPage,
            ),
          ),
      ],
    );
  }
}


List<AgentModel> agents = [
      AgentModel(
        name: "Ahmed",
        id: "D-1001",
        status: "Inactive",
        location: "Track Location",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Mohammed",
        id: "D-1002",
        status: "Active",
        location: "Not available",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Sayed",
        id: "D-1004",
        status: "Active",
        location: "Track Location",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Khalid",
        id: "D-1003",
        status: "Suspended",
        location: "Not available",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Eslam",
        id: "D-1005",
        status: "Suspended",
        location: "Track Location",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),AgentModel(
        name: "Ahmed",
        id: "D-1001",
        status: "Inactive",
        location: "Track Location",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Mohammed",
        id: "D-1002",
        status: "Active",
        location: "Not available",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Sayed",
        id: "D-1004",
        status: "Active",
        location: "Track Location",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Khalid",
        id: "D-1003",
        status: "Suspended",
        location: "Not available",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Eslam",
        id: "D-1005",
        status: "Suspended",
        location: "Track Location",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),AgentModel(
        name: "Ahmed",
        id: "D-1001",
        status: "Inactive",
        location: "Track Location",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Mohammed",
        id: "D-1002",
        status: "Active",
        location: "Not available",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Sayed",
        id: "D-1004",
        status: "Active",
        location: "Track Location",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Khalid",
        id: "D-1003",
        status: "Suspended",
        location: "Not available",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Eslam",
        id: "D-1005",
        status: "Suspended",
        location: "Track Location",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),AgentModel(
        name: "Ahmed",
        id: "D-1001",
        status: "Inactive",
        location: "Track Location",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Mohammed",
        id: "D-1002",
        status: "Active",
        location: "Not available",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Sayed",
        id: "D-1004",
        status: "Active",
        location: "Track Location",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Khalid",
        id: "D-1003",
        status: "Suspended",
        location: "Not available",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
      AgentModel(
        name: "Eslam",
        id: "D-1005",
        status: "Suspended",
        location: "Track Location",
        assignedPoint: "https://maps.app.goo.gl/8EH3pb7jvUUCJLPZ7?g_st=iw",
      ),
    ];
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@page import="java.util.*" %> <%@page
import="com.group.model.Group" %> <%@page import="com.group.model.Item" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>團購活動後台</title>

    <!-- Custom fonts for this template-->
    <link
      href="/vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />
	<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet" />
  </head>

  <body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
      <script src="/js/layout/Z_slider.js"></script>

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
          <!-- Topbar -->
          <script src="/js/layout/Z_TopBar.js"></script>

          <!-- 主要內容 -->
 <div>
                        <h2>上架團購列表</h2>
                        <table id="table_id" class="display">
                            <thead>
                                <tr>
                                    <th>活動編號</th>
                                    <th>開團人</th>
                                    <th>活動標題</th>
                                    <th>活動描述</th>
                                    <th>開團時間</th>
                                    <th>結團時間</th>
                                    <th>成團金額</th>
                                    <th>成團數量</th>
                                    <th>付款方式</th>
                                    <th>下架</th>
                                    <th>商品</th>
                                    <th>訂單</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% List<Group> groups = (ArrayList<Group>)
                                        request.getAttribute("groups");
                                        for (Group group : groups) {
                                        String paymentMethodDisplay = "";

                                        switch (group.getPaymentMethod()) {
                                        case 1 :
                                        paymentMethodDisplay = "匯款";
                                        break;
                                        case 2 :
                                        paymentMethodDisplay = "面交";
                                        break;
                                        case 3 :
                                        paymentMethodDisplay = "SB點數";
                                        break;
                                        case 12 :
                                        paymentMethodDisplay = "匯款,面交";
                                        break;
                                        case 13 :
                                        paymentMethodDisplay = "匯款,SB點數";
                                        break;
                                        case 23 :
                                        paymentMethodDisplay = "面交,SB點數";
                                        break;
                                        case 123 :
                                        paymentMethodDisplay = "匯款,面交,SB點數";
                                        break;
                                        default :
                                        paymentMethodDisplay = "未知支付方式";
                                        break;
                                        }
                                        %>
                                        <tr>
                                            <th>
                                                <%=group.getEventNo() %>
                                            </th>
                                            <th>
                                                <%=group.getUser().getUserNo() %>-<%=group.getUser().getUserChineseName() %>
                                            </th>
                                            <th>
                                                <%=group.getTitle() %>
                                            </th>
                                            <th>
                                                <%=group.getDescription() %>
                                            </th>
                                            <th>
                                                <%=group.getStartTime() %>
                                            </th>
                                            <th>
                                                <%=group.getEndTime() %>
                                            </th>
                                            <th>
                                                <%=group.getMinTotalAmount() %>
                                            </th>
                                            <th>
                                                <%=group.getMinTotalQuantity() %>
                                            </th>
                                            <th>
                                                <%=paymentMethodDisplay %>
                                            </th>
                                            <th>
                                                <button class="delete" data-eventno="<%=group.getEventNo() %>"><i
                                                        class="fa-solid fa-trash"></i></button>
                                            </th>
                                            <th>
                                                <button class="items" data-eventno="<%=group.getEventNo() %>"><i
                                                        class="fa-solid fa-chevron-down"></i></button>
                                            </th>
                                            <th>
                                            	<button class="orders" data-eventno="<%=group.getEventNo() %>"><i 
                                            			class="fa-solid fa-cart-plus"></i></button>
                                            </th>
                                        </tr>
                                        <% } %>
                            </tbody>
                        </table>
                    </div>
          <!-- 主要內容結尾 -->
        </div>
        <!-- End of Main Content -->

        <!-- footer -->
        <script src="/js/layout/Z_footer.js"></script>
      </div>
      <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <script src="/js/layout/Z_Logout Modal.js"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/js/demo/chart-area-demo.js"></script>
    <script src="/js/demo/chart-pie-demo.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                    <script src="https://kit.fontawesome.com/f8f71426ea.js" crossorigin="anonymous"></script>
                    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
                    <script>
                        $(document).ready(function () {
                            var table = $('#table_id').DataTable({
                            	"columnDefs": [
                            	      { "orderable": false, "targets": [10, 11] } 
                            	    ]
                            });


                            $('#table_id tbody').on('click', 'button.delete', function () {
                                const eventno = $(this).data('eventno');
                                console.log('event no: ', eventno);
                                if (confirm("確定要下架這筆活動嗎")) {
                                    $.ajax({
                                        url: '/group/bannedgroup/' + eventno,
                                        type: 'post',
                                        success: function (response) {
                                            table.row($(this).parents('tr')).remove().draw();
                                            location.reload();
                                        },
                                        error: function (xhr, status, error) {
                                            alert('刪除失敗: ' + error);
                                        }
                                    });
                                }
                            });

                            $('#table_id tbody').on('click', 'button.items', function () {
                                const tr = $(this).closest('tr');
                                const row = table.row(tr);
                                const btn = this;
                                const icon = $(this).find('i');

                                if (icon.hasClass('fa-chevron-down')) {
                                    icon.removeClass('fa-chevron-down').addClass('fa-chevron-up');
                                } else {
                                    icon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
                                }

                                if (row.child.isShown()) {
                                    row.child.hide();
                                    tr.removeClass('shown');
                                } else {
                                    var eventno = $(this).data('eventno');
                                    $.ajax({
                                        url: '/item/groupitems/' + eventno,
                                        type: 'get',
                                        success: function (items) {
                                            var content = '<div class="child-row"><table style="width:100%;"> <thead> <tr> <th> 商品名稱 </th> <th> 商品描述 </th> <th> 商品價錢 </th> ' + 
                                                	'</tr> </thead> <tbody>';
                                            items.forEach(item => {
                                                content += '<tr> <th> <a href="#">' + item.name + '</a> </th> <th>' +   
                                                	item.description + '</th> <th>' + item.price + '</th> </tr>'
                                            });
                                            content += '</tbody> </table> </div>';
                                            row.child(content).show();
                                            tr.addClass('shown');
                                        }
                                    });
                                }
                            });

                            $('#table_id tbody').on('click', 'button.orders', function () {
                                const tr = $(this).closest('tr');
                                const row = table.row(tr);
                                const btn = this;
                                const icon = $(this).find('i');

                                if (row.child.isShown()) {
                                    row.child.hide();
                                    tr.removeClass('shown');
                                } else {
                                    var eventno = $(this).data('eventno');
                                    $.ajax({
                                        url: '/grouporders/' + eventno,
                                        type: 'get',
                                        success: function (orders) {
                                            var content = '<div class="child-row"><table style="width:100%;"> <thead> <tr> <th> 訂購人 </th> <th> 付款方式 </th> <th> 成立時間 </th> ' + 
                                                	'</tr> </thead> <tbody>';
                                            orders.forEach(order => {
                                                content += '<tr> <th> <a href="#">' + order.id + '</a> </th> <th>' +   
                                                	order.paymentMethod + '</th> <th>' + order.setTime + '</th> </tr>'
                                            });
                                            content += '</tbody> </table> </div>';
                                            row.child(content).show();
                                            tr.addClass('shown');
                                        }
                                    });
                                }
                            });
                        });
                    </script>
  </body>
</html>

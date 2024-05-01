<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@page import="java.util.*" %>
        <%@page import="com.group.model.Group" %>
            <%@page import="com.group.model.Item" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>團購活動後台</title>
                    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
                </head>

                <body>
                
                    <div class="container">
                        <h2>團購列表</h2>
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
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% List<Group> groups = (ArrayList<Group>)
                                        request.getAttribute("groups");
                                for (Group group : groups) {
                                String paymentMethodDisplay = "";

                                switch (group.getPaymentmethod()) {
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
                                                <%=group.getEventno() %>
                                            </th>
                                            <th>
                                                <%=group.getHostuserno() %>
                                            </th>
                                            <th>
                                                <%=group.getTitle() %>
                                            </th>
                                            <th>
                                                <%=group.getDescription() %>
                                            </th>
                                            <th>
                                                <%=group.getStarttime() %>
                                            </th>
                                            <th>
                                                <%=group.getEndtime() %>
                                            </th>
                                            <th>
                                                <%=group.getMintotalamount() %>
                                            </th>
                                            <th>
                                                <%=group.getMintotalquantity() %>
                                            </th>
                                            <th>
                                                <%=paymentMethodDisplay %>
                                            </th>
                                            <th>
                                                <button class="delete" data-eventno="<%=group.getEventno() %>"><i
                                                        class="fa-solid fa-trash"></i></button>
                                            </th>
                                            <th>
                                                <button class="items" data-eventno="<%=group.getEventno() %>"><i class="fa-solid fa-chevron-down"></i></button>
                                            </th>
                                        </tr>
                                        <% } %>
                            </tbody>
                        </table>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                    <script src="https://kit.fontawesome.com/f8f71426ea.js" crossorigin="anonymous"></script>
                    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
                    <script>
					    $(document).ready(function () {
					        var table = $('#table_id').DataTable();
					
					       
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
                                var tr = $(this).closest('tr');
                                var row = table.row(tr);
                                var btn = this; // 保存 this 參考

                                if (row.child.isShown()) {
                                    // 如果已經展開，則收起
                                    row.child.hide();
                                    tr.removeClass('shown');
                                } else {
                                    // 展開，並從伺服器獲取數據
                                    var eventno = $(this).data('eventno');
                                    $.ajax({
                                        url: '/item/groupitems/' + eventno,
                                        type: 'get',
                                        success: function (items) {
                                        	var content = '<div class="child-row">';
                                            items.forEach(item => {
                                                content += '<div class="item">' +
                                                           '<h4>' + item.name + '</h4>' +
                                                           '<p>' + item.description + '</p>' +
                                                           '<p>Price: ' + item.price + '</p>' +
                                                           '</div>';
                                            });
                                            content += '</div>';
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
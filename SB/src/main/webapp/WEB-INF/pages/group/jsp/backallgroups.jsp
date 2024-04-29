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
                            <% List<Group> groups = (ArrayList<Group>)
                                    request.getAttribute("groups");
                                    for (Group group : groups) {
                                    %>
                                    <tbody>
                                        <tr>
                                            <th>
                                                <%=group.getEventno() %>
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
                                            	<%=group.getPaymentmethod() %>
                                            </th>
                                            <th>
                                            	<button class="delete"><i class="fa-solid fa-trash"></i></button>
                                            </th>
                                            <th>
                                            	<button class="items"><i class="fa-solid fa-chevron-down"></i></button>
                                            </th>
                                        </tr>
                                    </tbody>
                                    <% } %>
                        </table>
                    </div>
                    <script src="https://kit.fontawesome.com/f8f71426ea.js" crossorigin="anonymous"></script>
                    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
                    <script>
                        $(document).ready(function () {
                            $('#table_id').DataTable();
                        });
                    </script>
                </body>

                </html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@page import="java.util.*" %>
        <%@page import="com.group.model.Group" %>
            <%@page import="com.group.model.Item" %>
                <%@page import="com.group.model.ItemSpecification" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <title>團購內容</title>
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
                            rel="stylesheet">
                    </head>

                    <body>
                        <link rel="stylesheet"
                            href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
                            integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
                        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

                        <jsp:useBean id="group" scope="request" class="com.group.model.Group"></jsp:useBean>

                        <table class="table table-striped align-middle table-nowrap">
                            <tbody>
                                <% List<Item> items = (ArrayList<Item>) request.getAttribute("items");
                                        Map<Integer, List<ItemSpecification>> specificationsMap = (Map<Integer,
                                                List<ItemSpecification>>) request.getAttribute("itemspecmap");
                                                for (Item item : items) {
                                                List<ItemSpecification> specifications =
                                                    specificationsMap.get(item.getItemno());%>
                                                    <tr>
                                                        <td>
                                                            <div class="avatar-lg me-4">
                                                                <img src="/groupimages/<%=item.getImgpath()%>"
                                                                    class="img-fluid rounded">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div>
                                                                <h5 class="font-size-18"><a
                                                                        href="ecommerce-product-detail.html"
                                                                        class="text-dark">
                                                                        <%=item.getName() %>
                                                                    </a></h5>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <ul class="list-unstyled ps-0 mb-0 fixed-height">
                                                                <p>
                                                                    <%=item.getDescription() %>
                                                                </p>
                                                            </ul>
                                                        </td>
                                                        <td style="width: 180px;">
                                                            <p>規格: </p>
                                                            <select>
                                                                <% for(int i=0; i < specifications.size(); i++){  %>
                                                                	<option value = "<%=specifications.get(i).getSpecno() %>"><%=specifications.get(i).getSpecvalue() %></option>
                                                                <% } %>
                                                            </select>
                                                        </td>
                                                        <td style="width: 220px;">
                                                            <h3 class="mb-0 font-size-20">
                                                                <b>
                                                                    $:<%=item.getPrice() %>
                                                                </b>
                                                            </h3>
                                                        </td>
                                                        <td>
                                                            <button type="button"
                                                                class="btn btn-primary waves-effect waves-light"><i
                                                                    class="bx bx-cart me-2 font-size-15 align-middle"></i>
                                                                Add</button>
                                                        </td>
                                                        <td>
                                                            <div class="dropdown float-end">
                                                                <a class="text-muted dropdown-toggle font-size-20"
                                                                    href="#" role="button" data-bs-toggle="dropdown"
                                                                    aria-haspopup="true">
                                                                    <i class="bx bx-dots-horizontal-rounded"></i>
                                                                </a>
                                                                <div class="dropdown-menu dropdown-menu-end">
                                                                    <a class="dropdown-item" href="#">Edit</a>
                                                                    <a class="dropdown-item" href="#">Action</a>
                                                                    <a class="dropdown-item" href="#">Remove</a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <% } %>













                                                        <script
                                                            src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                                                        <script
                                                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
                    </body>

                    </html>
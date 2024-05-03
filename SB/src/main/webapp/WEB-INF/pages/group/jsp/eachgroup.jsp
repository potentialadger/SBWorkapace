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
                        <style>
                            input::-webkit-outer-spin-button,
                            input::-webkit-inner-spin-button {
                                -webkit-appearance: none;
                                margin: 0;
                            }

                            input[type=number] {
                                -moz-appearance: textfield;
                            }
                        </style>
                    </head>

                    <body>
                        <link rel="stylesheet"
                            href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
                            integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
                        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">


                        <div class="container container-contact bootstrap snippets bootdeys bootdey">
                            <jsp:useBean id="group" scope="request" class="com.group.model.Group">
                            </jsp:useBean>
                            <table class="table table-striped align-middle table-nowrap">
                                <thead>
                                    <tr>
                                        <td>
                                            <h4>商品名稱</h4>
                                        </td>
                                        <td>
                                            <h4>商品簡述</h4>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <h4>商品規格</h4>
                                        </td>
                                        <td>
                                            <h4>商品價格</h4>
                                        </td>
                                        <td>
                                            <h4>商品數量</h4>
                                        </td>
                                        <td>
                                            <h4>功能</h4>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% List<Item> items = (ArrayList<Item>)
                                            request.getAttribute("items");
                                            Map<Integer, List<ItemSpecification>> specificationsMap =
                                                (Map<Integer, List<ItemSpecification>>)
                                                    request.getAttribute("itemspecmap");
                                                    for (Item item : items) {
                                                    List<ItemSpecification> specifications =
                                                        specificationsMap.get(item.getItemNo());%>
                                                        <tr>
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
                                                            <td>
                                                                <ul>

                                                                </ul>
                                                            </td>
                                                            <td style="width: 180px;">
                                                                <p style="margin-bottom: 5px">規格: </p>
                                                                <select>
                                                                    <% for(int i=0; i < specifications.size(); i++){ %>
                                                                        <option
                                                                            value="<%=specifications.get(i).getSpecNo() %>">
                                                                            <%=specifications.get(i).getSpecValue() %>
                                                                        </option>
                                                                        <% } %>
                                                                </select>
                                                            </td>
                                                            <td style="width: 220px;">
                                                                <h3 class="mb-0 font-size-20">
                                                                    <b>
                                                                        NT$<%=item.getPrice() %>
                                                                    </b>
                                                                </h3>
                                                            </td>
                                                            <td>
                                                                <p style="margin-bottom: 5px">數量:</p>
                                                                <button class="minus btn btn-primary btn-sm"><i
                                                                        class="fa-solid fa-minus"></i></button><input
                                                                    class="numberinput" type="number"
                                                                    style="width: 32px; height: 31px" value="0"
                                                                    min="0"><button class="plus btn btn-primary btn-sm"><i
                                                                        class="fa-solid fa-plus"></i></button>
                                                            </td>
                                                            <td>
                                                                <button type="button"
                                                                    class="btn btn-primary waves-effect waves-light"><i
                                                                        class="bx bx-cart me-2 font-size-15 align-middle"></i>
                                                                    Add</button>
                                                            </td>
                                                        </tr>
                                                        <% } %>
                                </tbody>
                            </table>
                            <button class="btn btn-success" type="submit" id="submitorder" data-eventno="<%=group.getEventNo() %>"
                                style="width: 100%;">送出</button>
                        </div>
                        <script src="https://kit.fontawesome.com/f8f71426ea.js" crossorigin="anonymous"></script>
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
                        <script>
                            $(document).ready(function () {
                                $('.plus').click(function () {
                                    var input = $(this).siblings('.numberinput');
                                    var currentValue = parseInt(input.val(), 10);
                                    input.val(currentValue + 1);
                                });

                                $('.minus').click(function () {
                                    var input = $(this).siblings('.numberinput');
                                    var currentValue = parseInt(input.val(), 10);
                                    if (currentValue > 0) {
                                        input.val(currentValue - 1);
                                    }
                                });
                                
                                $('.submitorder').click(function(){
                                	const eventno = $(this).data('eventno');
                                	const paymentMethod = 3;
                                	const item1 = 4;
                                	const item2 = 5;
                                	const item3 = 6;
                                	const itemSpecNo1 = 1;
                                	const itemSpecNo2 = 4;
                                	const itemSpecNo3 = 7;
                                	const itemQuantity1 = 2;
                                	const itemQuantity2 = 3;
                                	const itemQuantity3 = 4;
                                	const dataForm = {
                                			"eventNo" : eventno,
                                			"paymentMethod" : paymentMethod,
                                			"OrderDetail" : [
                                				"itemNo" : item1,
                                				"itemSpec" : itemSpecNo1,
                                				"itemQuantity" : itemQuantity1
                                			],
                                			[
                                				"itemNo" : item2,
                                				"itemSpec" : itemSpecNo2,
                                				"itemQuantity" : itemQuantity2
                                			],
                                			[
                                				"itemNo" : item3,
                                				"itemSpec" : itemSpecNo3,
                                				"itemQuantity" : itemQuantity3
                                			]
                                			
                                	}
                                })
                            });
                        </script>
                    </body>

                    </html>
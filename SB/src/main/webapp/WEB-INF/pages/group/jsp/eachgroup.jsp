<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@page import="java.util.*" %>
        <%@page import="com.group.model.Group" %>
            <%@page import="com.group.model.Item" %>
                <%@page import="com.group.model.ItemSpecification" %>
                    <%@ page import="java.text.SimpleDateFormat" %>
                        <%@ page import="java.util.Date" %>
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
                                    integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc="
                                    crossorigin="anonymous" />
                                <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

                                <div style="position: absolute; top: 10px; left: 10px;">
                                    <a href="/group/groups"><i class="fa-solid fa-arrow-left"></i></a>
                                </div>

                                <div class="container container-contact bootstrap snippets bootdeys bootdey">
                                    <jsp:useBean id="group" scope="request" class="com.group.model.Group">
                                    </jsp:useBean>

                                    <div class="group">
                                        <div class="row">
                                            <div class="col-4">
                                                <section class="border border-info p-3 mb-3 rounded-pill">
                                                    <p class="lead" style="margin-bottom: 0px">標題: <%=group.getTitle()
                                                            %>
                                                    </p>
                                                </section>
                                            </div>
                                            <div class="col-8">
                                                <section class="border border-info p-3 mb-3 rounded-pill">
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <% Date endTime=group.getEndTime(); SimpleDateFormat sdf=new
                                                                SimpleDateFormat("yyyy-MM-dd"); String
                                                                formattedDate=sdf.format(endTime); %>
                                                                <p class="lead" style="margin-bottom: 0px">結單時間:
                                                                    <%=formattedDate %>
                                                                </p>
                                                        </div>
                                                        <% String paymentMethodDisplay="" ; switch
                                                            (group.getPaymentMethod()) { case 1 :
                                                            paymentMethodDisplay="匯款" ; break; case 2 :
                                                            paymentMethodDisplay="面交" ; break; case 3 :
                                                            paymentMethodDisplay="SB點數" ; break; case 12 :
                                                            paymentMethodDisplay="匯款, 面交" ; break; case 13 :
                                                            paymentMethodDisplay="匯款, SB點數" ; break; case 23 :
                                                            paymentMethodDisplay="面交, SB點數" ; break; case 123 :
                                                            paymentMethodDisplay="匯款, 面交, SB點數" ; break; default :
                                                            paymentMethodDisplay="未知支付方式" ; break; } %>
                                                            <div class="col-6">
                                                                <p class="lead" style="margin-bottom: 0px">支付方式:
                                                                    <%=paymentMethodDisplay %>
                                                                </p>
                                                            </div>
                                                    </div>
                                                </section>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <section class="border border-info p-3 mb-3 rounded-pill text-center">
                                                <p class="lead mb-0">團購描述:</p>
                                                <p>
                                                    <%= group.getDescription() %>
                                                </p>
                                            </section>
                                        </div>
                                    </div>

                                    <!-- 商品列表 -->
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
                                                                            <h5 class="font-size-18">
                                                                                <a href="#" class="text-dark itemname"
                                                                                    data-bs-toggle="modal"
                                                                                    data-bs-target="#productModal"
                                                                                    data-itemno="<%=item.getItemNo() %>"
                                                                                    data-name="<%=item.getName() %>"
                                                                                    data-description="<%=item.getDescription() %>"
                                                                                    data-price="<%=item.getPrice() %>"
                                                                                    data-path="<%=item.getImgPath() %>">
                                                                                    <%= item.getName() %>
                                                                                </a>
                                                                            </h5>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <ul
                                                                            class="list-unstyled ps-0 mb-0 fixed-height">
                                                                            <p class="itemdesc">
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
                                                                        <select class="item-spec-select">
                                                                            <% for(int i=0; i < specifications.size();
                                                                                i++){ %>
                                                                                <option class="itemspec"
                                                                                    value="<%=specifications.get(i).getSpecNo() %>"
                                                                                    data-itemspec="<%=specifications.get(i).getSpecNo() %>">
                                                                                    <%=specifications.get(i).getSpecValue()
                                                                                        %>
                                                                                </option>
                                                                                <% } %>
                                                                        </select>
                                                                    </td>
                                                                    <td style="width: 220px;">
                                                                        <h3 class="mb-0 font-size-20">
                                                                            NT$
                                                                            <b class="itemprice">
                                                                                <%=item.getPrice() %>
                                                                            </b>
                                                                        </h3>
                                                                    </td>
                                                                    <td>
                                                                        <p style="margin-bottom: 5px">數量:</p>
                                                                        <button
                                                                            class="minus btn btn-primary btn-sm">-</button>
                                                                        <input class="numberinput" type="number"
                                                                            style="width: 32px; height: 31px" value="0"
                                                                            min="0">
                                                                        <button
                                                                            class="plus btn btn-primary btn-sm">+</button>
                                                                    </td>
                                                                    <td>
                                                                        <button type="button"
                                                                            class="btn btn-primary waves-effect waves-light productadd"
                                                                            data-itemno="<%=item.getItemNo() %>"><i
                                                                                class="bx bx-cart me-2 font-size-15 align-middle"></i>
                                                                            Add</button>
                                                                    </td>
                                                                </tr>
                                                                <% } %>
                                        </tbody>
                                    </table>
                                    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#cart"
                                        type="submit" id="submitorder" data-eventno="<%=group.getEventNo() %>"
                                        style="width: 100%;">購物車</button>
                                </div>
                                <!-- 商品Modal -->
                                <div class="modal fade" id="productModal" tabindex="-1"
                                    aria-labelledby="productModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="border-radius: 20px;">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="productModalLabel">商品圖片</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body text-center">
                                                <img id="productImage" src="" alt="商品圖片" class="img-fluid"
                                                    style="width: 200px;height: 200px;">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 購物車Modal -->
                                <div class="modal fade" id="cart" tabindex="-1" aria-labelledby="cartLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="border-radius: 20px;">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="cartLabel">購物車</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table table-striped align-middle table-nowrap">
                                                    <thead>
                                                        <tr>
                                                            <td>
                                                                商品名稱
                                                            </td>
                                                            <td>
                                                                規格
                                                            </td>
                                                            <td>
                                                                數量
                                                            </td>
                                                            <td>
                                                                商品總價
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="cart">

                                                    </tbody>
                                                </table>
                                                <div class="center">
                                                    付款方式選擇
                                                    <label><input type="radio" value="1" name="method">匯款</label>
                                                    <label><input type="radio" value="2" name="method">面交</label>
                                                    <label><input type="radio" value="3" name="method">SB點數</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary cartsubmit"
                                                    data-eventno="<%=group.getEventNo() %>">確認送出</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <script src="https://kit.fontawesome.com/f8f71426ea.js"
                                    crossorigin="anonymous"></script>
                                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                <script
                                    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
                                <script>
                                    $(document).ready(function () {

                                        function updatePaymentMethods(paymentOptions) {
                                            const options = {
                                                '1': '匯款',
                                                '2': '面交',
                                                '3': 'SB點數'
                                            };

                                            // 禁用所有選項
                                            $('input[name="method"]').prop('disabled', true).prop('checked', false);

                                            // 啟用對應的選項
                                            paymentOptions.split('').forEach(function (option) {
                                                $('input[name="method"][value="' + option + '"]').prop('disabled', false);
                                            });

                                            // 自動選擇第一個可用的選項
                                            $('input[name="method"]:not(:disabled)').first().prop('checked', true);
                                        }

                                        // 假設從後端獲取的group.payment值
                                        const groupPayment = "<%=group.getPaymentMethod() %>"; // 這裡使用JSP語法從後端獲取payment值

                                        // 更新付款方式選擇
                                        updatePaymentMethods(groupPayment);


                                        // 數量選擇
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
                                        // 加入購物車
                                        $('.btn.productadd').on('click', function () {
                                            const $tr = $(this).closest('tr');
                                            const itemno = $tr.find('.itemname').data('itemno');
                                            const itemname = $tr.find('.itemname').text();
                                            const $selectedOption = $tr.find('.item-spec-select option:selected');
                                            const itemspecno = $selectedOption.data('itemspec');
                                            const itemspecvalue = $selectedOption.text();
                                            const itemquan = $tr.find('.numberinput').val();
                                            const price = $tr.find('.itemprice').text().replace('NT$', '').trim();
                                            const itemspec = $tr.find('select').find('option:selected').text();
                                            const itemtotalprice = parseInt(itemquan, 10) * parseFloat(price);

                                            const modalcontext = `<tr data-itemno="` + itemno + `" data-itemspec="` + itemspecno + `" data-itemquan="` + itemquan + `">
                                                        <td>` + itemname + `</td>
                                                        <td>` + itemspec + `</td>
                                                        <td>` + itemquan + `</td>
                                                        <td>NT$` + itemtotalprice + `</td>
                                                        <td><button class="btn btn-danger"><i class="fa-solid fa-xmark"></i></button></td>
                                                    </tr>`;

                                            $('.cart').append(modalcontext);
                                            $tr.find('.numberinput').val(0);

                                        });
                                        // 購物車取消
                                        $('.cart').on('click', '.btn-danger', function () {
                                            $(this).closest('tr').remove();
                                        });

                                        $('.cartsubmit').on('click', function () {
                                            const eventno = $(this).data('eventno')
                                            const orderDetails = [];
                                            const paymentMethod = $('input[name="method"]:checked').val();

                                            $('.cart tr').each(function () {
                                                const $row = $(this);
                                                const itemno = $row.data('itemno');
                                                const itemspec = $row.data('itemspec');
                                                const itemquan = $row.data('itemquan');

                                                orderDetails.push({
                                                    itemNo: itemno,
                                                    itemSpec: itemspec,
                                                    itemQuantity: parseInt(itemquan, 10)
                                                });

                                            })

                                            const formData = {
                                                eventNo: eventno,
                                                paymentMethod: paymentMethod,
                                                orderDetail: orderDetails
                                            }

                                            $.ajax({
                                                url: '/insertorder',
                                                type: 'POST',
                                                contentType: 'application/json',
                                                data: JSON.stringify(formData),
                                                success: function (response) {
                                                    alert('確定送出購物車嗎');
                                                    console.log(formData);
                                                    $('#cart').modal('hide');
                                                },
                                                error: function (err) {
                                                    console.log(formData);
                                                }
                                            })
                                        })

                                        $('#productModal').on('show.bs.modal', function (event) {
                                            var button = $(event.relatedTarget); // 觸發模態框的按鈕
                                            var itemImageFilename = button.data('path');
                                            var itemImageUrl = '/groupimages/' + itemImageFilename;

                                            var modal = $(this);
                                            modal.find('#productImage').attr('src', itemImageUrl);
                                        });
                                    });
                                </script>
                            </body>

                            </html>
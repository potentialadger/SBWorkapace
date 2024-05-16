<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>上架團購商品</title>
        <link rel="stylesheet" href="/mycss/insertitem.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    </head>

    <body>
        <jsp:useBean id="group" scope="request" class="com.group.model.Group">
        </jsp:useBean>

        <section class="section-medium section-arrow--bottom-center section-arrow-primary-color bg-info">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-white text-center">
                        <h2 class="section-title">
                            <%=group.getTitle() %>
                        </h2>
                        <p class="section-sub-title">
                            <%=group.getDescription() %>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <div></div>
        <br>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#staticBackdrop" style="width: 100%">
                            新增商品
                        </button>
        <section class="section-primary t-bordered">
            <div class="container">
                <div class="row testimonial-three testimonial-three--col-three">
                </div>
            </div>
        </section>
        <br>
        <button type="button" class="btn btn-success" id="submitAllItems" style="width: 100%">提交所有商品</button>

        <!-- modal視窗 -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">商品內容</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="newItem">
                        <div class="modal-body">
                            <div class="formGroup">
                                <label for="itemFile">商品圖片:</label>
                                <br>

                                <input type="file" name="itemfile" id="itemFile">
                            </div>
                            <div class="formGroup">
                                <label for="itemName">商品名稱:</label>
                                <br>
                                <input class="rounded-input" type="text" name="itemname" id="itemName"
                                    placeholder="請輸入商品名稱">
                            </div>
                            <div class="formGroup">
                                <label for="itemDesc">商品描述:</label>
                                <br>
                                <input class="rounded-input" type="text" name="itemdescription" id="itemDesc"
                                    placeholder="請輸入商品描述">
                            </div>
                            <div class="formGroup">
                                <label for="itemPrice">商品價錢:</label>
                                <br>
                                <input class="rounded-input" type="number" name="itemprice" id="itemPrice"
                                    placeholder="請輸入價錢">
                            </div>
                            <div class="formGroup">
                                <label for="itemSpec">商品規格:</label>
                                <br>
                                <div class="spec-button">
                                    <button type="button" class="btn btn-outline-secondary" id="newSpec">
                                        <i class="fa-regular fa-plus"></i> 新增規格
                                    </button>
                                </div>
                                <div class="spec-list mt-3">
                                    <!-- 動態添加規格輸入框 -->
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉視窗</button>
                            <button type="button" class="btn btn-primary" id="submitNewItem">輸入確定</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://kit.fontawesome.com/f8f71426ea.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
            crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                var specCount = 0;
                var editingProductContainer = null; // 用於存儲正在編輯的商品容器

                // 添加新規格
                $('#newSpec').click(function (e) {
                    var newItemInput = $('<input>', {
                        'class': 'rounded-input dynamic-input',
                        'type': 'text',
                        'name': 'itemspec',
                        'placeholder': '規格'
                    });

                    var deleteSpecButton = $('<button>', {
                        'class': 'btn btn-danger delete-spec',
                        'type': 'button'
                    }).text('刪除');

                    var specDiv = $('<div>', {
                        'class': 'spec-item d-flex align-items-center'
                    }).append(newItemInput, deleteSpecButton);

                    $('.spec-list').append(specDiv);
                });

                // 刪除規格
                $(document).on('click', '.delete-spec', function () {
                    $(this).parent('.spec-item').remove();
                });

                // 提交新增商品
                $('#submitNewItem').click(function (event) {
                    event.preventDefault();

                    var itemName = $('#itemName').val();
                    var itemDesc = $('#itemDesc').val();
                    var itemPrice = $('#itemPrice').val();
                    var itemFile = $('#itemFile')[0].files[0];
                    var itemSpecs = [];

                    $('input[name="itemspec"]').each(function () {
                        itemSpecs.push($(this).val());
                    });

                    if (!itemFile && !editingProductContainer) {
                        alert('請上傳商品圖片！');
                        return;
                    }

                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var imageUrl = e.target.result;

                        if (editingProductContainer) {
                            // 更新現有的商品展示
                            editingProductContainer.find('.testimonial-image img').attr('src', imageUrl);
                            editingProductContainer.find('.testimonial-name').text(itemName);
                            editingProductContainer.find('.testimonial-content p').text(itemDesc);
                            editingProductContainer.find('.testimonial-job-title').text('價格: ' + itemPrice);
                            editingProductContainer.find('.testimonial-specs').text('規格: ' + itemSpecs.join(', '));
                        } else {
                            // 創建新的商品展示
                            var newProductHtml =
                                '<div class="col-md-4 testimonial-three-col">' +
                                '<div class="testimonial-inner">' +
                                '<div class="testimonial-image" itemprop="image">' +
                                '<img width="180" height="180" src="' + imageUrl + '">' +
                                '</div>' +
                                '<div class="dropdown">' +
                                '<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">' +
                                '操作' +
                                '</button>' +
                                '<ul class="dropdown-menu">' +
                                '<li><a class="dropdown-item delete-product" href="#">刪除商品</a></li>' +
                                '<li><a class="dropdown-item edit-product" href="#">更改商品</a></li>' +
                                '</ul>' +
                                '</div>' +
                                '<div class="testimonial-content">' +
                                '<p>' + itemDesc + '</p>' +
                                '</div>' +
                                '<div class="testimonial-meta">' +
                                '<strong class="testimonial-name" itemprop="name">' + itemName + '</strong>' +
                                '<span class="testimonial-job-title" itemprop="jobTitle">價格: ' + itemPrice + '</span>' +
                                '<br>' +
                                '<span class="testimonial-specs" itemprop="specs">規格: ' + itemSpecs.join(', ') + '</span>' +
                                '</div>' +
                                '</div>' +
                                '</div>';

                            $('.testimonial-three').append(newProductHtml);
                        }
                        cleanupForm();
                        $('#staticBackdrop').modal('hide');
                        editingProductContainer = null; // 重置編輯狀態
                    };

                    if (itemFile) {
                        reader.readAsDataURL(itemFile);
                    }
                });
                // 編輯商品
                $(document).on('click', '.edit-product', function () {
                    editingProductContainer = $(this).closest('.testimonial-three-col');

                    var productName = editingProductContainer.find('.testimonial-name').text();
                    var productDesc = editingProductContainer.find('.testimonial-content p').text();
                    var productPrice = editingProductContainer.find('.testimonial-job-title').text().replace('價格: ', '');
                    var productSpecs = editingProductContainer.find('.testimonial-specs').text().replace('規格: ', '').split(', ');

                    $('#itemName').val(productName);
                    $('#itemDesc').val(productDesc);
                    $('#itemPrice').val(productPrice);

                    $('.spec-list').empty(); // 清除現有的規格輸入
                    productSpecs.forEach(function (spec) {
                        var newItemInput = $('<input>', {
                            'class': 'rounded-input dynamic-input',
                            'type': 'text',
                            'name': 'itemspec',
                            'placeholder': '規格',
                            'value': spec.trim()
                        });

                        var deleteSpecButton = $('<button>', {
                            'class': 'btn btn-danger delete-spec',
                            'type': 'button'
                        }).text('刪除');

                        var specDiv = $('<div>', {
                            'class': 'spec-item d-flex align-items-center'
                        }).append(newItemInput, deleteSpecButton);

                        $('.spec-list').append(specDiv);
                    });

                    $('#staticBackdrop').modal('show');
                });

                // 清理表單
                function cleanupForm() {
                    $('#newItem')[0].reset();
                    $('.spec-list').empty();
                }
            });
        </script>
        <script>
            $(document).ready(function () {
                $('#submitAllItems').click(function () {
                    var allItems = [];
                    $('.testimonial-three-col').each(function () {
                        var itemDto = {
                            itemName: $(this).find('.testimonial-name').text(),
                            itemDesc: $(this).find('.testimonial-content p').text(),
                            itemPrice: $(this).find('.testimonial-job-title').text().replace('價格: ', ''),
                            itemSpec: $(this).find('.testimonial-specs').text().replace('規格: ', '').split(', '),
                            itemImgPath: $(this).find('.testimonial-image img').attr('src')
                        };
                        allItems.push(itemDto);
                    });

                    // 創建 FormData 來發送數據
                    var formData = new FormData();
                    formData.append('products', JSON.stringify(allItems));  // 將商品數據作為 JSON 字符串添加到 FormData 中
                    console.log(formData);

                    for (var pair of formData.entries()) {
                        console.log(pair[0] + ', ' + pair[1]);
                    }

                    $.ajax({
                        url: '/item/insertitem',
                        type: 'post',
                        contentType: 'application/json',
                        data: JSON.stringify(allItems),
                        success: function (data) {
                            alert('確定提交商品?');
                            window.location.href = data.redirectUrl;
                        },
                        error: function (err) {
                            console.log(formData);
                        }
                    })
                })
            })
        </script>

    </body>

    </html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>上架團購商品</title>
        <link rel="stylesheet" href="/mycss/insertitem.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    </head>

    <body>
        <jsp:useBean id="group" scope="request" class="com.group.model.Group">
        </jsp:useBean>
        
         <section class="section-medium section-arrow--bottom-center section-arrow-primary-color bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-white text-center">
                    <h2 class="section-title"><%=group.getTitle() %></h2>
                    <p class="section-sub-title"><%=group.getDescription() %></p>
                </div>
            </div>
        </div>
    </section>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
        新增商品
    </button>
    <section class="section-primary t-bordered">
        <div class="container">
            <div class="row testimonial-three testimonial-three--col-three">
            </div>
        </div>
    </section>

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            var specCount = 0;

            $('#newSpec').click(function (e) {
                specCount++;
                var newItemInput = $('<input>', {
                    'class': 'rounded-input dynamic-input',
                    'type': 'text',
                    'name': 'itemspec',
                    'placeholder': '規格'
                });

                var specDiv = $('<div>', {
                    'class': 'spec-item'
                });

                specDiv.append(newItemInput);
                $('.spec-list').append(specDiv);
            });

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

                if (itemFile) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var imageUrl = e.target.result;
                        var newProductHtml = `
                            <div class="col-md-4 testimonial-three-col">
                                <div class="testimonial-inner">
                                    <div class="testimonial-image" itemprop="image">
                                        <img width="180" height="180" src="${imageUrl}">
                                    </div>
                                    <div class="testimonial-content">
                                        <p>${itemDesc}</p>
                                    </div>
                                    <div class="testimonial-meta">
                                        <strong class="testimonial-name" itemprop="name">${itemName}</strong>
                                        <span class="testimonial-job-title" itemprop="jobTitle">價格: ${itemPrice}</span>
                                        <br>
                                        <span class="testimonial-specs" itemprop="specs">規格: ${itemSpecs.join(', ')}</span>
                                    </div>
                                </div>
                            </div>
                        `;

                        $('.testimonial-three').append(newProductHtml);
                        cleanupForm();
                        $('#staticBackdrop').modal('hide');
                    };
                    reader.readAsDataURL(itemFile);
                } else {
                    alert('請上傳商品圖片！');
                }
            });

            function cleanupForm() {
                $('#newItem')[0].reset();
                $('.dynamic-input').remove();
            }
        });
    </script>
    
    </body>

    </html>
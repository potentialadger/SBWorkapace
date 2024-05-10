<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>上架團購商品</title>
        <link rel="stylesheet" href="../../../resources/mycss/insertitem.css">
    </head>

    <body>
        <jsp:useBean id="group" scope="request" class="com.group.model.Group">
        </jsp:useBean>
        <section class="section-medium section-arrow--bottom-center section-arrow-primary-color bg-primary">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-white text-center">
                        <h2 class="section-title ">
                            <%=group.getTitle() %>
                        </h2>
                        <p class="section-sub-title">
                            <%=group.getDescription() %>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <button type="button">新增商品</button>
        <section class="section-primary t-bordered">
            <div class="container">
                <div class="row testimonial-three testimonial-three--col-three">

                </div>
            </div>
        </section>
    </body>

    </html>
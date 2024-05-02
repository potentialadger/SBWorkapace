<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@page import="java.util.*" %>
        <%@page import="com.group.model.Group" %>
            <%@page import="com.group.model.Item" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>SB 團購活動</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="/mycss/groups.css">
                </head>

                <body>
                    <div class="container">
                        <div class="row">
                            <% List<Group> groups = (ArrayList<Group>)
                                    request.getAttribute("groups");
                                    for (Group group : groups) { %>
                                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                                        <div class="card service-wrapper rounded border-0 shadow p-4">
                                            <div class="content mt-4">
                                                <h5 class="title">
                                                    <%=group.getTitle() %>
                                                </h5>
                                                <p class="text-muted mt-3 mb-0">
                                                    <%=group.getDescription() %>
                                                </p>
                                                <div class="mt-3">
                                                    <a href="javascript:void(0)" class="text-custom">Read More <i
                                                            class="mdi mdi-chevron-right"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <% } %>
                        </div>
                    </div>
                    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>
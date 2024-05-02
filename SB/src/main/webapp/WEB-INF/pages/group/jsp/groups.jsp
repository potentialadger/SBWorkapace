<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@page import="java.util.*" %>
    <%@page import="java.lang.*" %>
        <%@page import="com.group.model.Group" %>
            <%@page import="com.group.model.Item" %>
            <%@ page import="java.text.SimpleDateFormat" %>
            <%! 
			    public String formatTimeAgo(Date date) {
			        final long SECOND = 1000;
			        final long MINUTE = 60 * SECOND;
			        final long HOUR = 60 * MINUTE;
			        final long DAY = 24 * HOUR;
			        final long MONTH = 30 * DAY;
			        
			        long currentTime = System.currentTimeMillis();
			        long timeDiff = currentTime - date.getTime();
			
			        if (timeDiff < MINUTE) {
			            return (timeDiff / SECOND) + " 秒前開團";
			        } else if (timeDiff < HOUR) {
			            return (timeDiff / MINUTE) + " 分鐘前開團";
			        } else if (timeDiff < DAY) {
			            return (timeDiff / HOUR) + " 小時前開團";
			        } else if (timeDiff < MONTH) {
			            return (timeDiff / DAY) + " 天前開團";
			        } else {
			            return new SimpleDateFormat("yyyy-MM-dd").format(date);
			        }
			    }
			%>
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
                                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2 position-relative">
                                        <div class="card service-wrapper rounded border-0 shadow p-4">
                                            <div class="content mt-4">
                                                <h5 class="title">
                                                    <%=group.getTitle() %>
                                                </h5>
                                                <p class="text-muted mt-3 mb-0">
                                                    <%=group.getDescription() %>
                                                </p>
                                                <%
												    Date startDate = group.getStarttime();
												    String timeAgo = formatTimeAgo(startDate);
												%>
												
                                                <p  class="link-wrapper" style="position: absolute; bottom: 5px; left: 10px; color: gray">
                                                	<%=timeAgo %> 
                                                </p>
                                                 <div class="link-wrapper" style="position: absolute; bottom: 10px; right: 10px;">
        											<a href="javascript:void(0)" class="text-custom">前往團購 <i class="mdi mdi-chevron-right"></i></a>
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
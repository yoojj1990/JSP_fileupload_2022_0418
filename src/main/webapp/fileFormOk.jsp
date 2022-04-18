<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 확인</title>
</head>
<body>
	<%
 		String path = request.getRealPath("uploadfile");
		
		int size = 1024 * 1024 * 10; // 10메가
		
		String file = "";
		String orifile = "";
		
		try{
			
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			
			String str = (String) files.nextElement();
			
			file = multi.getFilesystemName(str);
			orifile = multi.getOriginalFileName(str);
			
			out.println("파일 업로드 성공");
		} catch(Exception e){
			e.printStackTrace();
		}
		
		
	%>
</body>
</html>
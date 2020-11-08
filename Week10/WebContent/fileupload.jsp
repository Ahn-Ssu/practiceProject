<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.crud.dao.MemberDAO, com.crud.bean.MemberVO"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
	String filename = "";
int sizeLimit = 15 * 1024 * 1024;

String realPath = request.getServletContext().getRealPath("upload");
File dir = new File(realPath);
if (!dir.exists())
	dir.mkdirs();

MultipartRequest multpartRequest = null;
multpartRequest = new MultipartRequest(request, realPath, sizeLimit, "uft-8", new DefaultFileRenamePolicy());

filename = multpartRequest.getFilesystemName("photo");
%>

파일명 : <%=filename%><br/>
<img src="${pageContext.request.contextPath }/upload/<%=filename%>">
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import = "com.model2.mvc.service.product.vo.ProductVO" %>

<%
ProductVO productVO = (ProductVO)request.getAttribute("productVO");

String menu = request.getParameter("menu");

Boolean updateChecker=false;

if(request.getParameter("updateChecker") != null) {
	updateChecker = Boolean.parseBoolean(request.getParameter("updateChecker"));
}

System.out.println(updateChecker);

%>

<html>
<head>
<title>��ǰ����</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">
<!--
function fncAddProduct(){
	//Form ��ȿ�� ����
	var name = document.detailForm.prodName.value;
	var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value;

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
		
	document.detailForm.action='/updateProduct.do';
	document.detailForm.submit();
}

function resetData(){
	document.detailForm.reset();
}
-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<% if(menu.equals("manage")) { %>
							��ǰ����
						<% } else if(menu.equals("search")){ %>
							��ǰ����ȸ
						<%}%>
					
					</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<% if(menu.equals("search")) { %>
	<tr>
		<td width="104" class="ct_write">
			��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105"><%=productVO.getProdNo()%></td>
				</tr>
			</table>
		</td>
	</tr>
	<%} %>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<%if(menu.equals("manage")) { %>
						<input type="text" name="prodName" value ="<%=productVO.getProdName()%>" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
						<%} else if(menu.equals("search")) {%>
								<%=productVO.getProdName() %>
						<%}%>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<%if(menu.equals("search")) { %>
	<tr>
		<td width="104" class="ct_write">
		��ǰ�̹��� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
						<%=productVO.getFileName()%>
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<%} %>
	
	<tr>
		<td width="104" class="ct_write">
			��ǰ������	<img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			
			
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<%if(menu.equals("manage")) { %>
						<input type="text" name="prodDetail" value ="<%=productVO.getProdDetail()%>" class="ct_input_g" 
								style="width: 100px; height: 19px" maxLength="20">
			<%} else if (menu.equals("search")){ %>
				<%= productVO.getProdDetail() %>
			<%} %>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			�������� 
			<%if(menu.equals("manage")) { %>			
			<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			<%} %>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<%if(menu.equals("manage")) { %>
						<input type="text" name="manuDate" value ="<%=productVO.getManuDate()%>" class="ct_input_g" 
								style="width: 100px; height: 19px" maxLength="20">
			<%} else if (menu.equals("search")){ %>
				<%= productVO.getManuDate() %>
			<%} %>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			���� 
			<%if(menu.equals("manage")) { %>	
			<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			<%} %>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<%if(menu.equals("manage")) { %>
						<input type="text" name="price" value ="<%=productVO.getPrice()%>" class="ct_input_g" 
								style="width: 100px; height: 19px" maxLength="20">
			<%} else if (menu.equals("search")){ %>
				<%= productVO.getPrice() %>
			<%} %>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<%if(menu.equals("manage")) { %>
	<tr>
		<td width="104" class="ct_write">��ǰ�̹���</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">

						<input type="text" name="fileName" value ="<%=productVO.getFileName()%>" class="ct_input_g" 
								style="width: 100px; height: 19px" maxLength="20">
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<%} %>
	<%if(menu.equals("search")) { %>
	<tr>
		<td width="104" class="ct_write">�������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">2012-10-14</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<%} %>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<%if(!updateChecker) {%>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					<%if(menu.equals("manage")) { %>
						<%session.setAttribute("prodNo", request.getParameter("prodNo")); %>
						<a href="javascript:fncAddProduct();">����</a>
					<%} else if(menu.equals("search")) {%>
						<a href="/addPurchaseView.do?prodNo=<%=productVO.getProdNo()%>">����</a>
					<%} %>
					</td>
					
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
					
					
						<a href="javascript:history.go(-1)">
						<%if(menu.equals("manage")) { %>
							���
						<%} else if(menu.equals("search")) {%>
							����
						<%} %>
						</a>
					</td>
				<%} else {%>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					<a href="/listProduct.do?menu=manage">Ȯ��</a>
					</td>
				<%} %>
				
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				
			</tr>
		</table>
		</td>
	</tr>
</table>

</form>
</body>
</html>
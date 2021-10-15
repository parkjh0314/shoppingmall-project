<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<%
   String ctxPath = request.getContextPath();
%>


<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Admin name</title>

  <!-- Custom fonts for this template -->
  <link href="../admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../admin/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="../admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
  <script type="text/javascript" src="/Covengers/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
</head>

<style>
   td, th {
        white-space: nowrap;
   }
</style>
   
<script>
   
   $(document).ready(function() {
      
      $("tr.memberInfo").click(function() {
                  
         var userno = $(this).children("td.userno").text();
         
         var frm = document.cartGoFrm;
         frm.userno.value = userno;
         
         frm.action = "<%= ctxPath%>/product/showUserCart.com";
         frm.method = "POST";
         frm.submit();
         
      });
      
      
   });
   
   
</script>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin/index.html">
        <div class="sidebar-brand-icon rotate-n-15">
        <br>
        </div>
        <div class="sidebar-brand-text mx-3"></div>
      </a>



      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
           관리자 메뉴
      </div>



      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="/Covengers/covengers.com">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="/Covengers/member/memberList.com">
          <i class="fas fa-fw fa-table"></i>
          <span>사용자 관리</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="/Covengers/product/productList.com">
          <i class="fas fa-fw fa-table"></i>
          <span>상품 관리</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="/Covengers/admin/productRegister.com">
          <i class="fas fa-fw fa-table"></i>
          <span>상품 등록</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="/Covengers/admin/mainProductRegister.com">
          <i class="fas fa-fw fa-table"></i>
          <span>MainPage 상품 등록</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">


      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">사용자 목록</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary"></h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>사용자 Number</th>
                      <th>이름</th>
                      <th>이메일</th>
                      <th>핸드폰번호</th>
                      <th>주소</th>
                      <th>성별</th>
                      <th>생년월일</th>
                      <th>기호</th>
                      <th>point</th>
                      <th>회원가입일자</th>
                      <th>마지막 로그인 시간</th>
                      <th>회원상태</th>
                      <th>활동상태</th>
                    </tr>
                  </thead>
                  <tbody>
                        <c:forEach var="mvo" items="${mList}">
                          <tr class="memberInfo">
                            <td class="userno">${mvo.userno}</td>
                            <td>${mvo.name}</td>
                            <td>${mvo.email}</td>
                            <td>${mvo.mobile}</td>
                            <td>${mvo.postcode}&nbsp;${mvo.address}&nbsp;${mvo.detailAddress}&nbsp;${mvo.extraAddress}</td>
                        <td>
                           <c:choose>
                           
                              <c:when test="${mvo.gender eq '1'}">
                                 남
                              </c:when>
                              
                              <c:otherwise>
                                 여
                              </c:otherwise>
                              
                           </c:choose>
                        </td>
                            <td>${mvo.birthday}</td>
                            <td>
                               <c:forEach var="taste" items="${mvo.taste}">
                                     ${taste}&nbsp;
                               </c:forEach>
                            </td>
                            <td>${mvo.point}</td>
                            <td>${mvo.registerday}</td>
                            <td>${mvo.lastpwdchangedate}</td>
                            <td>
                        <c:choose>
                        
                           <c:when test="${mvo.status eq 1}">
                              사용가능
                           </c:when>
                           
                           <c:otherwise>
                              회원탈퇴
                           </c:otherwise>
                           
                        </c:choose>
                            </td>
                            <td>
                        <c:choose>
                        
                           <c:when test="${mvo.idle eq 1}">
                              휴면계정
                           </c:when>
                           
                           <c:otherwise>
                              활동중
                           </c:otherwise>
                           
                        </c:choose>
                            </td>
                          </tr>
                      </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">Ã </span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <%-- ======================================= --%>
  <form name="cartGoFrm">
     <input type="hidden" name="userno" /> 
  </form>
  <%-- ======================================= --%>
  

  <!-- Bootstrap core JavaScript-->
  <script src="../admin/vendor/jquery/jquery.min.js"></script>
  <script src="../admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="../admin/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="../admin/js/demo/datatables-demo.js"></script>
  
</body>

</html>
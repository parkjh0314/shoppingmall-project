<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Covengers Admin - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

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

	<jsp:include page="..\covengers_admin\covengers_admin_contents.jsp"></jsp:include>

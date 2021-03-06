<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   String ctxPath = request.getContextPath();

   String check = (String)request.getAttribute("check");
   
%>

<jsp:include page="../covengers_header.jsp"></jsp:include>

<style>
#black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }

.modal-con{
  display:none;
  position:fixed;
  top:45%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 60%;
  min-height: 20%;
  background: white;
  z-index: 2;
}
.modal-con .title{
  font-size:20px; 
  padding: 20px; 
}
.modal-con .con{
  font-size:15px; line-height:1.3;
  padding: 30px;
}
.modal-con .close{
  display:block;
  font-weight: bold;
  position:absolute;
  width:30px; height:30px;
  border-radius:50%; 
  border: 3px solid white;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color: white; font-size:20px; font-weight: bold;
  right:10px; top:10px;
}
/****************************************************************************************************  */
/* product detail jsp css */
* {
   box-sizing: border-box;
}


/* Position text in the middle of the page/image */
#bg-product-dp {
   background-color: rgb(255, 255, 255); /* Fallback color */
   /* background-color: rgba(255, 255, 255, 0.8); */
   /* Black w/opacity/see-through */
   /* color: white; */
   font-weight: bold;
   /* border: 3px solid #f1f1f1; */
   position: absolute;
   top: 58%;
   left: 50%;
   transform: translate(-50%, -50%);
   z-index: 0;
   width: 60%;
   min-width: 700px;
   height: 90%;
   padding: 20px;
   text-align: center;
   border-radius: 20px;
}
/*************************************************************************]] */
div#product-name {
   width: 90%;
   height: 18%;
   margin: 2px auto;
   color: black;
}

div#inner-product-dp {
   width: 90%;
   height: 400px;
   overflow: hidden;
   margin: auto;
}

div.product-img-dp {
   height: 400px;
   width: 450px;
   line-height: 1px; 
   padding: 2%;
   border-radius: 4%;
   overflow: auto;
}

div#inner-product-dp img {
   width: 100%;
   height: 100%;
   vertical-align: middle;
}

div.product-detail-dp {
   height: 100%;
   padding: 3%;
   /* border: double 5px gray; */
   border-radius: 4%;
   
   
}

/***************************************************************************  */
/* ???????????? ????????????  */

div#inner-product-menu {
   width: 90%;
   height: 18%;
   margin-top: 10px;
   margin: auto;
   background-color: rgba(0, 0, 0, 0);
   overflow: auto;
   padding: 40px 0;
}

div#product-menu {
   overflow: hidden;
   background-color: rgba(0, 0, 0, 0);
   color: black;
   text-align: center;
   width: 100%;
   height: 100%;
}

/* Style the buttons that are used to open the tab content */
#product-menu button {
   background-color: inherit;
   display: inline-block;
   margin: 0 20px;
   border: none;
   outline: none;
   cursor: pointer;
   padding: 14px 16px;
   transition: 0.3s;
   width: 15%;
}

/* Change background color of buttons on hover */
#product-menu button:hover {
   background-color: #ddd;
}

/* Create an active/current tablink class */
#product-menu button.active {
   background-color: #ccc;
}

/* Style the tab content */
.product-detail {
    display: none;
   color: black;
   width: 100%;
   height: 100%;
   text-align: center;
   overflow: auto;
   
}

.product-detail {
   animation: fadeEffect 0.5s; /* Fading effect takes 1 second */
}

/* Go from zero to full opacity */
@keyframes fadeEffect {
      from {opacity: 0;
   }
   
   to {
      opacity: 1;
   }
}

.detail_title {
   color: gray;
   font-size:13pt;
}
/**************************************************************************  */
button.btn-action {
   display: inline-block;
   text-align: center;
   margin: 5px 15px;
}

.swiper-container {
      width: 100%;
      height: 80%;
      margin-top: 30px;
}

.swiper-slide {
      text-align: center;
      font-size: 18px;
      background: rgba(255,255,255 , 1.0);
      overflow: hidden;

    /*  Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
/* ***************************************************************************** */
/* .product-detail { display:none; } */
.product-detail::-webkit-scrollbar { width: 0px; height: 0px;}
.product-detail::-webkit-scrollbar-track-piece  { background-color: rgba(0,0,0,0.7);}
.product-detail::-webkit-scrollbar-thumb:vertical {height: 4px; border-radius:8px; color: black;}
</style>


<c:if test="${not empty productList }">
   <div style="height: 90%; width:20%; position: absolute; top: 65%; left: 90%; transform: translate(-50%, -50%);" align="center">
      <div>
         <h3>????????????</h3>
      </div>
      <div style="width: 90%; height: 90%; margin-top: 20px; overflow: hidden;">
         
         <div class="swiper-container" style="overflow: hidden;">
            <div class="swiper-wrapper" >
               <c:forEach var="product" items="${productList}">
                  <div class="swiper-slide">
                     <div style="margin: 20px;">
                        <div class="image" style="text-align: center;">
                           <a href="<%=ctxPath%>/product/productDetail.com?productcode=${product.productcode}">
                              <img src="/Covengers/images/${product.productimg1}" alt="${product.krproductname}" width="100%" height="100%" style="float:center;">
                           </a>
                           <p style="font-size:10px;"><a href="<%=ctxPath%>/product/productDetail.com?productcode=${product.productcode}">${product.krproductname}</a></p>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div>
            
            
         
         <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
      
         <!-- Initialize Swiper -->
         <script>
            var swiper = new Swiper('.swiper-container', {
                 direction: 'vertical',
                 slidesPerView: 2,
                 spaceBetween: 20,
                 mousewheel: true,
                 freeMode: true,
                 /* loop: true, */
                 autoplay: {
                     delay: 3000,
                     disableOnInteraction: false,
                   },
                /*  autoHeight: true, */
                 pagination: {
                   el: '.swiper-pagination',
                   clickable: true,
                 },
             });
         </script>
         </div>
      </div>
   </div>

</c:if>


<div id="bg-product-dp">
   <div id="product-name">
      <h2>${product.enproductname}</h2>
      <h2>${product.krproductname}</h2>
   </div>
   
   <div id="inner-product-dp">
      <div class="col-md-6 product-img-dp" align="center">
         <img src="/Covengers/images/${product.productimg1}">
      </div>

      <div class="col-md-1"></div>
      
      <div class="col-md-5 product-detail-dp">
         <div id="detail" class="product-detail">
            <h3>${product.enproductname}</h3>
            <p><fmt:formatNumber value="${product.saleprice}" pattern="#,###" />???</p>
            <hr style="border: solid 1px black;">
            <p>${product.productdesc1}</p>
            <br>
            
            
            <!-- <span onclick="this.parentElement.style.display='none'">x</span> -->
         </div>

            <div id="info" class="product-detail">
               <h3>??????????????????</h3>
               <hr style="border: solid 1px black;">
               <p><strong class="detail_title">????????????</strong><br><br>${product.manufacturedate}</p>
               <hr>
               <p><strong class="detail_title">????????????</strong><br><br>${product.expiredate}</p>
               <hr>
               <p><strong class="detail_title">?????????</strong><br><br>${product.origin}</p>
               <hr>
               <p><strong class="detail_title">????????????</strong><br><br>${product.ingredient}</p> 
               <hr>
               <p><strong class="detail_title">??????????????????</strong><br><br>${product.precautions}</p> 
            </div>

         <div id="review" class="product-detail">
            <div>
               <h3>??????</h3>
               <hr style="border: solid 1px black;">
               <c:if test="${reviewList.size() ne 0 }">
               
               <c:forEach var="review" items="${reviewList}">
                  
                     <c:if test="${fn:length(review.rcontents) <= 40 }">
                        <span style="color: #cc66ff;">${review.rcontents }</span>
                     </c:if>
                     
                     <c:if test="${fn:length(review.rcontents) > 40 }">
                        <c:set var="contents" value="${ fn:substring(review.rcontents, 0, 40)}"></c:set>
                        <c:set var="contents" value="${fn:replace(contents,'<br>', ' ') }"></c:set>
                        <span style="color: #cc66ff;">${contents }...</span>
                     </c:if>
                  <br>
                  <span>????????? : ${review.email }</span>
                  <br><br>
               </c:forEach>
               </c:if>
               <c:if test="${reviewList.size() eq 0 }">
                  <span>????????? ????????? ????????????...</span>
                  <br>
                  <span>????????? ?????? ???????????? ???????????????!</span>
                  
               </c:if>
               
               
               
               
            </div>
         </div>
         
         <div id="order" class="product-detail">
         
            <div id="select-product-option" style="position: relative; font-family: Arial;">
               <h3>????????????</h3>
               <hr style="border: solid 1px black;">
               <div style="margin-bottom: 10px;">
                  <div class="col-md-5" >
                  
                     <label style="font-size: 14pt; display: inline-block; width: 200px;">??????</label>
                     <br>
                     <span id="showPrice"><fmt:formatNumber value="${product.saleprice}" pattern="#,###" /></span>???
                  </div>
                              
                  <div class="col-md-7">
                     <label style="font-size: 14pt; display: inline-block; width: 200px;">???????????? </label>
                     <br>
                      <select id="selected-option" name="selected-option">
                      <c:if test="${optionListSize ne 0 }">
                        <c:forEach var="option" items="${optionList}" varStatus="status">   
                           <c:choose>
                              <c:when test="${status.index eq 0}">
                                                            
                                 <option value="${option.optioncode}" selected>${option.optionname} - (+<fmt:formatNumber value="${option.addprice}" pattern="#,###" />???)</option>                        
                              </c:when>
                              <c:otherwise>
                              
                                 <option value="${option.optioncode}">${option.optionname} - (+<fmt:formatNumber value="${option.addprice}" pattern="#,###" />???)</option>                        
                              </c:otherwise>
                           </c:choose>
                           
                        </c:forEach>                      
                      </c:if>
                      
                      <c:if test="${optionListSize eq 0 }">
                         <option  selected disabled >???????????? ????????????</option>
                      </c:if>
                        
                     </select> 
                  </div>
               </div>
               
               <br>
               <br>
               <br>
               <br>
               

               <c:if test="${optionListSize eq 0 }">
                  <div>
                      <p style="font-size: 14pt;">???????????????.<br>?????? ?????? ???????????? ????????????.</p>
                      <br>
                   </div>
                   <hr>
                   <div align="center">
                      <button class="btn-action" type="button" value="back" onclick="shopping()">????????????</button>                      
                   </div>
                </c:if>
                <c:if test="${optionListSize ne 0 }">
                   <div class="col-md-5"></div>
                  <div class="col-md-7">
                     <label style="font-size: 14pt; display: inline-block; width: 200px;">???????????? </label>
                     <br>
                     <button type="button" id="down" onclick="doDown();"> - </button><input type="text" value="1" id="orderQuantity" name="orderQuantity" readonly size="5" ></input><button type="button" id="up" onclick="doUp();"> + </button>
                  </div>
                  
                  <br>
                  <br>
                  <br>
                  <br>
                  
                  
                  <div>                  
                     <label style="font-size: 14pt; display: inline-block; width: 200px;">??? ?????? </label>
                     <br>
                     <span id="totalPrice"><fmt:formatNumber value="${product.saleprice}" pattern="#,###" /></span>???
                  </div>
                  <br>
                  <div align="center">
                     <button class="btn btn-default btn-action" type="button" value="cart" onClick="goCart()"><strong>???????????? ??????</strong></button>
                     <button class="btn btn-default btn-action" type="button" value="order" onclick="goOrder()"><strong>???????????????~</strong></button>
                  </div>
                  
                </c:if>
               
               
               
            </div>
            
            <!-- ????????? ????????? ?????? ????????? -->
            <form name="orderDetail">
               <!-- ????????? ????????? ????????? ???????????? ????????? ?????? ????????? -->
               <input type="hidden" id="userno" name="userno" value="${sessionScope.loginuser.userno}">
               <input type="hidden" id="productcode" name="productcode" value="${product.productcode}" />
               <input type="hidden" id="poqty" name="poqty" />
               <input type="hidden" id="pprice" name="pprice" />
               <input type="hidden" id="totalprice" name="totalprice" />
               <input type="hidden" id="optioncode" name="optioncode" />
            </form>

            
         
         </div>
      </div>

   </div>
   <div id="inner-product-menu" align="center">
      <div id="product-menu">
         <button class="tablinks" onclick="openDetail(event, 'detail')" id="defaultOpen">????????????</button>
         <button class="tablinks" onclick="openDetail(event, 'info')">??????????????????</button>
         <button class="tablinks" onclick="openDetail(event, 'review')">????????????</button>
         <button class="tablinks" onclick="openDetail(event, 'order')">????????????</button>
      </div>
   </div>


<!---------------------------------------------------------------------------------------------------------------------->

   <script type="text/javascript">
      
      function openModal(modalname){
       /*  $('#modal1').modal({backdrop: 'static', keyboard: false}) ; */
       document.querySelector('#black_bg').style.display ='block';

       $(".modal1").fadeIn(300);
        
      }

      
      
      $(document).ready(function(){
      
         $(".close").on('click',function(){
   
           $(".modal-con").fadeOut(300);
            document.querySelector('#black_bg').style.display ='none';
           history.back();
         });
          
          if(<%= check %> != null) {
             openModal('modal1');        
          }
          
         showPrice();
         
         
         $("select[id=selected-option]").change(function(){
            showPrice();
         });
         
      });
      
      document.getElementById("defaultOpen").click();
      
      
      // ??????????????? ????????? ???????????? ????????? ???????????? ?????????
      function showPrice() {
         
         var index = $("#selected-option option").index( $("#selected-option option:selected"));
         var optionListSize = ${optionListSize};
         var price = ${product.saleprice};
         var addpriceList = new Array();
         if (optionListSize != 0) {
            
            <c:forEach items="${optionList}" var="option">
               addpriceList.push(${option.addprice});
            </c:forEach>
            
            for(var i = 0; i < optionListSize; i ++) {
               if (index == 0) {
                  
                  $("span#showPrice").html(price);
                  $("input:text[name=orderQuantity]").val(1);
                  checkTotalPrice();
                  return;
               }
               else if (index == i) {
                  price = price + addpriceList[i];
                  $("span#showPrice").html(price);
                  $("input:text[name=orderQuantity]").val(1);
                  checkTotalPrice();
                  return;
               }
            }
         } else {
            return;
         }
         
         
         
      }
      
      // ?????? ????????? ????????? ????????? ?????? ????????? ?????? ???????????? ????????? ?????????
      function openDetail(evt, contents) {
         // Declare all variables
         var i, productDetail, tablinks;

         // ??? ?????? ???????????????
         productDetail = document.getElementsByClassName("product-detail");
         for (i = 0; i < productDetail.length; i++) {
            productDetail[i].style.display = "none";
         }

         // ????????? ????????? ????????????
         tablinks = document.getElementsByClassName("tablinks");
         for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
         }

         // Show the current tab, and add an "active" class to the button that opened the tab
         document.getElementById(contents).style.display = "block";
         evt.currentTarget.className += " active";
      }
      
      // ?????? ????????? 1?????? ?????? ??? ?????? ?????????
      function doDown() {
         
         var quantity = (Number)($("input:text[name=orderQuantity]").val());
         if (quantity == 1) {
            return;
         } else  {
            $("input:text[name=orderQuantity]").val(quantity - 1);
         }
         
         
         checkTotalPrice();
         
         
      }
      
      // ?????? ????????? 1?????? ?????? ??? ?????? ?????????
      function doUp() {
         
         var quantity = (Number)($("input:text[name=orderQuantity]").val());
         
         $("input:text[name=orderQuantity]").val(quantity + 1);
         
         
         checkTotalPrice();
         
         
      }
      
      // ?????? ????????? ????????? ?????? ???????????? ?????????
      function checkTotalPrice() {
         var price = (Number) ($("span#showPrice").text());  // ????????? ????????? ????????????
         var quantity = (Number) ($("input:text[name=orderQuantity]").val());  // ???????????? ??????
         
         $("span#totalPrice").html(price * quantity);
         
      }
      
      
      // ??????????????? ???????????? ?????????
      function goCart() {
         
         
            var frm = document.orderDetail;
            frm.poqty.value = $("input#orderQuantity").val();
            frm.pprice.value = $("span#showPrice").text();
            frm.optioncode.value = $("select#selected-option option:selected").val();
            
            frm.action = "<%= ctxPath%>/product/productPutCart.com";
            frm.method = "POST";
            frm.submit();
         
         
         
         
      }
      
      // ?????? ?????? ????????? ????????? ?????? ???????????? ???????????? ??????
      function goOrder() {
         
         
         var frm = document.orderDetail;
         frm.pprice.value = $("span#showPrice").text();
         frm.poqty.value = $("input#orderQuantity").val();
         frm.totalprice.value = $("span#totalPrice").text();
         frm.optioncode.value = $("select#selected-option option:selected").val();
         
         frm.action = "<%= ctxPath%>/payment/cardSlash.com";
         frm.method = "POST";
         frm.submit();
      }
      
      /* ??????????????? ?????? ???????????? ????????? ??????????????? ?????? ?????? ????????? ???????????? ?????????*/
      function shopping() {
         history.back();
         
      }
      
      /* ??????????????? ????????????????????? ????????? ??????????????? ?????? ?????? ????????? ???????????? ?????????*/
      function cart() {
         location.href="<%= ctxPath %>/product/myCart.com";
         
      }
      
   </script>
   
   <!-- ??????????????? ?????? ???????????? ???????????? ?????????! -->
   
</div>

<div class="bg" id="black_bg"></div>
   <div class="modal-con modal1" id="modal1">
      <a href="javascript:;" class="close">&times;</a>
      <div class="con title" style="background-color: black;" align="center">
         <span style="color: white; font-size: 15pt;">::?????? ?????? ??????::</span>
      </div>
      
      <button type="button" style="margin: 35px 30px 30px 30px; color: black;" onclick="shopping()">??????????????????</button>
      <button type="button" style="margin: 35px 30px 30px 30px; color: black;" onclick="cart()">?????????????????????</button>
         
   </div>

<jsp:include page="../covengers_footer.jsp"></jsp:include> 
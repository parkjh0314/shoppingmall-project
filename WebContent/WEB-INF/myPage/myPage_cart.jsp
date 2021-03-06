<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
   String ctxPath = request.getContextPath();
%>

<jsp:include page="../covengers_header.jsp"></jsp:include>

<style type="text/css">

   div#container {
      /* border: solid 1px yellow; */
      width: 1300px;
      margin: 30px auto;
      padding-bottom: 200px;
   }

   div#miniContainer {
/*       border: solid 1px red; */
      width: 700px;
      margin: 0 auto;
      text-align: center;
      display: inline-block;
	  float: left;
	  padding-bottom: 13%;
   }
   
   span.head {
      margin: 0 60px;
      font-size: 15pt;
   }

   div.item {
      border: solid 2px #d6d6c2;
      width: 680px;
      height: 200px;
      display: inline-table;
   }

   div#allCheckBox, .individualCheck {
      float: left;
	  margin-left: 10px; 
   }
   

   img.pd {
      /*       border: solid 1px red; */
      width: 130px;
      height: 170px;
   }

   div.item_product {
      /*       border: solid 1px blue; */
      /*       float: left; */
      margin: 0 35px;
   }

   span.cost {
      /*       border: solid 1px red; */
      /*       float: left; */
      margin: 35px 35px;
      width: 80px;
      text-align: right;
   }

   input.poqty {
      /*       border: solid 1px red; */
      /*       float: left; */
      margin: 35px 55px;
      width: 80px;
      text-align: right;
   }

   .left {
      float: left;
      margin-left: 30px;
      
   }

   .productImg {
      float: left;
      /*    border: solid 1px red; */
   }
   
   div#rightDiv {
	  position: fixed;
	  top: 40%; 
	  left: 68%; 
   	  background-color: #f2f2f2;
   	  border-radius: 2%;
   }
  
   button.mybtn {
      border: none;
   	  margin: 10px 10px;
   	  padding: 7px 7px;
   	  background-color: black;
   	  color: white;
   	  border-radius: 5%;
   }
   
   button:hover {
   	  font-weight: bold;
   }
   
   button.mybtn2 {
      border: none;
   	  margin: 10px 10px;
   	  padding: 3px 5px;
   	  border-radius: 5%;
   	  background-color: white;
   	  color: black;
   }
   
   
    .order-con {
    	list-style: none;
    }
   	.order-wrap .order-con li:last-child {
   		border-top: 1px solid #444;
	}
	.order-wrap .order-con li span:nth-child(2), span:last-child {
   		float:right;
	}
	
	.order-wrap .order-con {
	    padding: 0 10px;
	    text-align: left;
	}
	
	.order-wrap .order-con li {
		margin: 10px 0;
	}
	
	.order-con li > span:nth-child(2) {
		float:right;
	}
	
	
	div#menu {
/*     	border: solid 1px yellow; */
		width: 250px;
		margin: 100px auto;
		float: left;
		padding: 20px 20px;
		text-align: left;
	}
	
		
	div#menu > ul {
		padding: 0;
		/* line-height: 30px; */
		font-size: 12pt;
	}
	
	ul#menu > li {
		list-style: none;
		cursor: pointer;
		margin: 15px 0;
	}
	
	ul#menu > li > span > img {
		width: 25px;
		height: 25px;
	}
	
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

   $(document).ready(function () {

	   // ??????????????? ???????????? ????????? ?????? ??????.
	    $("div#menu").find("span").each(function() {
			$(this).html("<img src='<%=ctxPath %>/images/perfumeicon3.png' width='25px;' height='25px;' />");
		});
		
		$("div#menu").find("li").hover(function(event) {
			$(this).find("span").html("<img src='<%=ctxPath %>/images/perfumeicon4.png' width='25px;' height='25px;' />");
		}, function(event) {
			$(this).find("span").html("<img src='<%=ctxPath %>/images/perfumeicon3.png' width='25px;' height='25px;' />");
		}); 
	  
	   ///////////////////////////////////////////////////
      calSumPrice();

      // === "?????? ????????????" ?????????  ????????? ?????? ???????????? ?????????.
      $("button#goBack").click(function() {

         history.back();

      });// end of $("button#goBack").click(function() {});----------------------

      // === ?????? ??????/?????? ??????????????? ???????????? ???, ?????? ??????????????? ?????? ????????? ?????? ?????? ??????????????? ????????? ??????.
      $("input#allCheck").click(function () {
    	  
         var bCheckboxState = $("input#allCheck").prop("checked");

         if (bCheckboxState) {
            $("input.individualCheck").prop("checked", true);
         } else {
            $("input.individualCheck").prop("checked", false);
         }
         calSumPrice();
      });// end of $("input#allCheck").click(function() {});--------------------------------

      // === ?????? ??????????????? ????????? 1????????? ????????? ???????????? ???????????? ????????????/???????????? ??????????????? ????????? ????????????
      //     ?????? ??????????????? ????????? ?????? ????????? ???????????????  ???????????? ????????????/???????????? ??????????????? ????????? ??????????????? ???.=
      $("input.individualCheck").click(function () {

         var bCheckboxState = $(this).prop("checked");
         if (!bCheckboxState) {
            // ????????? ??????????????? ????????? ???????????? ?????? ??????/?????? ??????????????? ?????? ??????.
            $("input#allCheck").prop("checked", false);
         } else {
            // ????????? ??????????????? ????????? ???????????? ?????? ?????? ??????????????? ???????????? ?????? ????????? ????????? ???, 
            // ?????? ??????/?????? ??????????????? ?????? ??????.
            var flag = true;
            $("input.individualCheck").each(function () {
               if (!($(this).prop("checked"))) {
                  flag = false;
               }
            });

            if (flag) {
               $("input#allCheck").prop("checked", true);
            }
         }// end of if (!bCheckboxState) {}else{}------------------------------------------
      });// end of $("input.individualCheck").click(function() {});-------------------------


      // === ????????? ?????? input????????? ???????????? ???????????? ???, ?????? ????????? ?????? ?????? ????????? ???????????? ???.
      $("input.poqty").click(function () {

    	 // ??? ????????? ?????? ????????? ?????????.
    	 var iPrice =  Number($(this).parent().find($("input.ipPrice")).val()); 
    	 
    	 if ($(this).val() <= 0) {
            $(this).val(1);
         }

         var pPrice = Number($(this).parent().find($("span.pPrice")).text());
         var poqty = $(this).val();

         // hidden input ????????? ?????? ????????? ?????? ??????.
         $(this).siblings("input.itotalPrice").val(iPrice * poqty);
         var totalPrice = $(this).siblings("input.itotalPrice").val();
         
         $(this).parent().find($("span.totalPrice")).text("???"+comma(totalPrice));

         calSumPrice();

      });// end of $("input.poqty").click(function() {});-----------------------------------


      // === ????????? ?????? input????????? ????????? ???????????? ???, ?????? ????????? ?????? ?????? ????????? ???????????? ???.
      $("input.poqty").blur(function () {

    	// ??? ????????? ?????? ????????? ?????????.
     	 var iPrice =  Number($(this).parent().find($("input.ipPrice")).val());
    	  
    	 if ($(this).val() <= 0) {
            $(this).val(1);
         }

    	 var pPrice = Number($(this).parent().find($("span.pPrice")).text());
         var poqty = $(this).val();
    	 
    	 // hidden input ????????? ?????? ????????? ?????? ??????.
         $(this).siblings("input.itotalPrice").val(iPrice * poqty);
         
         var totalPrice = $(this).siblings("input.itotalPrice").val();
         $(this).parent().find($("span.totalPrice")).text("???"+comma(totalPrice));
         
    	 
         calSumPrice();

      });// end of $("input.poqty").blur(function() {});-------------------------------------

      // === ????????? ?????? input????????? ????????? ???????????? ???, ?????? ????????? ?????? ?????? ????????? ???????????? ???.
      $("input.poqty").keyup(function (event) {

    	 // ??? ????????? ?????? ????????? ?????????.
     	 var iPrice =  Number($(this).parent().find($("input.ipPrice")).val());
    	  
    	 if (event.keyCode == 13) {
            if ($(this).val() <= 0) {
               $(this).val(1);
            }
        
            var pPrice = Number($(this).parent().find($("span.pPrice")).text());
            var poqty = $(this).val();

            $(this).siblings("input.itotalPrice").val(iPrice * poqty);
            
            var totalPrice = $(this).siblings("input.itotalPrice").val();
            $(this).parent().find($("span.totalPrice")).text("???"+comma(totalPrice));

            calSumPrice();
         }
      });// end of $("input.poqty").blur(function() {});-------------------------------------

      
      // === ??????????????? ????????? ???, ??????????????? ????????? ???????????? ???????????? ?????? ????????? ???????????? ???.
      $("input.individualCheck").bind("click",function() {
    	  calSumPrice();
	  });
      

      // === ?????? ????????? ????????? ?????? ????????? ????????? ????????? ???????????? ???????????? ??????????????? ???.
      $("button.save").click(function () {
         // alert("??????????????? ??????");

         var poqty = $(this).parent().find($("input.poqty")).val();
         var cartno = $(this).parent().find($("input.cartno")).val();

         $.ajax({
            url: "<%= ctxPath%>/product/myCartSave.com",
            data: { "poqty": poqty, "cartno": cartno },
            type: "post"
         });

      });// end of $("button#save").click(function() {});----------------------------------- 

      
      // === "????????????" ????????? ????????? ?????? ????????? ?????? ???????????? ???????????? ??????????????? ???.
      $("button#allDelete").click(function () {
         location.href = "<%= ctxPath%>/product/myCartAllDelete.com";
      });// end of $("button#allDelete").click(function() {});------------------------------

      
      // === "????????????" ????????? ????????? ??????????????? ????????? ???????????? ?????????????????? ??????????????? ???.
      $("button#selectDelete").click(function () {

         var arrcartno = [];

         $("input.individualCheck").each(function (index, item) {
            if ($(this).prop("checked")) {
               arrcartno.push($(this).parent().find($("input.cartno")).val());
            }
         });
         var scartno = arrcartno.join(',');

         $.ajax({
            url: "<%= ctxPath%>/product/myCartSelectDelete.com",
            data: { "scartno": scartno },
            type: "post",
         });

         location.reload();
      });

      // === "??????" ????????? ????????? ??????????????? ??????
      $("button.individualDelete").click(function (event) {

         var cartno = $(this).parent().find($("input.cartno")).val();

         $.ajax({
            url: "<%= ctxPath%>/product/myCartDeleteOne.com",
            data: { "cartno": cartno },
            type: "post"
         });
         location.reload();
      });


      // === "?????? ?????? ????????????" ????????? ????????? ???????????? ????????? form??? ???????????? ???. 
      $("button#checkedCardSlash").click(function () {
    	  
    	 if ($("input:checkbox[class=individualCheck]:checked").length == 0) {
	         alert("???????????? ????????? ??????????????????!!");
    	 }else{
    		 var poqty = 0;
    		 var cartno = 0;
    		 // ?????? ????????? ?????? ????????? DB????????? update??????. 
        	 $("div.item").each(function() {
        		 poqty = $(this).find($("input.poqty")).val();
                 cartno = $(this).find($("input.cartno")).val();

                 $.ajax({
                    url: "<%= ctxPath%>/product/myCartSave.com",
                    data: { "poqty": poqty, "cartno": cartno },
                    type: "post",
                    success:function(){
	                     // ?????? ??????
	               		 var arrcartno = [];
	               		 var arroption = [];
	               		 
	               		 var cartno = 0;
	               		 var option = 0;
	               		 // ??? ????????? ??????????????? ??????
	               		 $("input.individualCheck").each(function () {
	           				
	               			// ??????????????? ???????????? ???????????? ??????(cartno)?????? ????????? ??????.
	               			// ??????????????? ???????????? ????????????(optionno)?????? ????????? ??????.
	               	     	if ($(this).prop("checked")) {
	               	     		
	               	     		cartno = $(this).parent().find($("input.cartno")).val().trim();
	               	     		if (cartno != "") {
	           	    	     		arrcartno.push(cartno);
	           					}
	               	     		
	               	     		option = $(this).parent().find($("input.optionno")).val().trim();
	               	     		if (option != "") {
	               	     			arroption.push(option);
	           					}
	               	        }
	               	     });
	               	     
	               		 // ????????? ?????? ????????? ,???????????? ???????????? ???????????? ??????
	               		 var scartno = arrcartno.join(',');
	               		 var soption = arroption.join(',');
	               		 
	               		 // ????????? ?????? purchasecartno????????? ????????? ??????
	               		 $("input[name=purchasecartno]").val(scartno); 
	               		 $("input[name=purchaseoption]").val(soption); 
	               		 
	               		 var frm = document.cartForm;
	               	     frm.action = "<%= ctxPath%>/payment/cardSlash.com";
	                   	 frm.method = "post";
	                     frm.submit();
        			},
        			error:function(request, status, error){
        	        	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        			}
                 });
    		 });
 		 }
      });// end of $("button#checkedCardSlash").click(function () {});-----------------------------
      
      
      // === "?????? ?????? ????????????" ????????? ????????? ???????????? ????????? form??? ???????????? ???. 
      $("button#cardSlash").click(function () {
    	 
    	 // ?????? ????????? ??????????????? true??? ??????. 
    	 $("input.individualCheck").each(function () {
        	  $(this).prop("checked", true);
         });
    	 // ?????? ?????? ??????, ?????????, ???????????? ??????
    	 calSumPrice();
    	  
 		 var poqty = 0;
 		 var cartno = 0; 
    	 // ?????? ????????? ?????? ????????? DB????????? update??????. 
    	 $("div.item").each(function() {
    		 poqty = $(this).find($("input.poqty")).val();
             cartno = $(this).find($("input.cartno")).val();

             $.ajax({
                url: "<%= ctxPath%>/product/myCartSave.com",
                data: { "poqty": poqty, "cartno": cartno },
                type: "post",
                success:function(){
	               	 // ?????? ??????
	           		 var arrcartno = [];
	           		 var arroption = [];
	           		 
	           		 // ??? ????????? ???????????? ????????? ????????? ??????
	           		 $("input.cartno").each(function() {
	           			 if ( $(this).val().trim() != "" ) {
	           	         	arrcartno.push($(this).val().trim());
	           			 }
	           		 });
	           		 // ??? ????????? ?????? ????????? ????????? ??????
	           		 $("input.optionno").each(function() {
	           			 if ( $(this).val().trim() != "" ) {
	           			 arroption.push($(this).val().trim());
	           			 }
	           		 });
	           		 // ????????? ?????? ????????? ,???????????? ???????????? ???????????? ??????
	           		 var scartno = arrcartno.join(',');
	           		 var soption = arroption.join(',');
	           		 
	           		 // ????????? ?????? purchasecartno????????? ????????? ??????
	           		 $("input[name=purchasecartno]").val(scartno); 
	           		 $("input[name=purchaseoption]").val(soption); 

           		 	 var frm = document.cartForm;
               	 	 frm.action = "<%= ctxPath%>/payment/cardSlash.com";
                     frm.method = "post";
                     frm.submit();
				},
				error:function(request, status, error){
	        		alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
            });
		 });
      });// end of $("button#cardSlash").click(function () {});---------------------------------
      
      
   });// end of $(document).ready(function() {});--------------------------------------------


   // === ????????????????????? ?????? span?????? ????????? ?????? ????????? ?????? ????????? ?????? ?????? ??????????????? ??????
   // === ?????? ???????????????????????? 50,000??? ????????? ?????? ???????????? 2500???, ???????????????????????? 50,000??? ????????? ?????? ???????????? 0???
   // === ???????????? ????????????????????? ???????????? ????????? ?????? ???????????? ???.
   function calSumPrice() {
	  // ????????????????????? ?????? span?????? ????????? ????????? ?????? ????????? ?????? ????????? ?????? ?????? ????????????
      var sumPrice = 0;
	  
      $("input.individualCheck").each(function () {
    	  if ( $(this).prop("checked") ) {
			sumPrice += Number($(this).parent().find($("input.itotalPrice")).val());
		}
      });
	  
      $("input[name=sumPrice]").val(sumPrice);
      $("span[id=sumPrice]").text(comma(sumPrice));
      
      // ?????? ???????????????????????? 50,000??? ????????? ?????? ???????????? 2500???, ???????????????????????? 0??? ????????? 50,000??? ????????? ?????? ???????????? 0???
      var deliveryCharge = 2500;

      if (sumPrice >= 300000 || sumPrice == 0) {
         deliveryCharge = 0;
      }
      $("input[name=deliveryCharge]").val(deliveryCharge);
      $("span#deliveryCharge").text(comma(deliveryCharge));

      // ???????????? ????????????????????? ???????????? ????????? ?????? ???????????? ???.
      $("span#totalCost").text(comma(sumPrice + deliveryCharge));
      $("input[name=totalCost]").val(sumPrice + deliveryCharge);

   }// end of function calSumPrice() {}------------------------------------

   // ?????? ??????
   function comma(str) {
       str = String(str);
       return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
   }// end of function comma(str) {}---------------------------------------
   
   //????????????
   function uncomma(str) {
       str = String(str);
       return str.replace(/[^\d]+/g, '');
   }// end of function uncomma(str) {}-------------------------------------
   
</script>

<!-- <body> -->
<div id="container">
	<div id="menu">
		<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;???????????????</h3>
		<ul id="menu" style="line-height: 40px;">
			<li onclick="location.href='<%= ctxPath%>/mypage/myInfo.com'"><span style="float:left;"></span>&nbsp;??? ?????? ??????/??????</li>
			<li onclick="location.href='<%= ctxPath%>/member/shippingAddressLookup.com'"><span style="float:left;"></span>&nbsp;????????? ??????</li>
			<li onclick="location.href='<%= ctxPath%>/mypage/orderList.com'"><span style="float:left;"></span>&nbsp;????????????</li>
			<li onclick="location.href='<%= ctxPath%>/mypage/purchaseHistory.com'"><span style="float:left;"></span>&nbsp;????????????</li>
			<li onclick="location.href='<%= ctxPath%>/product/myCart.com'"><span style="float:left;"></span>&nbsp;????????????</li>
		</ul>
	</div>
   <div id="miniContainer">
      <h1>??? ??? ??? ???</h1>
      <hr style="border: solid 1px gray;">

      <!-- ??????????????? ???????????? ????????? ????????? -->
      <c:if test="${cartList.size() == 0}">
         <span style="color: red; font-size: 20pt;">??????????????? ???????????????.</span><br><br>
         <button id="goBack" type="button" class="btn btn-info" onclick="javascript:history.back();">?????? ????????????</button>
      </c:if>

      <!--??????????????? ???????????? ????????? ?????????  -->
      <c:if test="${cartList.size() != 0}">

         <span class="head">??????</span><span class="head">??????</span><span class="head">??????</span><span
            class="head">??????</span>
         <hr style="width: 680px; border: solid 1px gray;">

         <div id="allCheckBox">
            <input type="checkbox" id="allCheck" name="allCheck" /> <label for="allCheck">?????? ??????/??????</label>
         </div>
         <br>


            <c:forEach var="product" items="${cartList}">
               <div class="item">
                  <input type="checkbox" class="individualCheck"><br>
                  <span class="left">${product.krproductname}</span><br>
                  <div class="productImg">
                     <img class="left pd" src="../images/${product.productimg1}" />
                  </div>
                  
                  <input class="ipPrice" type="hidden" value="${product.pprice}" /> 
                  <span class="cost left pPrice">???<fmt:formatNumber value="${product.pprice}" pattern="#,###" /></span>
                  
                  <input class="poqty left" type="number" min="1" value="${product.poqty}" />
                  
				  <input class="itotalPrice" type="hidden" value="${product.totalprice}" />
                  <span class="cost left totalPrice">???<fmt:formatNumber value="${product.totalprice}" pattern="#,###" /></span><br>
                  
                  <button type="button" class="individualDelete mybtn2">??????</button>
                  <button type="button" class="save mybtn2">??????</button>
                  <input type="hidden" class="cartno" value="${product.cartno}" />
                  <input type="hidden" class="optionno" value="${product.fk_optioncode}" />
               </div>
               <br><br>

            </c:forEach>


         <div id="rightDiv" class="order-wrap">
         	<form name="cartForm">
               <input type="hidden" name="purchasecartno" value="" />
               <input type="hidden" name="purchaseoption" value="" />
  		       <input type="hidden" name="sumPrice" value="" />
  		       <input type="hidden" name="deliveryCharge" value="" />
  		       <input type="hidden" name="totalCost" value="" />
         	</form>
               <ul class="order-con">
			      <li>
			         <span>?????? ?????? ??????</span>
			       	 <span id="sumPrice">0</span><span>???</span>
			      </li>
			      <li>
			         <span>?????????</span>
		 			 <span id="deliveryCharge">0</span><span>???</span>
			      </li>
			      <li>
			         <span>?????????</span>
			         <span id="totalCost">0</span><span>???</span>
			      </li>
			   </ul>
			   <div class="order-btn">
			      <button id="checkedCardSlash" type="button" class="mybtn">?????? ?????? ????????????</button>
			      <button id="cardSlash" type="button" class="mybtn">?????? ?????? ????????????</button>
			   </div>
            </div>
		 
         <button id="selectDelete" type="button" class="left mybtn">????????????</button>
         <button id="allDelete" type="button" class="left mybtn">????????????</button>



      </c:if>
   </div> <!-- end of #miniContainer -->

</div>
<!-- </body> -->

<jsp:include page="../covengers_footer.jsp"></jsp:include>

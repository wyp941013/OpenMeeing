
      var xmlHttp = null;  
        
      //声明XMLHttpRequest对象函数  
      function getXMLHttp()  
      {     
          try{  
              //fireFox、Opera、Safari  
              xmlHttp = new XMLHttpRequest();  
          }catch(e){  
              try{  
                  //IE6.0+  
                  xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");  
              }catch(e){  
                  try{  
                      //IE5.5+  
                      xmlHttp = xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");  
                  }catch(e){  
                      alert("你的浏览器不支持AJAX!");  
                      return false;  
                  }  
              }  
          }  
          return xmlHttp;  
      }  
        
      //返回结果处理  
      function handleResult()  
      {   
    	alert(xmlHttp.readyState);
          if(xmlHttp.readyState == 4)  
          {  
//        	 alert(xmlHttp.status);
              if(xmlHttp.status == 200)  
              {  
            	  SetPwdAndChk();//判断是否保存密码
            	  var userName = document.getElementById("userName").value; 
            	  var ttt="<h4>欢迎使用<br/>会议管理系统,"+userName+"</h4>";
                  document.getElementById("logintable").innerHTML = ttt; 
              }  
          }  
      }  
      
      
      //验证函数  
      function check()  
      {  
          var meetTime = document.getElementById("meetTime").value; 
          var xmlHttp = getXMLHttp();  
          xmlHttp.open("post","/OpenMeeting/room/pagelist?tt="+Math.random(),true);   
//          xmlHttp.onreadystatechange = handleResult();  
          xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");  
          xmlHttp.send("meetTime="+meetTime);  
          xmlHttp.onreadystatechange = handleResult();  
      }  
      
      
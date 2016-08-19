//function GetObj(id) {
//    return document.getElementById(id);
//}
////标签切换,showID表示要显示区域的ID
////hideClass表示要隐藏区域的class类名
//function TabSwitch(showId, HideClass) {
//    var obj = GetObj(showId);
//    var hideObjs = document.getElementsByClassName(HideClass);
//    for (var i = 0; i < hideObjs.length; i++)
//    {
//        hideObjs[i].style.display = 'none';
//    }
//    obj.style.display = 'block';
//    var e = event.srcElement;
//    var liObjs = document.getElementsByClassName(e.className);
//    for (var i = 0; i < liObjs.length; i++)
//    {
//        liObjs[i].style.backgroundColor = '#C8BAB9';
//        liObjs[i].style.color = 'white';
//    }
//    e.style.backgroundColor = 'white';
//    e.style.color = 'black';
//    alert(e.className);
//}


function GetObj(id) {
    return document.getElementById(id);
}
//标签切换,showID表示要显示区域的ID
//hideClass表示要隐藏区域的class类名
function TabSwitch(showId,showTabId) {
    var hideObjs = document.getElementById("newsLists").children;//谷歌,ie
    for (var i = 0; i < hideObjs.length; i++) {
        //alert(hideObjs[i].id);
        hideObjs[i].style.display = 'none';
    }
    var obj = GetObj(showId);
    obj.style.display = 'block';
    
    var liObjs = document.getElementById("tabList").children;
    for (var i = 0; i < liObjs.length; i++) {
        liObjs[i].style.backgroundColor = '#F9F9F9';
        liObjs[i].style.color = 'yellow';
    }
    var objTab = GetObj(showTabId);
    objTab.style.backgroundColor = '#F9F9F9';
    objTab.style.color = 'blue';
   
}

function SmallTabSwitch(showId, showTabId) {
    var hideObjs = document.getElementById("SmallTabLists").children;//谷歌,ie
    for (var i = 0; i < hideObjs.length; i++) {
        //alert(hideObjs[i].id);
        hideObjs[i].style.display = 'none';
    }
    var obj = GetObj(showId);
    obj.style.display = 'block';

    var liObjs = document.getElementById("smallTabs").children;
    for (var i = 0; i < liObjs.length; i++) {
	liObjs[i].removeAttribute("style");
        liObjs[i].setAttribute("style","background-image: url(http://210.43.192.15/template/site19/tabBg03.png);");
    }
    var objTab = GetObj(showTabId);
    objTab.removeAttribute("style");
    objTab.setAttribute("style","background-image: url(http://210.43.192.15/template/site19/tabBg02.png);");
}

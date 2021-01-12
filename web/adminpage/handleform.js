function apUploadform(){
    var uploadform=document.getElementById("uploading");
    var manageform=document.getElementById("managing");
    var orderform=document.getElementById("ordering");
    var tagaul=document.getElementById("uploadfunc");
    var tagamng=document.getElementById("managefunc");
    var tagaod=document.getElementById("orderfunc");
    tagaul.style.background="cornflowerblue";
    tagamng.style.background="rgb(173, 173, 173)";
    tagaod.style.background="rgb(173, 173, 173)";
    uploadform.style.display="block";
    manageform.style.display="none";
    orderform.style.display="none";
}
function apManageform(){
    var uploadform=document.getElementById("uploading");
    var manageform=document.getElementById("managing");
    var orderform=document.getElementById("ordering");
    var tagaul=document.getElementById("uploadfunc");
    var tagamng=document.getElementById("managefunc");
    var tagaod=document.getElementById("orderfunc");
    tagaul.style.background="rgb(173, 173, 173)";
    tagamng.style.background="cornflowerblue";
    tagaod.style.background="rgb(173, 173, 173)";
    uploadform.style.display="none";
    manageform.style.display="block";
    orderform.style.display="none";
}
function apOrderform(){
    var uploadform=document.getElementById("uploading");
    var manageform=document.getElementById("managing");
    var orderform=document.getElementById("ordering");
    var tagaul=document.getElementById("uploadfunc");
    var tagamng=document.getElementById("managefunc");
    var tagaod=document.getElementById("orderfunc");
    tagaul.style.background="rgb(173, 173, 173)";
    tagamng.style.background="rgb(173, 173, 173)";
    tagaod.style.background="cornflowerblue";
    uploadform.style.display="none";
    manageform.style.display="none";
    orderform.style.display="block";
}
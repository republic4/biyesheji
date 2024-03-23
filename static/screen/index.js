 var s;
    function resize() {
      s = window.screen.width / 1920;
      document.body.style.transformOrigin = '0 0';
      document.body.style.transform = 'scale(' + s + ',' + s + ')';
      document.body.style.width = window.innerWidth / s + 'px';
      document.body.style.height = window.innerHeight / s + 'px';
    }
    window.onresize = function () {
      resize();
    }
    resize();

    var docs = document.getElementsByName("id");
    function modify(){
    //修改
     for (var i = 0; i < docs.length; i++) {
      var num = docs[i].innerText;
      num=parseInt(num)+1;
      docs[i].innerText=num;
     }
     
    }
    window.setInterval("modify()",60000);


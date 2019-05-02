function CheckLodop(){
   var oldVersion=LODOP.Version;
　　newVerion="5.0.2.3";
　if (oldVersion==null){
	document.write("<h3><font color='#FF00FF'>打印控件未安装!点击这里<a href='../Lodop/CLodopPrint_Setup_for_Win32NT.zip' rel='nofollow'>点击安装</a>安装成功后重新进入该页面");
　　}
   if (oldVersion<newVerion){
	 document.write("<h3><font color='#FF00FF'>打印控件需要升级!点击这里<a href='../Lodop/CLodopPrint_Setup_for_Win32NT.zip' target='_blank' rel='nofollow'>");
   }
}
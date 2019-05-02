
function exportParamsPicklist(exportTitle, paramsUrl, paramsObj){
	var $dialog = parent.window.$('#picklistid');
	$dialog.dialog({     
           title: exportTitle,     
           width: $(window).width() * 0.2,     
           height: $(window).width() * 0.2, 
           href: paramsUrl,     
           modal: true,  
           buttons : [{    
                text : '确定',    
                iconCls : 'icon-ok',
                width: '100px',
                handler : function() {   
                	window.parent.exportExcel();
                	$dialog.dialog('close');
                }    
            }]  
      });    
}


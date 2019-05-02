$.ajaxSetup({ cache: false });
var basePageSize = 50;

$(".table th input:checkbox").click(function () {
    $checks = $(this).closest(".table").find("tbody input:checkbox");
    if ($(this).is(":checked")) {
        $checks.prop("checked", true);
    } else {
        $checks.prop("checked", false);
    }
});

//kendo grid check all
$("#checkAll").click(function () {
    $checks = $('table:eq(1)').find("tbody input:checkbox");
    if ($(this).is(":checked")) {
        $checks.prop("checked", true);
    } else {
        $checks.prop("checked", false);
    }
});

function showError(message, targetObj) {
    $('#alterBoard .alert', targetObj).remove();
    $('#alterBoard', targetObj)
        .append('<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>' + message + '</div>');
}

function showErrorOnPage(message) {
    $('#alterBoard .alert').remove();
    $('#alterBoard')
        .append('<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>' + message + '</div>');
}

function showErrorOnPagebase(message) {
    $('#basealterBoard .alert').remove();
    $('#basealterBoard')
        .append('<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button>' + message + '</div>');
}

function showSuccessOnPage(message) {
    $('#alterBoard .alert').remove();
    $('#alterBoard')
        .append('<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">&times;</button>' + message + '</div>');
}

function bootAlert(message) {
    bootbox.dialog({
        message: message,
        title: "  ",
        buttons: {
            Yes: {
                label: "确定",
                className: "btn btn-primary pull-right",
                callback: function () {

                }
            }
        }
    });
}

function previewimagebase(imgobj) {
    $('#preview').attr('src', $(imgobj).attr("bigpicpath"));
    $('#ModalEdit').modal('show');
}

function formatToMoney(s, n) {
    n = n > 0 && n <= 20 ? n : 2;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse(),
    r = s.split(".")[1];
    t = "";
    for (i = 0; i < l.length; i++) {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("") + "." + r;
}

// 获取页面的高度、宽度
function getPageSize() {
    var xScroll, yScroll;
    if (window.innerHeight && window.scrollMaxY) {
        xScroll = window.innerWidth + window.scrollMaxX;
        yScroll = window.innerHeight + window.scrollMaxY;
    } else {
        if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac    
            xScroll = document.body.scrollWidth;
            yScroll = document.body.scrollHeight;
        } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari    
            xScroll = document.body.offsetWidth;
            yScroll = document.body.offsetHeight;
        }
    }
    var windowWidth, windowHeight;
    if (self.innerHeight) { // all except Explorer    
        if (document.documentElement.clientWidth) {
            windowWidth = document.documentElement.clientWidth;
        } else {
            windowWidth = self.innerWidth;
        }
        windowHeight = self.innerHeight;
    } else {
        if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode    
            windowWidth = document.documentElement.clientWidth;
            windowHeight = document.documentElement.clientHeight;
        } else {
            if (document.body) { // other Explorers    
                windowWidth = document.body.clientWidth;
                windowHeight = document.body.clientHeight;
            }
        }
    }
    // for small pages with total height less then height of the viewport    
    if (yScroll < windowHeight) {
        pageHeight = windowHeight;
    } else {
        pageHeight = yScroll;
    }
    // for small pages with total width less then width of the viewport    
    if (xScroll < windowWidth) {
        pageWidth = xScroll;
    } else {
        pageWidth = windowWidth;
    }
    arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight);
    return arrayPageSize;
}

function saveUserGridSetting(userId, functionName, gridObj) {
    var pageSize = gridObj.dataSource.pageSize(),
        fields = "";
    for (var i = 1; i < gridObj.columns.length; i++) {
        var item = gridObj.columns[i];
        if (item.field != undefined) {
            if (i != gridObj.columns.length - 1)
                fields += item.field + "," + (item.hidden == undefined ? false : item.hidden) + "," + i + "|";
            else
                fields += item.field + "," + (item.hidden == undefined ? false : item.hidden) + "," + i;
        }

        //multi columns
        if (item.columns != undefined) {
            for (var j = 0; j < item.columns.length; j++) {
                var childItem = item.columns[j];
                if (j != item.columns.length - 1)
                    fields += childItem.field + "," + (childItem.hidden == undefined ? false : childItem.hidden) + "," + j + "|";
                else
                    fields += childItem.field + "," + (childItem.hidden == undefined ? false : childItem.hidden) + "," + j;
            }
        }
    }

    $.ajax({
        url: '/Setting/SaveUIGridSetting',
        type: 'post',
        data: {
            UserId: userId,
            FunctionName: functionName,
            PageSize: pageSize,
            Fields: fields
        }
    }).done(function (result) {
        if (result.Success == false) {
            bootAlert(result.Message);
        }
    });
}

//公司部门Tree functions
function uuid() {
    var s = [];
    var hexDigits = "0123456789abcdef";
    for (var i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
    s[8] = s[13] = s[18] = s[23] = "-";

    var uuid = s.join("");
    return uuid;
}
function showMenu(obj, setting, nodes) {
    $.fn.zTree.init($("#treeDemo"), setting, nodes);
    console.log(obj);
    var cityObj = obj;
    var cityOffset = obj.offset();
    $("#menuContent").css({ left: cityOffset.left + "px", top: cityOffset.top + cityObj.outerHeight() + "px" }).slideDown("fast");

    $("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
    $("#menuContent").fadeOut("fast");
    $("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
    if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
        if (event.target.id != 'UseCompanyIdTree' && event.target.id != 'UseCompanyId2Tree' && event.target.id != 'OwnCompanyIdTree' && event.target.id != 'AssetTypeTree' && event.target.id != 'UseDepartmentIdTree')
            hideMenu();
    }
}
function BindDepartment(CompanyId, departId) {
    var settingDepart = {
        view: { dblClickExpand: false, fontCss: setHighlight  },
        data: { simpleData: { enable: true } },
        callback: {
            onClick: function (e, treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
                nodes = zTree.getSelectedNodes();
                $('input[id="UseDepartmentIdTree"]').val(nodes[0].name != "(清空)" ? nodes[0].name : "");
                $('input[id="UseDepartmentId"]').val(nodes[0].id);

                hideMenu();
            }
        }
    },
    zNodes = [];

    $.get("/Company/GetUseDepartmentId?UseCompanyId=" + CompanyId + "&t=" + Math.random()).done(function (result) {
        if (result.length > 0)
            zNodes.push({
                id: '',
                pId: '',
                name: '(清空)',
                open: ''
            });
        for (var i = 0; i < result.length; i++) {
            zNodes.push({
                id: result[i].Id,
                pId: result[i].Pid,
                name: result[i].Name,
                open: result[i].HasChildren
            });
        }
    });
    departId.click(function (e) {
        //var theEvent = window.event || arguments.callee.caller.arguments[0];
        showMenu($(e.target), settingDepart, zNodes);

        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        treeObj.expandAll(false);
    });

    departId.keyup(function (e) {
        //if (e.keyCode == 13) {
            if (timeoutId) {
                clearTimeout(timeoutId);
            }
            timeoutId = setTimeout(function () {
                searchNode($(e.currentTarget).val());
            }, 100);
        //}
    });
}

var treeIds = new Array();
function recursionTreeId(nodes) {
    treeIds.push(nodes.id);
    if (nodes.children == undefined)
        return;
    else {
        for (var i = 0; i < nodes.children.length; i++) {
            if (nodes.children[i].children == undefined) {
                var e = _.filter(treeIds, nodes.children[i].id).length;
                if (e == 0)
                    treeIds.push(nodes.children[i].id);
            }
            else
                recursionTreeId(nodes.children[i]);
        }
    }
}

function GetListDetailTableForGrid(fieldName, list) {
    var htmlStr = "<table style='margin-left:-.6em;width:120%'>";
    for (var i = 0; i < list.length; i++) {
        var v = eval('list[i]' + '.' + fieldName);
        if (v == null)
            v = '';
        htmlStr += "<tr><td style='height:21px !important'>" + v + "</td></tr>";
    }
    htmlStr += "</table>";
    return htmlStr;
}

function GetListDetailTableForGridOfMoney(fieldName, list) {
    var htmlStr = "<table style='margin-left:-.6em;width:120%'>";
    for (var i = 0; i < list.length; i++) {
        var v = eval('list[i]' + '.' + fieldName);
        if (v == null)
            v = '';
        htmlStr += "<tr><td style='height:21px !important'>" + kendo.toString(v, "n") + "</td></tr>";
    }
    htmlStr += "</table>";
    return htmlStr;
}

function GetHcBindColumnsOrder(columnsorderfields, title) {
    if (columnsorderfields != "" && columnsorderfields.length > 0) {
        var tempColumns = [];
        var tempColumnsDetial = [];
        var fieldArray = columnsorderfields.split('|');

        var NewField = _.filter(gridColumns, function (o) {
            return columnsorderfields.indexOf(o.field) < 0 && o.title != title;
        });
        for (var i = 0; i < NewField.length; i++) {
            tempColumns.push(NewField[i]);
        }

        for (var i = 0; i < fieldArray.length; i++) {
            var itemArray = fieldArray[i].split(',');
            var fieldName = itemArray[0];

            var index = 0;
            var z = 0;
            $.each(gridColumns, function (j, item) {
                if (item.title != title) {
                    if (item.field != undefined && item.field.toLowerCase() == fieldName.toLowerCase()) {
                        index = j;
                        return false;
                    }
                }
                else {
                    z = j;
                }
            });
            if (index > 0) {
                tempColumns.push(gridColumns[index]);
            } else {
                $.each(gridColumns[z].columns, function (n, item2) {
                    if (item2.field != undefined && item2.field.toLowerCase() == fieldName.toLowerCase()) {
                        tempColumnsDetial.push({ field: item2.field, sortable: item2.sortable, title: item2.title, width: item2.width, template: item2.template, filterable: item2.filterable })
                        return false;
                    }
                });
            }
        }
        tempColumns.push({ title: title, columns: tempColumnsDetial, headerAttributes: { style: "text-align: center;" } });
        return tempColumns;
    }
}

function ShowAssetHandleLog(id) {
    $.ajax({
        url: '/Asset/AssetChangeLog?id=' + id,
        type: 'get',
    }).done(function (result) {
        if (result.Success) {
            $('#barcode', dialogChangeDetail).val(result.Asset.Barcode);
            $('#type', dialogChangeDetail).val(result.Asset.AssetTypeName);
            $('#buydate', dialogChangeDetail).val(result.Asset.BuyDate);
            $('#name', dialogChangeDetail).val(result.Asset.Name);
            $('#specs', dialogChangeDetail).val(result.Asset.Specs);
            $('#cleardate', dialogChangeDetail).val(result.Asset.ClearDate);

            var changeLogs = [];
            for (var i = 0; i < result.ChangeList.length; i++) {
                changeLogs.push({
                    Id: result.ChangeList[i].Id,
                    HandleDate: result.ChangeList[i].HandleDate,
                    User: result.ChangeList[i].User != null ? result.ChangeList[i].User : "",
                    Way: result.ChangeList[i].Way,
                    Content: result.ChangeList[i].Content,
                    SignaturePicPath: result.ChangeList[i].SignaturePicPath,
                });
            }
            gridChangeLog = $("#gridChangeLog").kendoGrid({
                dataSource: {
                    data: changeLogs,
                    pageSize: 5
                },
                resizable: true,
                sortable: true,
                filterable: {
                    extra: false,
                },
                columnMenu: true,
                pageable: {
                    refresh: true,
                    pageSizes: true,
                    buttonCount: 5
                },
                columns: [{
                    field: "HandleDate",
                    title: "处理日期",
                    width: 120,
                }, {
                    field: "User",
                    title: "处理人",
                    width: 90,
                }, {
                    field: "Way",
                    title: "处理方式",
                    width: 100,
                    filterable: {
                        multi: true,
                        checkAll: false,
                        messages: {
                            clear: "清除",
                            filter: "过滤"
                        }
                    }
                }, {
                    field: "Content",
                    title: "处理内容",
                    template: '#=Content#',

                }, {
                    field: "SignaturePicPath",
                    title: "查看签字",
                    width: 110,
                    template: '#if(SignaturePicPath!=null && SignaturePicPath!=""){#<div class="color1" bigpicpath="#=SignaturePicPath#" onclick="previewimagebase(this)">已签字</div>#}#',
                }],
            }).data("kendoGrid");

        }
    });
}

var timeoutId = null;
function setHighlight(treeId, treeNode) {
    return (treeNode.highlight) ? { color: "#000", "font-weight": "bold", "background-color": "#ddd" } : { color: "#000", "font-weight": "normal" };
}
function searchNode(value) {
    if (value == "") return;

    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");

    var nodes = treeObj.getNodesByParamFuzzy("name", value);
    var allNodes = treeObj.transformToArray(treeObj.getNodes());

    for (var i = 0; i < allNodes.length; i++) {
        allNodes[i].highlight = false;
        treeObj.updateNode(allNodes[i]);
    }
    // 先关闭所有节点
    //treeObj.expandAll(false);

    for (var i = 0; i < nodes.length; i++) {
        nodes[i].highlight = true;
        treeObj.updateNode(nodes[i]); 
        treeObj.expandNode(treeObj.getNodes()[0], true);
        treeObj.expandNode(nodes[i].getParentNode(), true);
    }
}


function startChange() {
    var startDate = start.value(),
        endDate = end.value();

    if (startDate) {
        startDate = new Date(startDate);
        startDate.setDate(startDate.getDate());
        end.min(startDate);
    } else if (endDate) {
        start.max(new Date(endDate));
    } else {
        endDate = new Date();
        start.max(endDate);
        end.min(endDate);
    }
}
function endChange() {
    var endDate = end.value(),
        startDate = start.value();

    if (endDate) {
        endDate = new Date(endDate);
        endDate.setDate(endDate.getDate());
        start.max(endDate);
    } else if (startDate) {
        end.min(new Date(startDate));
    } else {
        endDate = new Date();
        start.max(endDate);
        end.min(endDate);
    }
}
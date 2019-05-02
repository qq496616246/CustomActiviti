var dialogAssetType = $('#dialogAssetType');
var dialogImportAssetType = $('#dialogImportAssetType');

var _vm = null,
    selectedItems = null,
    selectedId = [],
    setting = {
        data: {
            keep: {
                parent: false,
                leaf: false
            },
            simpleData: {
                enable: true
            }
        },
        callback: {
            onClick: function (treeId, treeNode) {
                _vm.viewAssetType();
            }
        }
    };

var viewModel = function () {
    var $this = this;

    $this.newType = ko.observable();
    $this.isAddChildren = ko.observable();
    $this.currentSelectedCode = ko.observable();
    $this.currentSelectedName = ko.observable();
    $this.currentSelectedUseYear = ko.observable();
    $this.showAddDialog = function () {
        //$('#btnsave').attr("disabled", false);
        $this.isAddChildren(false);

        var treeObj = $.fn.zTree.getZTreeObj("treeView");
        //如果一个分类也没有，则直接通过验证
        if (treeObj.getNodes().length > 0) {
            if ($this.verifySelect()) {

                $("#btndelete").hide();

                $this.currentSelectedCode('');
                $this.currentSelectedName('');
                $this.currentSelectedUseYear('');

                //var treeObj = $.fn.zTree.getZTreeObj("treeView");
                var selectNode = treeObj.getNodesByParam("id", selectedItems[0].pId, null);
                if (selectNode.length > 0) {
                    $this.currentSelectedCode(selectNode[0].code);
                    $this.currentSelectedName(selectNode[0].name);
                    $this.currentSelectedUseYear(selectNode[0].useyear);
                }

                $this.clearDialogContent();

                //dialogAssetType.modal('show');
            }
        } else {
            $("#dialogAssetType").show();
            //dialogAssetType.modal('show');
        }
        $this.newType(1);
    };
    $this.showAddChildDialog = function () {
        $this.isAddChildren(true);

        if ($this.verifySelect()) {
            $this.currentSelectedCode('');
            $this.currentSelectedName('');
            $this.currentSelectedUseYear('');
            $this.currentSelectedCode(selectedItems[0].code);
            $this.currentSelectedName(selectedItems[0].name);
            $this.currentSelectedUseYear(selectedItems[0].useyear);

            $this.clearDialogContent();
            $("#btndelete").hide();

            //验证叶子资产分类是否存在资产
            if (selectedItems[0].hasChildren == false) {
                $.ajax({
                    url: '/AssetType/GetAssetCountByAssetTypeId?assetTypeId=' + selectedItems[0].id,
                    type: 'get',
                }).done(function (result) {
                    if (result.Success) {
                        //$("#btndelete").hide();
                    } else {
                        bootbox.dialog({
                            message: "当前分类\"" + selectedItems[0].name + "\"已有对应的固定资产数据，如果新增下级分类，所有资产数据将被移动到下级分类，您确定新增吗？",
                            title: '提示',
                            buttons: {
                                cancel: {
                                    label: "取消",
                                    className: "btn btn-default",
                                    callback: function () {
                                        dialogAssetType.hide();
                                    }
                                },
                                Yes: {
                                    label: "确定",
                                    className: "btn btn-primary pull-right",
                                    callback: function () {
                                        //$("#btndelete").hide();
                                    }
                                }
                            }
                        });
                    }
                });
            } else {
                //$("#btndelete").hide();
            }

            //dialogAssetType.modal('show');
        }
        $this.newType(2);
    };
    $this.viewAssetType = function () {
        if ($this.verifySelect()) {
            $("#showAdd").show();
            $("#showAddChild").show();

            $('#assetTypeId').val(selectedItems[0].id);
            $('#code').val(selectedItems[0].code);
            $('#name').val(selectedItems[0].showname);
            $('#useYear').val(selectedItems[0].useyear);
            $('#alterBoard .alert', dialogAssetType).remove();

            $this.currentSelectedCode('');
            $this.currentSelectedName('');
            $this.currentSelectedUseYear('');

            var treeObj = $.fn.zTree.getZTreeObj("treeView");
            var selectNode = treeObj.getNodesByParam("id", selectedItems[0].pId, null);
            if (selectNode.length > 0) {
                $this.currentSelectedCode(selectNode[0].code);
                $this.currentSelectedName(selectNode[0].name);
                $this.currentSelectedUseYear(selectNode[0].useyear);
            }
        }
    };
    $this.editAssetType = function () {

        if ($this.verifySelect()) {
            $("#btndelete").show();

            $('#assetTypeId').val(selectedItems[0].id);
            $('#code').val(selectedItems[0].code);
            $('#name').val(selectedItems[0].name);
            $('#useYear').val(selectedItems[0].useyear);
            $('#alterBoard .alert', dialogAssetType).remove();

            $this.currentSelectedCode('');
            $this.currentSelectedName('');
            $this.currentSelectedUseYear('');

            if (selectedItems[0].pId != null) {
                $.ajax({
                    url: "/AssetType/GetById?id=" + selectedItems[0].pId,
                    type: 'get',
                }).done(function (result) {
                    $this.currentSelectedCode(result.Code);
                    $this.currentSelectedName(result.Name);
                    $this.currentSelectedUseYear(result.UseYear);
                });
            }

            ////dialogAssetType.modal('show');
        }
    };
    $this.deleteAssetType = function () {
        if ($this.verifySelect()) {

            bootbox.dialog({
                message: '确定删除该分类吗?',
                title: "资产分类删除",
                buttons: {
                    cancel: {
                        label: "取消",
                        className: "btn btn-default",
                        callback: function () {
                        }
                    },
                    Yes: {
                        label: "确定",
                        className: "btn btn-primary pull-right",
                        callback: function () {
                            $.ajax({
                                url: '/AssetType/delete',
                                type: 'post',
                                data: { Id: selectedItems[0].id }
                            }).done(function (result) {
                                if (result.Success) {
                                    dialogAssetType.hide();
                                    //$this.initTree();

                                    var treeObj = $.fn.zTree.getZTreeObj("treeView"),
                                        nodes = treeObj.getSelectedNodes(),
                                        treeNode = nodes[0];
                                    treeObj.removeNode(treeNode);

                                } else {
                                    bootAlert(result.Message);
                                }
                            });
                        }
                    }
                }
            });
        }
    };
    $this.saveAssetType = function (data, event) {
        var id = $('#assetTypeId').val();
        var code = $('#code').val().trim();
        var name = $('#name').val().trim();
        var useYear = $('#useYear').val().trim();
        var url = (id == "" ? '/AssetType/add' : '/AssetType/edit');
        var treeObj = $.fn.zTree.getZTreeObj("treeView");
        if (treeObj.getNodes().length == 0) {
            url = '/AssetType/add';
        }

        var errorMessage = "";
        if (code.length == 0) {
            errorMessage += "编码,";
        }
        if (name.length == 0) {
            errorMessage += "名称,";
        }
        if (useYear.length == 0) {
            errorMessage += "使用年限,";
        }
        if (errorMessage.length > 0) {
            errorMessage = errorMessage.substring(0, errorMessage.length - 1) + '不能为空';
            bootAlert(errorMessage);
            return;
        }

        var pid = null;
        //如果一个分类也没有，则直接通过验证
        if (treeObj.getNodes().length > 0) {

            if (id == "") {
                if ($this.isAddChildren()) {
                    pid = selectedItems[0].id;
                } else {
                    pid = selectedItems[0].pId;
                }
            }
            else {
                pid = selectedItems[0].pId;
            }
        }

        $.ajax({
            url: url,
            type: 'post',
            data: { Id: id, Code: code, Name: name, Pid: pid, UseYear: useYear },
            beforeSend: function (jqXHR, settings) {
                $(event.currentTarget).button('loading');
            },
        }).done(function (result) {
            if (result.Success) {
                if (url.indexOf("add") > -1) {
                    if (result.IsAdmin == true)
                        bootAlert('保存成功');
                    else
                        bootAlert('新分类已创建，请联系系统管理员授权');
                } else
                    bootAlert('保存成功');
                dialogAssetType.hide();

                $('#assetTypeId').val('');
                $('#code').val('');
                $('#name').val('');
                $('#useYear').val('');
                //$this.initTree();

                var treeObj = $.fn.zTree.getZTreeObj("treeView"),
                    nodes = treeObj.getSelectedNodes(),
                    treeNode = nodes[0];
                var newType = $this.newType();

                if (id == "") {
                    var ResultId = result.ResultId,
                        pid = "",
                        pNode;
                    if (newType == 1) {
                        pid = treeNode.pId;
                        pNode = treeObj.getNodesByParam("id", pid, null);
                        pNode = pNode[0];
                    }
                    else {
                        pid = treeNode.id;
                        pNode = treeNode;
                    }

                    if (treeNode != null) {
                        treeObj.addNodes(pNode, { id: ResultId, code: code, showname: name, name: code + ' - ' + name, pId: treeNode.id, useyear: useYear }, false);
                    } else {
                        treeObj.addNodes(null, { id: ResultId, code: code, showname: name, name: code + ' - ' + name, pId: 0, useyear: useYear });
                    }
                }
                else {
                    treeNode.name = code + ' - ' + name;
                    treeNode.showname = name;
                    treeNode.code = code;
                    treeNode.useyear = useYear;
                    treeObj.updateNode(treeNode);
                }
            } else {
                bootAlert(result.Message);
            }
        }).always(function () {
            $(event.currentTarget).button('reset');
        });;
    };
    $this.verifySelect = function () {
        $("#btndelete").show();
        $("#dialogAssetType").attr("style", "display:inline-block");
        var zTree = $.fn.zTree.getZTreeObj("treeView");
        selectedItems = zTree.getSelectedNodes();
        var result = false;
        if (zTree.getSelectedNodes().length == 0) {
            bootAlert('请选择一个分类');
            $("#dialogAssetType").hide();
            result = false;
        } else {

            result = true;
        }

        return result;
    };
    $this.clearDialogContent = function () {
        $('#assetTypeId').val('');
        $('#code').val('');
        $('#name').val('');
        $('#useYear').val('');
        $('#alterBoard .alert', dialogAssetType).remove();
    };
    $this.initTree = function () {
        $.ajax({
            url: "/AssetType/GetAllAssetType?d=" + new Date(),
            type: 'get',
        }).done(function (result) {
            var zNodes = [];
            for (var i = 0; i < result.length; i++) {
                zNodes.push({
                    id: result[i].Id,
                    pId: result[i].Pid,
                    name: result[i].Code + ' - ' + result[i].Name,
                    showname: result[i].Name,
                    open: result[i].HasChildren,
                    code: result[i].Code,
                    useyear: result[i].UseYear,
                    hasChildren: result[i].HasChildren,
                });
            }

            if (result.length <= 0) {
                $this.clearDialogContent();
                $("#showAdd a").html("新增分类");
                $("#showAddChild").hide();
                $("#btndelete").hide();
            }
            else {
                $("#showAdd a").html("新增同级");
                $("#showAddChild").show();
            }
            $.fn.zTree.init($("#treeView"), setting, zNodes);

            var treeObj = $.fn.zTree.getZTreeObj("treeView");
            treeObj.expandAll(false);
        });
    };
};
var init = function (args) {

    _vm = new viewModel();
    ko.applyBindings(_vm);

    _vm.initTree();

    var $list = $('#thelist'),
        $btn = $('#importSaveAssetType'),
        state = 'pending';

    $("#useYear").keyup(function () {
        var tmptxt = $(this).val();
        $(this).val(tmptxt.replace(/\D|^0/g, ''));
    }).bind("paste", function () {
        var tmptxt = $(this).val();
        $(this).val(tmptxt.replace(/\D|^0/g, ''));
    }).css("ime-mode", "disabled");

    uploaderFileAdd = WebUploader.create({
        resize: false,
        server: '/AssetType/ImportAssetTypeExcel',
        pick: '#picker'
    });
    uploaderFileAdd.on('beforeFileQueued', function (file) {
        uploaderFileAdd.reset();
    });
    uploaderFileAdd.on('fileQueued', function (file) {
        $list.append('<div id="' + file.id + '" class="item">' +
            '<h4 class="info">' + file.name + '</h4>' +
            '<p class="state">等待上传...</p>' +
        '</div>');

        $('#uploaderFileName').html('<i class="fa fa-file-text" style="margin-right:6px;color:#999;"></i>' + file.name);
    });
    uploaderFileAdd.on('uploadProgress', function (file, percentage) {
        var $li = $('#' + file.id),
            $percent = $li.find('.progress .progress-bar');

        // 避免重复创建
        if (!$percent.length) {
            $percent = $('<div class="progress progress-striped active">' +
              '<div class="progress-bar" role="progressbar" style="width: 0%">' +
              '</div>' +
            '</div>').appendTo($li).find('.progress-bar');
        }

        $li.find('p.state').text('上传中');

        $percent.css('width', percentage * 100 + '%');
    });
    uploaderFileAdd.on('uploadSuccess', function (file, response) {

        if (response.Success == true) {
            $('#' + file.id).find('p.state').text('已上传');
            dialogImportAssetType.modal('hide');
            bootAlert("导入成功！");
            _vm.initTree();
        } else {
            $('#' + file.id).find('p.state').text('');
            showError(response.ErrorMessage, dialogImportAssetType);
            uploaderFileAdd.reset();
        }

        $('#loading').hide();
        $('#importSave').removeClass('disabled');
    });
    uploaderFileAdd.on('uploadError', function (file) {
        $('#' + file.id).find('p.state').text('上传出错');
    });
    uploaderFileAdd.on('uploadComplete', function (file) {
        $('#' + file.id).find('.progress').fadeOut();
    });
    uploaderFileAdd.on('all', function (type) {
        if (type === 'startUpload') {
            state = 'uploading';
        } else if (type === 'stopUpload') {
            state = 'paused';
        } else if (type === 'uploadFinished') {
            state = 'done';
        }
    });
    $btn.on('click', function () {
        if (uploaderFileAdd.getFiles().length == 0) {
            showError("请选择一个Excel文件", '#dialogImport');
            return;
        }
        $('#loading').show();
        $('#importSave').addClass('disabled');

        if (state === 'uploading') {
            uploaderFileAdd.stop();
        } else {
            uploaderFileAdd.upload();
        }
        return false;
    });

    $('#importAssetType').click(function () {
        $('#loadingAssetType').hide();
        $('#importSaveAssetType').removeClass('disabled');
        $('#importFileAssetType').val('');

        $('#uploaderFileName').text('');
        $('div[id^="rt_rt"]').attr('style', 'position: absolute; top: 0px; left: 0px; width: 82px; height: 39px; overflow: hidden; bottom: auto; right: auto;');

        dialogImportAssetType.modal('show');
    });
};

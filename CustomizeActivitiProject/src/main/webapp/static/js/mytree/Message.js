var dialogMessage = $("#dialogMessage");
var dialogMessageMore = $("#dialogMessageMore");

var init = function () {

    setTreeHeight();

    var ShowDialogMessage = function (guid) {
        dialogMessage.modal("show");

        data = _.find(MessageObjects, function (obj) {
            return obj.Id == guid;
        });

        $('#dialogMessageIdd', dialogMessage).val(data.Id);
        $('#txtTitle', dialogMessage).html(data.Title);
        $('#txtContents', dialogMessage).html(data.Contents);

        if (data.IsRead == "False") {
            AddUserRead(data.Id);
        }
    }

    var AddUserRead = function (Id) {
        $.ajax({
            url: '/Message/SetMessageUserRead?id=' + Id,
            type: 'post',
        }).done(function (result) {
            if (result.Success) {
                $("#MessageMenu li").find("a[data-id=" + Id + "]").find("h4").removeClass("unread");
                $("#MoreTable td").find("a[data-id=" + Id + "]").find("h4").removeClass("unread");

                $(".messages-menu .label-success").html(result.Count);
                if (result.Count == 0) {
                    $(".messages-menu .label-success").hide();
                    $(".messages-menu .header").html("您没有新的通知！");
                } else {
                    $(".messages-menu .header").html("您有" + result.Count + "条未读消息！");
                }
            }
        });
    };

    $("#MessageMore").on("click", function () {
        dialogMessageMore.modal("show");
    });

    $("#MessageMenu li a,#MoreTable td a").on("click", function () {
        var guid = $(this).attr("data-id");
        ShowDialogMessage(guid)
    });
};
init();

function setTreeHeight() {
    var h = getPageSize()[3] - 175;
    try {
        $("#treeView").height(h - 65);
    } catch (e) {
    }
}


//验证价格
function ismoney(money){
	return (new RegExp(/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/).test(money));
}

//  验证邮箱
function ismail(mail) {
	return (new RegExp(
			/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/)
			.test(mail));
}

// 验证传真
function isfax(fax){
	return	(new RegExp( /^(\d{3,4}-)?\d{7,8}$/).test(fax));
}

//验证正整数，最多是10位数的整数
function isint(int){
	return (new RegExp(/^[1-9](\d{1,8})?$/).test(int))
}

//屏蔽检测脚本攻击
function safeStr(str){
	return str.replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;");
}
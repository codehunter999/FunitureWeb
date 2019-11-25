function check(){
	
	var f = document.register;
	
	var email = f.email.value;
	if(email=="" || email==null){
		alert("Email을 입력하세요");
		f.email.focus();
		return;
	}
	
	var password = f.password.value;
	if(password=="" || password==null){
		alert("Password를 입력하세요");
		f.password.focus();
		return;
	}
	
	var name = f.name.value;
	if(name=="" || name==null){
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}
	
	var phone2 = f.phone2.value;
	if(phone2=="" || phone2==null){
		alert("전화번호를 입력하세요");
		f.phone2.focus();
		return;
	}
	
	f.action = "register_ok.fu";
	f.submit();
}

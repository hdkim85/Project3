package model;

import java.sql.Date;
/*
 DTO객체(Data Transfer Object)
 	: 데이터를 저장하기 위한 객체로 멤버변수, 생성자, getter/setter
 		메소드를 가지고있는 클래스로 일반적인 자바빈(Bean)규약을 따른다.
  */
public class MemberDTO {
	//멤버변수 : 정보은닉을 위해 private으로 선언함.
	private String id;
	private String pass;
	private String name;
	private int grade;
	private String phone;
	private String hp;
	private String email;
	private String postalCode;
	private String address1;
	private String address2;
	private java.sql.Date regidate;
	private String openemail;
	private String areement1;
	
	
	
	
	
	//getter/setter
	
	public String getAreement1() {
		return areement1;
	}


	public void setAreement1(String areement1) {
		this.areement1 = areement1;
	}


	public String getOpenemail() {
		return openemail;
	}


	public void setOpenemail(String openemail) {
		this.openemail = openemail;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getHp() {
		return hp;
	}


	public void setHp(String hp) {
		this.hp = hp;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPostalCode() {
		return postalCode;
	}


	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}


	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public java.sql.Date getRegidate() {
		return regidate;
	}


	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	
	/*
	 Object클래스에서 제공하는 메소드로 객체를 문자열행태로 변형해서
	 반환해주는 역할을 한다. toString()메소드를 오버라이딩하면
	 객체 자체를 그대로 print()하는 것이 가능하다.
	 */
	@Override
	public String toString() {
		return String.format("아이디:%s, 비밀번호:%s, 이름:%s", 
				id, pass, name);
	}
	
}

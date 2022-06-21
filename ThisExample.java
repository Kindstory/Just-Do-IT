package java0617;

//  클래스 구성요소 : 멤버변수, 메서드, 생성자

/* 한 파일안에 클래스가 2개 별로 권장하지 않음 교육용으로만 쓰임. 한 파일에는 하나의 클래스 
 	한 파일안에 클래스가 여러개 일 경우, 파일이름과 동일한 클래스만  public만 붙일 수 있다.
 	main이 없을수도 있음. 주로 출력하는 main함수를 클래스로 따로 만듬.
 	public이 붙어있는 클래스만 main을 줄 수 있다. */

/* this.멤버변수
 * this(..)  // 생성자 
 * this 
 */

class Birthday{
	int day;
	int month;
	int year;
	
	public void setYear(int year) {
		this.year = year;
	}
	
	public void printThis() {
		System.out.println(this);
	}

} // class Birthday



public class ThisExample {

	public static void main(String[] args /*args는 main메서드에 지역변수.*/) {
		
		Birthday bDay = new Birthday(); // bDay는 Birthday자료형이며, 참조 변수(객체)이므로 bDay값이 들어있는 주소 값을 가진다.
		bDay.setYear(2000);
		System.out.println(bDay);
		bDay.printThis();

	} // main

}

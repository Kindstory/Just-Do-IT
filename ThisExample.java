package java0617;

//  Ŭ���� ������� : �������, �޼���, ������

/* �� ���Ͼȿ� Ŭ������ 2�� ���� �������� ���� ���������θ� ����. �� ���Ͽ��� �ϳ��� Ŭ���� 
 	�� ���Ͼȿ� Ŭ������ ������ �� ���, �����̸��� ������ Ŭ������  public�� ���� �� �ִ�.
 	main�� �������� ����. �ַ� ����ϴ� main�Լ��� Ŭ������ ���� ����.
 	public�� �پ��ִ� Ŭ������ main�� �� �� �ִ�. */

/* this.�������
 * this(..)  // ������ 
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

	public static void main(String[] args /*args�� main�޼��忡 ��������.*/) {
		
		Birthday bDay = new Birthday(); // bDay�� Birthday�ڷ����̸�, ���� ����(��ü)�̹Ƿ� bDay���� ����ִ� �ּ� ���� ������.
		bDay.setYear(2000);
		System.out.println(bDay);
		bDay.printThis();

	} // main

}

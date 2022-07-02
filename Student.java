package java0701;

import java.util.ArrayList;


public class Student {
	int studentID;
	String studentName;
	ArrayList<Subject> subjectList; // subject�� ������ �������� �ʾұ� ������, ArrayList�� ����� �ȴ�.
	// ���̺귯���� ���� �̸��� Ŭ������ �����, ���� ���� Arraylist�� �ڹ� ��ƿ��Ƽ�� �ִ� Arraylist�� �浹�Ѵ�.
	// �ڹ� �����Ϸ��� ���� ���� Arraylist�� �켱�Ѵ�.
	
	
	public Student(int studentID, String studentName) {
		this.studentID = studentID;
		this.studentName = studentName;
		subjectList = new ArrayList<Subject>();
	}
	
	public void addSubject(String name, int score) { // addsubject�޼��� �ȿ� arraylist.add�޼��带 �� �־�J�� ����
													 // �޼��� �ȿ� �޼��� �޼ӿ� �� ���߸� ����	
		Subject subject = new Subject();
		subject.setName(name);
		subject.setScorePoint(score);
		subjectList.add(subject);
	}
	
	public void showStudentInfo() {
		int total = 0;
		for(Subject s : subjectList) {
			total += s.getScorePoint();
			System.out.println("�л� " + studentName + "�� " + s.getName() + " ���� ������ " + s.getScorePoint() + "�Դϴ�.");
		}
		
		System.out.println("�л� " + studentName + "�� ������ " + total + " �Դϴ�." );
	}
	
	
	
}

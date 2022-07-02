package java0701;

import java.util.ArrayList;


public class Student {
	int studentID;
	String studentName;
	ArrayList<Subject> subjectList; // subject의 개수가 정해지지 않았기 때문에, ArrayList로 만들면 된다.
	// 라이브러리랑 같은 이름의 클래스를 만드면, 내가 만든 Arraylist랑 자바 유틸리티에 있는 Arraylist가 충돌한다.
	// 자바 컴파일러는 내가 만든 Arraylist를 우선한다.
	
	
	public Student(int studentID, String studentName) {
		this.studentID = studentID;
		this.studentName = studentName;
		subjectList = new ArrayList<Subject>();
	}
	
	public void addSubject(String name, int score) { // addsubject메서드 안에 arraylist.add메서드를 또 넣어놧네 ㅇㅇ
													 // 메서드 안에 메서드 꿈속에 꿈 몽중몽 구조	
		Subject subject = new Subject();
		subject.setName(name);
		subject.setScorePoint(score);
		subjectList.add(subject);
	}
	
	public void showStudentInfo() {
		int total = 0;
		for(Subject s : subjectList) {
			total += s.getScorePoint();
			System.out.println("학생 " + studentName + "의 " + s.getName() + " 과목 성적은 " + s.getScorePoint() + "입니다.");
		}
		
		System.out.println("학생 " + studentName + "의 총점은 " + total + " 입니다." );
	}
	
	
	
}

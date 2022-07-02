package java0701;

import java.util.ArrayList;

import java0627.Book;


public class ArrayListTest_Book {

	public static void main(String[] args) {
		
		ArrayList <Book> library = new ArrayList<Book>();
		
		library.add(new Book("�¹���", "������", 1));
		library.add(new Book("���̾�", "�츣�� �켼", 2));
		library.add(new Book("��� �� ���ΰ�", "���ù�", 3));
		library.add(new Book("������ ����ҿ���", "���� ����Ŭ", 4));
		library.add(new Book("�����", "�������丮", 5));
		
		for(int i = 0; i < library.size(); i++) {
			Book book = library.get(i);
			book.showBookInfo();
		}
		
		System.out.println();
		
		System.out.println("=== ���� for�� ��� ===");
		for(Book book : library) {
			book.showBookInfo();
		}
		
		
		
		
		
		
	}

}

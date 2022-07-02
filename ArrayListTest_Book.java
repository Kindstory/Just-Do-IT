package java0701;

import java.util.ArrayList;

import java0627.Book;


public class ArrayListTest_Book {

	public static void main(String[] args) {
		
		ArrayList <Book> library = new ArrayList<Book>();
		
		library.add(new Book("태백산맥", "조정래", 1));
		library.add(new Book("데미안", "헤르만 헤세", 2));
		library.add(new Book("어떻게 살 것인가", "유시민", 3));
		library.add(new Book("죽음의 수용소에서", "빅터 프랭클", 4));
		library.add(new Book("어린왕자", "생택쥐페리", 5));
		
		for(int i = 0; i < library.size(); i++) {
			Book book = library.get(i);
			book.showBookInfo();
		}
		
		System.out.println();
		
		System.out.println("=== 향상된 for문 사용 ===");
		for(Book book : library) {
			book.showBookInfo();
		}
		
		
		
		
		
		
	}

}

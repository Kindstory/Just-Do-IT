
package java0701;

import java.util.ArrayList;
import java.util.Arrays;

public class ArrayListEx1 {

	public static void main(String[] args) {
		
		ArrayList<Integer> numbers = new ArrayList<Integer>();
		
		numbers.add(100);
		numbers.add(101);
		numbers.add(102);
		numbers.add(103);
		numbers.add(104);
		
		System.out.println(numbers.size());
		System.out.println("===========================================");
		numbers.remove(2);
		
		for(int data : numbers) {
			System.out.println(data);
		}
		
		System.out.println("===========================================");
		
		if(numbers.contains(104)) {
			System.out.println("104있다.");
			
		}
		else {
			System.out.println("104없다.");
		}
		
		System.out.println("===========================================");
		
		System.out.println(numbers.get(3));		
		

	}

}

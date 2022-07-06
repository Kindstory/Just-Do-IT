package array;

public class DimensionEx1 {

	public static void main(String[] args) {
		//char[] alpha1 = new char[26];
		char[][] alph = new char[13][2]; //char[2][13]
		//alph[0][0] ~  alph[12][1] ,alph.length= 13, alph[0].lenth=2 ~,alph[12].length=2
		char ch ='a';
		for(int i=0; i<alph.length;i++) {
			for(int j=0; j<alph[i].length;j++) {
				alph[i][j]=ch;        //(0,0) , (0,1), (1,0);
				ch++;
			}
		}
		
		for(int i=0; i<alph.length;i++) {
			for(int j=0; j<alph[i].length;j++) {
				System.out.println("["+i+"]["+j+"] = "+alph[i][j]);
			}
		}
		
	}

}

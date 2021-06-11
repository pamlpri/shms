package kr.ac.shms;

import org.junit.Test;

public class ScoreTest {

	@Test
	public void test() {
		// 조기졸업
		int eMid_scre = (int)(Math.random() * (100 - 90 + 1)) + 90;
		int eFinal_scre = (int)(Math.random() * (100 - 90 + 1)) + 90;
//		System.out.println("조기 졸업자 중간고사 점수 : " + eMid_scre);
//		System.out.println("조기 졸업자 기말고사 점수 : " + eFinal_scre);
		
		// 일반
		int mid_scre = (int)(Math.random() * (100 - 75 + 1)) + 75;
		int final_scre = (int)(Math.random() * (100 - 75 + 1)) + 75;
		System.out.println("중간고사 점수 : " + mid_scre);
		System.out.println("기말고사 점수 : " + final_scre);
	}

}

package day02;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class Lotto {
	int[] rnd;
	Integer[] m;
//	List<Integer> rndList;

	public Lotto() {
		rnd = new int[45];
		m = new Integer[6];
//		rndList = new ArrayList<Integer>();
		init(); // 초기화
		shuffle(); // 1000번 섞기
//		shuffleList();
		set(); // 6개의 값 배열에 담기
//		setList();
		sort(); // 정렬
	}

	public void init() {
		for (int i = 0; i < rnd.length; i++) {
			rnd[i] = i + 1;
		}
	}

	public void shuffle() {
		for (int i = 0; i < 1000; i++) {
			int a = (int) (Math.random() * 45);
			int b = (int) (Math.random() * 45);
			int temp = 0;
			temp = rnd[a];
			rnd[a] = rnd[b];
			rnd[b] = temp;
		}
	}
//	public void shuffleList() {
//		List<Integer> rndList = Arrays.stream(rnd).boxed().collect(Collectors.toList());
//		Collections.shuffle(rndList);
//	}

	public void set() {
		for (int i = 0; i < 6; i++) {
			m[i] = rnd[i];
		}
	}
//	public void setList() {
//		for (int i = 0; i < 5; i++) {
//			m[i] = rndList.get(i);
//		}
//	}

	public void sort() {
		Arrays.sort(m);
	}

	public void print() {
		System.out.println(Arrays.toString(m));
	}

	public Integer[] lottoBall() {
		return m;
	}
}

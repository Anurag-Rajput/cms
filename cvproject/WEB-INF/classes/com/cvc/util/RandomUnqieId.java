package com.cvc.util;

import java.util.Random;


public class RandomUnqieId {

	
	public static long unique() {
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		sb.append(random.nextInt(9) + 1);
		for (int i = 0; i < 11; i++) {
			sb.append(random.nextInt(10));
		}
		return Long.valueOf(sb.toString()).longValue();
	}

	
	public static String filePath(String absolutePath, String lastIndex) {
		return absolutePath.substring(absolutePath.indexOf(lastIndex));
	}

}

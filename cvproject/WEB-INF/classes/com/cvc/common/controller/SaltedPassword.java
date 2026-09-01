package com.cvc.common.controller;

import org.apache.commons.codec.binary.Base64;

public class SaltedPassword {
	public static void main(String[] args) {
		
		// encode data on your side using BASE64
		byte[]   bytesEncoded = Base64.encodeBase64("cvc" .getBytes());
		System.out.println("ecncoded value is " + new String(bytesEncoded ));

		// Decode data on other side, by processing encoded data
		byte[] valueDecoded= Base64.decodeBase64(bytesEncoded );
		System.out.println("Decoded value is " + new String(valueDecoded));

	}
}

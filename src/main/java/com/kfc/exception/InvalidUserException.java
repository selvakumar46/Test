package com.kfc.exception;

public class InvalidUserException extends Exception {

	@Override
	public String getMessage() {
		return "Invaild Details";
	}

}

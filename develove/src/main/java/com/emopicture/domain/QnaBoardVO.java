package com.emopicture.domain;

import java.sql.Date;
import java.util.Arrays;

public class QnaBoardVO extends BoardVO{

	
	private String email;
	
	private Date answerdate;
	
	private String answeryn;
	
	private String[] files;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getAnswerdate() {
		return answerdate;
	}

	public void setAnswerdate(Date answerdate) {
		this.answerdate = answerdate;
	}

	public String getAnsweryn() {
		return answeryn;
	}

	public void setAnsweryn(String answeryn) {
		this.answeryn = answeryn;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "QnaBoardVO [email=" + email + ", answerdate=" + answerdate + ", answeryn=" + answeryn + ", files="
				+ Arrays.toString(files) + "]";
	}
	
	

	
}

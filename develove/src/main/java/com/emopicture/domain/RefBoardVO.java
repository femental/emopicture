package com.emopicture.domain;

import java.util.Arrays;

public class RefBoardVO extends BoardVO {

	private Integer attyn;
	
	private String[] files;

	public Integer getAttyn() {
		return attyn;
	}

	public void setAttyn(Integer attyn) {
		this.attyn = attyn;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "RefBoardVO [attyn=" + attyn + ", files=" + Arrays.toString(files) + "]";
	}
	
	
}

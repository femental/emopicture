package com.emopicture.domain;

import java.sql.Date;

public class BoardVO {
	
	



//free
	private Integer bno;
	private Integer mno;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
	private Integer viewcnt;
	private Integer replycnt;
	private String nickname;
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public Integer getMno() {
		return mno;
	}
	public void setMno(Integer mno) {
		this.mno = mno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public Integer getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(Integer viewcnt) {
		this.viewcnt = viewcnt;
	}
	public Integer getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(Integer replycnt) {
		this.replycnt = replycnt;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", mno=" + mno + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", updatedate=" + updatedate + ", viewcnt=" + viewcnt + ", replycnt=" + replycnt
				+ ", nickname=" + nickname + "]";
	}
	

}

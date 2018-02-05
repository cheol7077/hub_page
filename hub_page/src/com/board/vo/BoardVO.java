package com.board.vo;

import java.util.Date;

public class BoardVO {
	private int id;
	private String title;
	private String content = "";
	private String date;
	private String url;
	private int hits;
	private int coCnt;
	private int rec = 0;
	private String cid;
	private String thumbnail = "사진이 없습니다";
	private String dateCompare;
	private String bid;
	private String overlab = "";
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getCoCnt() {
		return coCnt;
	}
	public void setCoCnt(int coCnt) {
		this.coCnt = coCnt;
	}
	public int getRec() {
		return rec;
	}
	public void setRec(int rec) {
		this.rec = rec;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getDateCompare() {
		return dateCompare;
	}
	public void setDateCompare(String dateCompare) {
		this.dateCompare = dateCompare;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getOverlab() {
		return overlab;
	}
	public void setOverlab(String overlab) {
		this.overlab = overlab;
	}

	
}	

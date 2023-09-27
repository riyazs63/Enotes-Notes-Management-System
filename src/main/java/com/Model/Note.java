package com.Model;

import java.util.Date;

public class Note {

	private int id;
	private String title;
	private String content;
	private Date date;
	private User user;

	public Note() {
		super();
	}

	public Note(int id, String title, String content, Date date, User user) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.user = user;
	}

	public Note(int id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}

	public Note(int id, String title, String content, Date date) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
	}

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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}

package com.skilldistillery.rpg.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RPG {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;

	private String description;

	private String developer;

	private String publisher;

	@Column(name = "release_year")
	private int releaseYear;

	@Column(name = "url_image")
	private String urlImage;

	@Column(name = "url_review")
	private String urlReview;

	// end of field

	public RPG() {
	}

	public RPG(int id, String title, String description, String developer,
			String publisher, int releaseYear, String urlImage, String urlReview) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.developer = developer;
		this.publisher = publisher;
		this.releaseYear = releaseYear;
		this.urlImage = urlImage;
		this.urlReview = urlReview;
	}

	// end of constructors

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDeveloper() {
		return developer;
	}

	public void setDeveloper(String developer) {
		this.developer = developer;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(int releaseYear) {
		this.releaseYear = releaseYear;
	}

	public String getUrlImage() {
		return urlImage;
	}

	public void setUrlImage(String urlImage) {
		this.urlImage = urlImage;
	}

	public String getUrlReview() {
		return urlReview;
	}

	public void setUrlReview(String urlReview) {
		this.urlReview = urlReview;
	}

	@Override
	public String toString() {
		return "RPG [id=" + id + ", title=" + title + ", description=" + description
				+ ", developer=" + developer + ", publisher=" + publisher
				+ ", releaseYear=" + releaseYear + ", urlImage=" + urlImage
				+ ", urlReview=" + urlReview + "]";
	}

}

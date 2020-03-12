package org.movie.domain;

import java.util.List;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum;
	private int amount;
	
	
	private String tableType;
	private String type;
	private String searchKeyword;
	private String keyword;
	private List<String> genreList;
	
	public Criteria (){
		this (1,12);
	}
	
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
	    
	    return type == null? new String[] {}: type.split("");
	  }
}

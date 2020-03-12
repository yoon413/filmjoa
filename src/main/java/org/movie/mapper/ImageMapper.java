package org.movie.mapper;

import org.movie.domain.ImageVO;

public interface ImageMapper {

	public void insert(ImageVO vo);
	
	public void delete(Long mno);
	
	public ImageVO findByMno (Long mno);
}

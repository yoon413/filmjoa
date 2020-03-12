package org.movie.mapper;

import java.util.List;

import org.movie.domain.BoardVO;
import org.movie.domain.Criteria;

public interface BoardMapper {

	public int insertSelectKey(BoardVO board);
	
	public int insertReply(BoardVO board);
	
	public BoardVO readBoardByBno(Long bno);
	
	public int deleteBoard(BoardVO board);
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int updateBoard(BoardVO board);
	
	public int readTotalCount(Criteria cri);
}

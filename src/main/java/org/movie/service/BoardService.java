package org.movie.service;

import java.util.List;

import org.movie.domain.BoardVO;
import org.movie.domain.Criteria;

public interface BoardService {

	public void register(BoardVO board);
	
	public void registerReply(BoardVO board);
	
	public BoardVO getBoardByBno(Long bno);
	
	public boolean removeBoard(BoardVO board);
	
	public List<BoardVO> getList(Criteria cri);
	
	public boolean modifyBoard(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	
}

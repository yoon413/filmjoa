package org.movie.service;

import java.util.List;

import org.movie.domain.BoardVO;
import org.movie.domain.Criteria;
import org.movie.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {

		log.info("register......" + board);

		mapper.insertSelectKey(board);
	}

	@Override
	public void registerReply(BoardVO board) {

		mapper.insertReply(board);
		
	}

	@Override
	public BoardVO getBoardByBno(Long bno) {
		
		return mapper.readBoardByBno(bno);
	}

	@Override
	public boolean removeBoard(BoardVO board) {
		log.info(board.getBno());
		log.info(board.getBrd_groupOrd());
		return mapper.deleteBoard(board) == 1;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public boolean modifyBoard(BoardVO board) {
		
		return mapper.updateBoard(board)==1;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		
		return mapper.readTotalCount(cri);
	}


	

	
}

package org.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
//import org.apache.ibatis.annotations.Select;
import org.wine.domain.BoardVO;
import org.wine.domain.Criteria;

public interface BoardMapper {
	//@Select("select*from tblBoardTest where boardNum>0")
	 public List<BoardVO> getList();
	 public void insert(BoardVO board);
	 public void insertSelectKey(BoardVO board);
	 public BoardVO read(Long boardNum);
	 public int delete(Long boardNum);
	 public int update(BoardVO board);
	 public List<BoardVO> getQListWithPaging(Criteria cri);
	 public List<BoardVO> getBListWithPaging(Criteria cri);
	 public int getTotalCount(Criteria cri);
	 public int getBTotalCount(Criteria cri);
	 public void updateBoardReadCount(Long boardNum);
	 
	 
	 public void updateReplyCnt(@Param("boardNum") Long boardNum, @Param("amount") int amount);
	
}

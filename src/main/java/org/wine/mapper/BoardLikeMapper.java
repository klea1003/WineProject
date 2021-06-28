package org.wine.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.wine.domain.BoardLikeVO;
import org.wine.domain.Criteria;

public interface BoardLikeMapper {
	
	 public void insert(BoardLikeVO boardLike);
	 public void update(BoardLikeVO boardLike);
	 public void updateD(BoardLikeVO boardLike);
	 public int getTotalLike(Long boardNum);
	 public int read(BoardLikeVO like);
	 
	 
	
}

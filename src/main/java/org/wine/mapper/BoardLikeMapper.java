package org.wine.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.wine.domain.BoardLikeVO;
import org.wine.domain.Criteria;

public interface BoardLikeMapper {
	
	 public void insert(BoardLikeVO boardLike);
	 public void update(String userID);
	 public void updateD(String userID);
	 public int getTotalLike(Long boardNum);
	 public int read(BoardLikeVO like);
	 
	 
	
}

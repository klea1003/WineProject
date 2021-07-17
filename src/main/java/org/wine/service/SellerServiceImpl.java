package org.wine.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wine.domain.SellerImageVO;
import org.wine.domain.SellerVO;
import org.wine.mapper.SellerMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Log4j
@Service
@AllArgsConstructor
public class SellerServiceImpl implements SellerService{
	
	private SellerMapper mapper;
	
	@Override
	public List<SellerVO> getList() {
		
		log.info("getList................");
		
		return mapper.getList();
	}
	
	@Override
	public List<SellerImageVO> getImageList(Long sellerNum) {
		
		log.info("getImageList..........");
		
		return mapper.getImageList(sellerNum);
		
	}	

	@Override
	public SellerVO get(Long sellerNum) {
		
		log.info("get........." + sellerNum);
		
		return mapper.read(sellerNum);
	}

	@Override
	public boolean modify(SellerVO seller) {
		
		log.info("modify....." + seller);
		
		return mapper.update(seller) == 1;
	}

	@Override
	public boolean remove(Long sellerNum) {
		
		log.info("remove...." + sellerNum);
		
		return mapper.delete(sellerNum) == 1;
	}
 
}

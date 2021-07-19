  package org.wine.mapper;
  
  import java.util.List;
  
  import org.wine.domain.ProfileVO; 
   
  public interface UserAttachMapper {
  
  public void insert(ProfileVO vo);
  
  public void delete(String profileUuid);
  
  public List<ProfileVO> findByUserNum(Long userNum); 
  
  public List<ProfileVO> findByUserNumCK(Long userNum);
  
  public int deleteimage(Long userNum);
  }
 
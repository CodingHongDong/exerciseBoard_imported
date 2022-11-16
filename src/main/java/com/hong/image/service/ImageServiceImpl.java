package com.hong.image.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hong.image.mapper.ImageMapper;
import com.hong.image.vo.ImageVO;
import com.hong.util.domain.PageObject;

@Service
public class ImageServiceImpl implements ImageService{

	@Inject
	private ImageMapper mapper;
	
	
	@Override
	public List<ImageVO> list(PageObject pageObject) throws Exception {
		
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		return mapper.list(pageObject);
	}

	@Override
	public long getTotalRow(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getTotalRow(pageObject);
	}

	@Override
	public ImageVO view(long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}

	@Override
	public int imageChange(ImageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.imageChange(vo);
	}

	@Override
	public int write(ImageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int update(ImageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}

	@Override
	public int increase(long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.increase(no);
	}

	@Override
	public int updateReplyCount(int no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateReplyCount(no);
	}

	@Override
	public int getTotalBoard(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getTotalBoard(memberId);
	}

}

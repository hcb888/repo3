package com.chaoLiuWangLuo.OASys.service.impl;

import javax.persistence.UniqueConstraint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaoLiuWangLuo.OASys.entity.AoaAttachmentList;
import com.chaoLiuWangLuo.OASys.mapper.AoaAttachmentListMapper;
import com.chaoLiuWangLuo.OASys.service.attachmentService;
import com.chaoLiuWangLuo.OASys.service.attendsService;

@Service
@Transactional
public class attachmentServiceImpl  implements attachmentService{
	@Autowired
	private AoaAttachmentListMapper mapper;

	public int addAttachment(AoaAttachmentList attachmentList) {
		
		return  mapper.insert(attachmentList);
	}
	
}

package com.chaoLiuWangLuo.OASys.service;

import com.chaoLiuWangLuo.OASys.entity.AoaAttachmentList;
import com.chaoLiuWangLuo.OASys.entity.AoaBursement;

public interface bursementService {

	int addBursement(AoaBursement bursement);

	AoaBursement findById(Long id);

 
}

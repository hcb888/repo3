package com.chaoLiuWangLuo.OASys.error;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class GlobalExceptionReslover implements HandlerExceptionResolver {
 
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object val,
			Exception exception) {
		 	//写日志
			//发送错误短信
			//转发错误页面
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.addObject("message", "你的网络出现了问题，请稍后重试");
			modelAndView.setViewName("error");
		
		return modelAndView;
	}
	
}

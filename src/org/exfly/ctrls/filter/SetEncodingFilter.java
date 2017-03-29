package org.exfly.ctrls.filter;


import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class SetEncodingFilter implements Filter {    
	@Override
	public void destroy() {}    
		@Override 
		public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {       
		//设置字符编码       
		request.setCharacterEncoding("UTF-8");       
		//将控制传到下一个过滤器，如果没有过滤器则传到被调用者       
		chain.doFilter(request, response);    
	}   
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {}
}

// utf-8 在web中的使用		https://www.ibm.com/developerworks/cn/web/wa-lo-utf8/
// http请求相应头			https://kb.cnblogs.com/page/92320/

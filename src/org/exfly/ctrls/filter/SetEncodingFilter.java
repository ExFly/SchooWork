package org.exfly.ctrls.filter;


import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

public class SetEncodingFilter implements Filter {    
	@Override
	public void destroy() {}    
	@Override 
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {       
		HttpServletRequest request = (HttpServletRequest) req;
	    HttpServletResponse response = (HttpServletResponse) resp;
	    // 这里我们先解决post方式的乱码问题
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");

	    // 解决get方式的乱码问题
	    MyCharacterEncodingRequest requestWrapper = new MyCharacterEncodingRequest(request);

	    chain.doFilter(requestWrapper, response);   
	}   
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {}
}

// utf-8 在web中的使用		https://www.ibm.com/developerworks/cn/web/wa-lo-utf8/
// http请求相应头			https://kb.cnblogs.com/page/92320/

class MyCharacterEncodingRequest extends HttpServletRequestWrapper {
    // 这里我们使用一个变量记住Servlet传递的request对象。
    private HttpServletRequest request;

    public MyCharacterEncodingRequest(HttpServletRequest request) {
        super(request);
        this.request = request;
    }

    @Override
    // 增强此方法，此方法得到表单提交的数据
    public String getParameter(String name) {
        String value = this.request.getParameter(name);
        if (value == null) {// 如果为空直接返回空即可
            return null;
        }
        if (!this.request.getMethod().equalsIgnoreCase("get")) {
            // 如果不是get方式则没必要转换
            return value;
        }
        try {
            /*
             * value = new
             * String(value.getBytes("ISO8859-1"),"UTF-8");//手工转换,不要写死
             */

            value = new String(value.getBytes("ISO-8859-1"),
                    this.request.getCharacterEncoding());// 和Request设置的编码一致
            return value;// 这里使用ISO-8859-1没有解决乱码，这里浏览器
            // 提交的本就是UTF-8编码，不需要转换
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
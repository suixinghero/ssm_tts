package org.ssm_tts.util;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author xujin
 * @package-name org.ssm_tts.util
 * @createtime 2019-09-12 17:57
 */

/**
 * 异常处理器类
 */
public class SysExceptionResolver implements HandlerExceptionResolver {
    /**
     * ex当前异常抛出的对象SysException
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @return
     */
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("error");
        return modelAndView;
    }
}

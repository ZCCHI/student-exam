package com.student.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.student.bean.News;
import com.student.service.NewsService;
import com.student.utils.AjaxResult;
import com.student.utils.Page;
import com.student.utils.StringUtil;

@Controller
@RequestMapping("/news")
public class NewController {

	
	@Autowired
	private NewsService newsService;
	
	@RequestMapping("/mynews")
	public String mynews(){
		
		return "news/NewsInfo";
	}
	
	@RequestMapping("/detailNews")
	public String detailNews(){
		
		return "news/index";
	}
	
	@RequestMapping("/queryNewsDeail")
	public String queryNewsDeail(Integer id,Map<String,Object> map){
		
		News news = newsService.queryNewsInfoById(id);
		map.put("news", news);
		
		return "news/newsDetInfo";
	}
	
	@ResponseBody
	@RequestMapping("/upNews")
	public AjaxResult upNews(News news){		
		AjaxResult result = new AjaxResult(); 
		
		try {	
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyy-MM-dd");
			news.setTime(format.format(date));
			int count = newsService.saveNews(news);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage("查询失败");
			e.printStackTrace();
		}
				
		return result;		
	}
	
	
		//后台新闻查询分页
		@ResponseBody
		@RequestMapping("/queryPage")
		public AjaxResult queryPage(@RequestParam(value="pageno",required=false,defaultValue="1")Integer pageno,
				@RequestParam(value="pagesize",required=false,defaultValue="10")Integer pagesize,String queryText){
			AjaxResult result = new AjaxResult();
			
			Map<String,Object> paramMap = new HashMap<String,Object>();
			paramMap.put("pageno", pageno);
			paramMap.put("pagesize", pagesize);
			
			if(StringUtil.isNotEmpty(queryText)){
				
				if(queryText.contains("%")){
					queryText = queryText.replaceAll("%", "\\\\%");//%是特殊字符，需要转义
				}
				paramMap.put("queryText", queryText);
			}	
			
			try {
				Page page = newsService.queryPage(paramMap);
				result.setSuccess(true);
				result.setPage(page);
			} catch (Exception e) {			
				e.printStackTrace();
				result.setSuccess(false);
				result.setMessage("加载数据失败！");
			}						
			return result;		
		}
		
		//后台新闻查询详情
		@ResponseBody
		@RequestMapping("/queryContent")
		public AjaxResult queryContent(Integer id){		
			AjaxResult result = new AjaxResult(); 
			
			try {					
				News news = newsService.queryContent(id);				
				result.setData(news.getContent());
				result.setSuccess(true);
			} catch (Exception e) {
				result.setSuccess(false);
				result.setMessage("查询失败");
				e.printStackTrace();
			}
					
			return result;		
		}
		
		
		//后台删除新闻
		@ResponseBody
		@RequestMapping("/delete")
		public AjaxResult delete(Integer id){		
			AjaxResult result = new AjaxResult(); 
			
			try {					
				int count = newsService.deleteNewsId(id);							
				result.setSuccess(true);
			} catch (Exception e) {
				result.setSuccess(false);
				result.setMessage("查询失败");
				e.printStackTrace();
			}			
			return result;		
		}
		
}

package com.student.utils;

import java.util.List;

public class Page {
	
	private Integer pageno;//当前页 
	private Integer pagesize; //每页数
	private List datas;//数据
	private Integer total; //总记录数
	private Integer totalpage; //总页数
	
	public Page(Integer pageno,Integer pagesize){ //构造方法
		if(pageno <= 0){
			this.pageno = 1;
		}else{
			this.pageno = pageno;
		}
		if(pagesize <= 0){
			this.pagesize = 10;
		}else{
			this.pagesize = pagesize;
		}		
	}
	
	public Integer getPageno() {
		return pageno;
	}
	public void setPageno(Integer pageno) {
		this.pageno = pageno;
	}
	public Integer getPagesize() {
		return pagesize;
	}
	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}
	public List getDatas() {
		return datas;
	}
	public void setDatas(List datas) {
		this.datas = datas;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
		this.totalpage = (total % pagesize) == 0 ? (total / pagesize):(total / pagesize + 1); //在设置总记录数时同时计算出总页数
	}

	public Integer getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(Integer totalpage) {
		this.totalpage = totalpage;		
	}
	
	//计算开始行
	public Integer getStartIndex(){
		return (this.pageno - 1) * pagesize;
	}

}

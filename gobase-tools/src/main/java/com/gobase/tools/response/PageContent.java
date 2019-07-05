package com.gobase.tools.response;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;


/**
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description: 分页实体 </p> 
 * <p>Author:zcliu/刘子萃</p>
 * @param <T>
 */
public class PageContent<T> implements Serializable {

    private static final long serialVersionUID = 6795731302338456186L;
    /**
     * 列表内容
     */
    private List<T> content = Collections.emptyList();
    /**
     * 页码
     */
    private int pageNum;
    /**
     * 每页大小
     */
    private int pageSize;
    /**
     * 总共多少条数据
     */
    private int totalNum;
    /**
     * 总共多少页
     */
    private int totalPages;
    
    
    public PageContent (){}

    public PageContent(int pageNum, int pageSize, int totalNum, List<T> content) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.totalNum = totalNum;
        this.totalPages = (totalNum + pageSize - 1) / pageSize;
        this.content = content;
    }

    public List<T> getContent() {
        return content;
    }

    public void setContent(List<T> content) {
        this.content = content;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

}

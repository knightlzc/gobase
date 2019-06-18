package com.gobase.component.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
/**
 * 
 * <p>Copyright: All Rights Reserved</p>  
 * <p>Description:通用模板类  </p> 
 * <p>Author:zcliu/刘子萃</p>
 * @param <E>
 * @param <T>
 */
public interface IBaseMapper<E, T> {
    /**
     * 
     * <br/>Description:根据模板查询总数
     * <p>Author:zcliu/刘子萃</p>
     * @param example
     * @return
     */
    long countByExample(E example);

    /**
     * <br/>Description:根据模板删除
     * <p>Author:zcliu/刘子萃</p>
     * @param example
     * @return
     */
    int deleteByExample(E example);

    /**
     * <br/>Description:根据主键删除
     * <p>Author:zcliu/刘子萃</p>
     * @param example
     * @return
     */
    int deleteByPrimaryKey(int id);

    /**
     * <br/>Description:插入一条记录
     * <p>Author:zcliu/刘子萃</p>
     * @param record
     * @return
     */
    int insert(T record);

    /**
     * <br/>Description:插入非null属性
     * <p>Author:zcliu/刘子萃</p>
     * @param record
     * @return
     */
    int insertSelective(T record);

    /**
     * <br/>Description:根据模板查询
     * <p>Author:zcliu/刘子萃</p>
     * @param record
     * @return
     */
    List<T> selectByExample(E example);

    /**
     * <br/>Description:根据主键查询
     * <p>Author:zcliu/刘子萃</p>
     * @param record
     * @return
     */
    T selectByPrimaryKey(int id);

    /**
     * <br/>Description:根据模板更新非null属性
     * <p>Author:zcliu/刘子萃</p>
     * @param record
     * @return
     */
    int updateByExampleSelective(@Param("record") T record, @Param("example") E example);

    /**
     * <br/>Description:根据模板更新所有属性
     * <p>Author:zcliu/刘子萃</p>
     * @param record
     * @return
     */
    int updateByExample(@Param("record") T record, @Param("example") E example);

    /**
     * <br/>Description:根据主键更新非null属性
     * <p>Author:zcliu/刘子萃</p>
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(T record);

    /**
     * <br/>Description:根据主键更新所有属性
     * <p>Author:zcliu/刘子萃</p>
     * @param record
     * @return
     */
    int updateByPrimaryKey(T record);
}
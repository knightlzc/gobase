package com.gobase.component.dao.mall.role;

import com.gobase.component.bean.mall.role.PfUserRoleRef;
import com.gobase.component.bean.mall.role.PfUserRoleRefExample;
import com.gobase.component.dao.IBaseMapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PfUserRoleRefMapper extends IBaseMapper<PfUserRoleRefExample, PfUserRoleRef>{

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table pf_user_role_ref
	 * @mbg.generated  Wed Sep 18 11:46:28 CST 2019
	 */
	long countByExample(PfUserRoleRefExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table pf_user_role_ref
	 * @mbg.generated  Wed Sep 18 11:46:28 CST 2019
	 */
	int deleteByExample(PfUserRoleRefExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table pf_user_role_ref
	 * @mbg.generated  Wed Sep 18 11:46:28 CST 2019
	 */
	int deleteByPrimaryKey(Long id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table pf_user_role_ref
	 * @mbg.generated  Wed Sep 18 11:46:28 CST 2019
	 */
	int insert(PfUserRoleRef record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table pf_user_role_ref
	 * @mbg.generated  Wed Sep 18 11:46:28 CST 2019
	 */
	int insertSelective(PfUserRoleRef record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table pf_user_role_ref
	 * @mbg.generated  Wed Sep 18 11:46:28 CST 2019
	 */
	List<PfUserRoleRef> selectByExample(PfUserRoleRefExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table pf_user_role_ref
	 * @mbg.generated  Wed Sep 18 11:46:28 CST 2019
	 */
	PfUserRoleRef selectByPrimaryKey(Long id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table pf_user_role_ref
	 * @mbg.generated  Wed Sep 18 11:46:28 CST 2019
	 */
	int updateByExampleSelective(@Param("record") PfUserRoleRef record, @Param("example") PfUserRoleRefExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table pf_user_role_ref
	 * @mbg.generated  Wed Sep 18 11:46:28 CST 2019
	 */
	int updateByExample(@Param("record") PfUserRoleRef record, @Param("example") PfUserRoleRefExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table pf_user_role_ref
	 * @mbg.generated  Wed Sep 18 11:46:28 CST 2019
	 */
	int updateByPrimaryKeySelective(PfUserRoleRef record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table pf_user_role_ref
	 * @mbg.generated  Wed Sep 18 11:46:28 CST 2019
	 */
	int updateByPrimaryKey(PfUserRoleRef record);

}
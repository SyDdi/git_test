package com.car.portal.dto;

import java.io.Serializable;

/**
 * 第三方车系-子项参数
 * 
 * @author wangjh7
 * @date 2016-08-14
 *
 */
public class SubSeriesEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "SubSeriesEntity [id=" + id + ", name=" + name + "]";
	}

}

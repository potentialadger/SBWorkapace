package com.group.dto;

import lombok.Data;

@Data
public class OrderDetailsDto {
	
	private Integer itemNo;
	private Integer itemQuantity;
	private Integer ItemSpec;
	private String specValue;
	
	public Integer getItemNo() {
		return itemNo;
	}
	public void setItemNo(Integer itemNo) {
		this.itemNo = itemNo;
	}
	public Integer getItemQuantity() {
		return itemQuantity;
	}
	public void setItemQuantity(Integer itemQuantity) {
		this.itemQuantity = itemQuantity;
	}
	public Integer getItemSpec() {
		return ItemSpec;
	}
	public void setItemSpec(Integer itemSpec) {
		ItemSpec = itemSpec;
	}
	public String getSpecValue() {
		return specValue;
	}
	public void setSpecValue(String specValue) {
		this.specValue = specValue;
	}
	
	
}

package com.group.dto;

import lombok.Data;

@Data
public class OrderDetailsDto {
	
	private Integer itemNo;
	private Integer itemQuantity;
	private Integer ItemSpec;
	
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
	
	
}

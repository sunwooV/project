package project.Buy.P001.D005.vo;

public class AmountVO {
	 private Integer total, tax_free, vat, point, discount;
	 
	 

	public AmountVO() {
		System.out.println("B_P001_D005VO 시작");
		System.out.println("AmountVO 생성자호출");
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getTax_free() {
		return tax_free;
	}

	public void setTax_free(Integer tax_free) {
		this.tax_free = tax_free;
	}

	public Integer getVat() {
		return vat;
	}

	public void setVat(Integer vat) {
		this.vat = vat;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	 

}

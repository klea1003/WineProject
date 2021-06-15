package org.wine.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString



public class pageDTO {

	private int startPage; //ȭ�鿡 �������� �������� ���۹�ȣ
	private int endPage; //ȭ�鿡 �������� �������� ����ȣ
	private boolean prev, next; //���� Ȥ�� ���������� ���� ����
	private int total; //��ü �����ͼ�
	private Criteria cri;
	public pageDTO(Criteria cri, int total) {
		this.cri = cri; this.total = total;
		this.endPage = (int)Math.ceil(cri.getPageNum()/10.)*10;
		this.startPage = this.endPage-9;
		int realEnd = (int)Math.ceil(total*1.0/cri.getAmount());
		if(realEnd<this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	
}

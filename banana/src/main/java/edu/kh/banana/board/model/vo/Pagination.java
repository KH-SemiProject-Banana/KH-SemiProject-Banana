package edu.kh.banana.board.model.vo;

public class Pagination {

	private int currentPage; // 현재 페이지 번호
	private int listCount; // 전체 게시글 수

	private int limit = 10; // 한 페이지 목록에 보여지는 게시글 수
	private int pageSize = 10; // 페이지 하단에 보여질 페이지 번호 갯수

	private int maxPage; // 마지막 페이지 번호
	private int startPage; // 보여지는 첫 번째 페이지 번호
	private int endPage; // 보여지는 마지막 페이지 번호

	private int prevPage; // 이전 페이지의 페이지 번호 맨 끝( < 기호)
	private int nextPage; // 다음 페이지의 페이지 번호 시작 ( > 기호)

	public Pagination(int listCount, int currentPage) {
		this.listCount = listCount;
		this.currentPage = currentPage;

		makePagination();
	}

	public Pagination(int currentPage, int listCount, int limit, int pageSize) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.pageSize = pageSize;

		makePagination();
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		makePagination();
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
		makePagination();
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
		makePagination();
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		makePagination();
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	@Override
	public String toString() {
		return "Pagination [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
				+ ", pageSize=" + pageSize + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + "]";
	}
	
	
	// 페이징 처리에 필요한 값을 계산하는 메서드
	// 객체가 생성되거나 값이 변경될 때 자동으로 계산됨
	private void makePagination() {
		
		// maxPage = 최대 페이지 == 마지막 페이지 == 총 페이지 수
		
		maxPage = (int)Math.ceil((double) listCount / limit);
		
		// startPage : 페이지네이션 목록에서 제일 앞에 보여지는 페이지 수
		startPage = (currentPage -1) / pageSize * pageSize + 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		if(currentPage <= 10) prevPage = 1;
		else prevPage = startPage - 1;
		
		if(endPage == maxPage) nextPage = maxPage;
		else nextPage = endPage + 1;
	}

}

/**
 * 
 */
package com.wyp.mybatis.model;

import java.util.List;

/**
 * @author wyp
 * 
 */
public class Pages {

	private List<User> listUser;
    private List<Meets> listmeet;
    private List<Announce> listannounce;
    private List<Advertisement> listadvertise;
    private List<Rooms> listroom;
    

	/**
	 * 每页显示的记录数
	 */
	private int pageSize;
	/**
	 * 总页数
	 */
	private long totalPages;
	/**
	 * 总记录数
	 */
	private long allRecords;
	/**
	 * 是否是第一页
	 */
	private boolean isFirstPage;
	/**
	 * 是否是最后一页
	 */
	private boolean isFinalPage;
	/**
	 * 是否有上一页
	 */
	private boolean hasPreviousPage;
	/**
	 * 是否有下一页
	 */
	private boolean hasNextPage;
	/**
	 * 当前页数
	 */
	private int currentPage;
	private int pageCount;//显示页面数量
	private int beginPageIndex;//开始页面
	private int endPageIndex;//结束页面
	
	public Pages(int currentPage, int pageSize, int allRecords
			,int pageCount) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.allRecords = allRecords;
		this.pageCount = pageCount;
		//计算总页数
		this.totalPages = (this.allRecords + pageSize -1) / pageSize;
		//如果总页数小于指定页数
		if(this.totalPages <= this.pageCount){
			beginPageIndex = 1;
			endPageIndex = (int)totalPages;
		}else{
			
			beginPageIndex = currentPage - pageCount/2 + 1;
			endPageIndex = currentPage + pageCount/2;
			if(beginPageIndex<1){
				beginPageIndex = 1;
				endPageIndex = pageCount;
			}
			if(endPageIndex>totalPages){
				beginPageIndex = (int)totalPages - pageCount +1;
				endPageIndex  = (int)totalPages;
			}
		}
	}
	
	
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getBeginPageIndex() {
		return beginPageIndex;
	}

	public void setBeginPageIndex(int beginPageIndex) {
		this.beginPageIndex = beginPageIndex;
	}

	
	public int getEndPageIndex() {
		return endPageIndex;
	}

	
	public void setEndPageIndex(int endPageIndex) {
		this.endPageIndex = endPageIndex;
	}

	

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public long getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(long totalPages) {
		this.totalPages = totalPages;
	}

	public long getAllRecords() {
		return allRecords;
	}

	public void setAllRecords(long allRecords) {
		this.allRecords = allRecords;
	}

	public boolean isFirstPage() {
		return isFirstPage;
	}

	public void setFirstPage(boolean isFirstPage) {
		this.isFirstPage = isFirstPage;
	}

	public boolean isFinalPage() {
		return isFinalPage;
	}

	public void setFinalPage(boolean isFinalPage) {
		this.isFinalPage = isFinalPage;
	}

	public boolean isHasPreviousPage() {
		return hasPreviousPage;
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}

	public boolean isHasNextPage() {
		return hasNextPage;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	public Pages() {
		init(hasNextPage, hasNextPage, hasNextPage, hasNextPage);
	}

	/**
	 * @TODO 初始化分页信息
	 * @param isFirstPage
	 * @param isFinalPage
	 * @param hasPreviousPage
	 * @param hasNextPage
	 */
	public void init(boolean isFirstPage, boolean isFinalPage,
			boolean hasPreviousPage, boolean hasNextPage) {
		this.isFirstPage = isFirstPage;
		this.isFinalPage = isFinalPage;
		this.hasPreviousPage = hasPreviousPage;
		this.hasNextPage = hasNextPage;
	}

	/**
	 * @TODO 计算总页数
	 * @param pageSize
	 * @parammeans 每页的记录数
	 * @param allRecords
	 * @parammeans 总记录数
	 * @return 总页数
	 */
	public static long calculateTotalPage(final int pageSize,
			final long allRecords) {
		long total = (allRecords % pageSize == 0) ? allRecords / pageSize
				: allRecords / pageSize + 1;
		if (total == 0) {
			total = 1;
		}
		return total;
	}

	/**
	 * @TODO 计算当前页的开始记录数
	 * @param pageSize
	 * @parammeans 每页记录数
	 * @param currentPage
	 * @parammeans 当前第几页
	 * @return 当前页开始记录数
	 */
	public static int currentPage_startRecord(final int pageSize,
			final int currentPage) {
		final int startRecord = pageSize * (currentPage - 1);
		return startRecord;
	}

	/**
	 * @TODO 判断当前页是否小于等于0
	 * @param nowPage
	 * @parammeans 当前页
	 * @return 判断当前页的结果
	 */
	public static int judgeCurrentPage(int nowPage) {
		final int judgeCurrent = (nowPage <= 0) ? 1 : nowPage;
		return judgeCurrent;
	}

	public List<User> getListUser() {
		return listUser;
	}

	public void setListUser(List<User> listUser) {
		this.listUser = listUser;
	}

	public List<Meets> getListmeet() {
		return listmeet;
	}

	public void setListmeet(List<Meets> listmeet) {
		this.listmeet = listmeet;
	}

	public List<Announce> getListannounce() {
		return listannounce;
	}

	public void setListannounce(List<Announce> listannounce) {
		this.listannounce = listannounce;
	}

	public List<Advertisement> getListadvertise() {
		return listadvertise;
	}

	public void setListadvertise(List<Advertisement> listadvertise) {
		this.listadvertise = listadvertise;
	}


	public List<Rooms> getListroom() {
		return listroom;
	}


	public void setListroom(List<Rooms> listroom) {
		this.listroom = listroom;
	}

    
    
}

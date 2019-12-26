package com.funi.util;

import org.springframework.stereotype.Component;

/*@Component("MyUtil")*/
public class MyUtil1 {
	
	//�쟾泥� �럹�씠吏��닔 援ы븯湲�
	//numPerPage : �븳�솕硫댁뿉 �몴�떆�븷 �뜲�씠�꽣�쓽 媛��닔
	//dataCount : �쟾泥� �뜲�씠�꽣�쓽 媛��닔
	public int getPageCount(int numPerPage, int dataCount){
		
		int pageCount = 0;
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;
		
		return pageCount;	
		
	}
	
		//페이징 처리 메소드
		//currentPage :현재 표시할 페이지
		//totalPage : 전체 페이지수
		//listUrl : 링크를 설정할 url
		public String pageIndexList(int currentPage, int totalPage, String listUrl){
			
			int numPerBlock = 5; //1◀이전 6 7 8 9 10 다음▶11(6-10까지 표시되는 페이지 갯수)
			int currentPageSetup; //표시할 첫 페이지(6)의 – 1 해준 값(5,10,15,20...)
			int page;
			
			StringBuffer sb = new StringBuffer();
			
			if(currentPage==0 || totalPage==0)	//데이터가 없을 경우
				return "";
			
			//abc.jsp?a=1
			if(listUrl.indexOf("?") != -1)  //주소줄에 ?표가 있다면
				listUrl = listUrl + "&";
			else
				listUrl = listUrl + "?";
			
			//표시할 첫 페이지의 – 1 해준 값
			currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
			
			if(currentPage % numPerBlock == 0)
				currentPageSetup = currentPageSetup - numPerBlock;
			
			//◀이전
			if(totalPage > numPerBlock && currentPageSetup > 0){
							
				sb.append("<li><a href=\"" + listUrl + "pageNum=" 
						+ currentPageSetup + "\">◀</a></li>&nbsp;");
				
			}
			
			//바로가기 페이지
			page = currentPageSetup + 1;
			
			while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
				
				if(page == currentPage){				
					
					sb.append("<li><span class=\"page-number current\">" + page + "</span></li>&nbsp;");				
				
				}else{
					
					sb.append("<li><a href=\"" + listUrl + "pageNum=" + page + "\" class=\"page-number\">"
							+ page + "</a></li>&nbsp;");
					
				}
				
				page++;
				
			}		
			
			//다음▶
			if(totalPage - currentPageSetup > numPerBlock){
							
				sb.append("<li><a href=\"" + listUrl + "pageNum=" + page + "\">▶</a></li>&nbsp;");
				
			}
			
			
			return sb.toString();
			
		}
	}

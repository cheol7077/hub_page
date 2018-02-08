package com.board.vo;

import java.util.ArrayList;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;


public class OverlabConversion {
	
	public ArrayList<String> getOverlab(String overlab) throws Exception{
		Connection.Response response = Jsoup.connect("https://www.google.co.kr/searchbyimage?image_url=" + overlab + "&encoded_image=&image_content=&filename=&hl=ko&start=1")
				.method(Connection.Method.GET).execute();	//받아온 이미지 경로를 구글 이미지검색 URL에 넣음
		response = Jsoup.connect(String.valueOf(response.url()).replace("&hl", ",qdr:y&hl"))
				.method(Connection.Method.GET).execute();	//월 별로 검색하기 위해 다시 파싱
		Document document = response.parse();
		
		ArrayList<String> titleList = new ArrayList<String>();
		ArrayList<String> urlList = new ArrayList<String>() ;
		ArrayList<String> aList = new ArrayList<String>();			//title, url, a링크 변수리스트 선언
		
		for (int i = 0; i < document.select(".rc > .r a").size(); i++) {		//구글의 select 태그
			titleList.add(document.select(".rc > .r a").get(i).text());
			urlList.add(document.select(".rc > .r a").get(i).attr("href"));
		}
		
		for(int i=0; i<titleList.size(); i++) {		//크롤링 된 글의 개수 만큼 가공
			aList.add("<a class = 'boardurl' \" + href = '" + urlList.get(i)+ "'>"+ titleList.get(i)+"</a>");
		}
		
		if(aList.size()==0) {		//검색 결과가 없을 경우
			aList.add("사진이 중복된 글을 찾을 수 없습니다");
		}
			
		return aList;
	}

}

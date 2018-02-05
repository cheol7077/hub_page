package com.board.vo;

import java.util.ArrayList;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;


public class OverlabConversion {
	
	public ArrayList<String> getOverlab(String overlab) throws Exception{
		Connection.Response response = Jsoup.connect("https://www.google.co.kr/searchbyimage?image_url=" + overlab + "&encoded_image=&image_content=&filename=&hl=ko&start=1")
				.method(Connection.Method.GET).execute();
		response = Jsoup.connect(String.valueOf(response.url()).replace("&hl", ",qdr:y&hl"))
				.method(Connection.Method.GET).execute();
		Document document = response.parse();
		
		ArrayList<String> titleList = new ArrayList<String>();
		ArrayList<String> urlList = new ArrayList<String>() ;
		ArrayList<String> aList = new ArrayList<String>();
		
		for (int i = 0; i < document.select(".rc > .r a").size(); i++) {
			titleList.add(document.select(".rc > .r a").get(i).text());
			urlList.add(document.select(".rc > .r a").get(i).attr("href"));
		}
		
		for(int i=0; i<titleList.size(); i++) {
			aList.add("<a class = 'boardurl' \" + href = '" + urlList.get(i)+ "'>"+ titleList.get(i)+"</a>");
		}
		
		if(aList.size()==0) {
			aList.add("사진이 중복된 글을 찾을 수 없습니다");
		}
			
		return aList;
	}

}

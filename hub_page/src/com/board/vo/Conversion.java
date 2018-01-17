package com.board.vo;

import java.util.List;

public class Conversion {
	List<BoardVO> list ;
	String temp = "";
	String thumbnail = "";
	public List<BoardVO> conversion(List<BoardVO> list){
		
		for(int i=0; i<list.size(); i++) {
			thumbnail = "";
			temp = list.get(i).getContent();
			temp = temp.replace("\\", "::");
			String contents[] = temp.split("::");
			temp = "";
		
			for(int j=0; j<contents.length; j++) {
			contents[j] = contents[j].replace("::","");
			
			if(contents[j].startsWith("http:http")) {
				contents[j] = contents[j].replace("http:http:", "http:");
			}
			
			if(contents[j].startsWith("http")&&((contents[j].endsWith("jpg")||(contents[j].endsWith("bmp"))||(contents[j].endsWith("gif"))||(contents[j].endsWith("png"))||(contents[j].endsWith("jpeg"))
					||(contents[j].endsWith("JPG"))||(contents[j].endsWith("JPEG"))||(contents[j].endsWith("BMP"))||(contents[j].endsWith("GIF"))||(contents[j].endsWith("PNG")) ))){
				contents[j] = "<img width = 200 height = 200 src =\'" +contents[j] + "\'/>" + "";

			}else if(contents[j].startsWith("https://www.youtube.com")||(contents[j].startsWith("https://media"))){
				contents[j] = "<iframe src =\'" +contents[j] + "\'></iframe>"  ;
			}else if(contents[j].startsWith("http")){
				contents[j] = "<a href =\'" +contents[j] + "\'></a>" ;						
			}
			temp += contents[j];
			}
			for(int k=0; k<contents.length; k++) {
				if(contents[k].startsWith("<img")) {
					thumbnail = contents[k];
					if(thumbnail.contains("transparent.gif")) {
						thumbnail = "사진이 없습니다";
					}
					break;
				}
			}
			
			list.get(i).setThumbnail(thumbnail);
			if(list.get(i).getThumbnail().equals("")) {
				list.get(i).setThumbnail("사진이 없습니다");
			}
			list.get(i).setContent(temp);
			
		}
		return list;
	}
	
}	

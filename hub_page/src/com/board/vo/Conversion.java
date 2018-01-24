package com.board.vo;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Conversion {
	TIME_MAXIMUM t = new TIME_MAXIMUM();
	List<BoardVO> list ;
	String dateCompare ="";
	String temp = "";
	String thumbnail ="";
	String communityId = "";
	String boardId = "";
	String path = "";
	
	public List<BoardVO> getThumbnail(List<BoardVO> list) {
		File thumbnailName = null;
		
		
		for(int i=0; i<list.size(); i++) {
		
			try {
			communityId = list.get(i).getCommunityID();
			boardId = list.get(i).getBoardId();
			File f = new File("\\\\192.168.1.31\\crawler\\file\\"+communityId+"\\"+boardId);
			
			File[] allFiles = f.listFiles();
			for (File file : allFiles) {
				if (file.getName().endsWith("jpg")||(file.getName().endsWith("bmp"))||(file.getName().endsWith("gif"))||(file.getName().endsWith("png"))||(file.getName().endsWith("jpeg"))
						||(file.getName().endsWith("JPG"))||(file.getName().endsWith("JPEG"))||(file.getName().endsWith("BMP"))||(file.getName().endsWith("GIF"))||(file.getName().endsWith("PNG"))) {
					thumbnailName = file;
					break;
				}
			}
			path = "file1/"+communityId+ "/" + boardId + "/" + thumbnailName.getName();
			thumbnail = "<img src =\'" +path +"'"+" alt='사진을 로드하지 못했습니다'  style='width:400px; height:400px'/>";
			list.get(i).setThumbnail(thumbnail);
			
			}catch(Exception e) {
				list.get(i).setThumbnail("사진이 없습니다");
			}
			
		}
	
		

		return list;
	}
	
	
	
	public List<BoardVO> conversion(List<BoardVO> list) throws ParseException{
		list = getThumbnail(list);
		
		for(int i=0; i<list.size(); i++) {
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
					||(contents[j].endsWith("JPG"))||(contents[j].endsWith("JPEG"))||(contents[j].endsWith("BMP"))||(contents[j].endsWith("GIF"))||(contents[j].endsWith("PNG")) || contents[j].contains("ruliweb") ))){
				contents[j] = "<img src =\'" +contents[j] +"'"+" alt='사진을 로드하지 못했습니다'  style='width:400px; height:400px'/>" ;

			}else if(contents[j].startsWith("https://www.youtube.com")||(contents[j].startsWith("https://media"))){
				contents[j] = "<iframe src =\'" +contents[j] + "\'></iframe>"  ;
			}else if(contents[j].startsWith("http")){
				contents[j] = "<a href =\'" +contents[j] + "\'></a>" ;						
			}
			temp += contents[j];
			}
			
			list.get(i).setContent(temp);
			
			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(list.get(i).getDate());
			dateCompare = t.calculateTime(date);
			list.get(i).setDateCompare(dateCompare);
	
			/*에펨코리아만 썸네일 url로 처리*/
			String thum = "";
			for(int j=0; j<contents.length; j++) {
				if(contents[j].startsWith("<img ")) {
					thum = contents[j];
					
					if(list.get(i).getCommunityID().equals("c1")) {
						list.get(i).setThumbnail(thum);
					}
					break;
				}
			}
			
		}
		return list;
	}
	
}	

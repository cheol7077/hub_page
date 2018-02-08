package com.board.vo;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Conversion {
	TIME_MAXIMUM t = new TIME_MAXIMUM();
	List<BoardVO> list;
	String dateCompare = "";
	String temp = "";
	String thumbnail = "";
	String communityId = "";
	String boardId = "";
	String path = "";

	// 다운로드 한 이미지 썸네일에 넣는 함수
	public List<BoardVO> getThumbnail(List<BoardVO> list) {
		File thumbnailName = null;

		for (int i = 0; i < list.size(); i++) {
			
			try {
				communityId = list.get(i).getCid(); // DB에서 받은 cid
				boardId = list.get(i).getBid(); // DB에서 받은 bid
				File f = new File("Y:\\이미지크롤러\\img_crawler\\file\\"
						+ communityId + "\\" + boardId); // 이미지 경로(분석용)

				File[] allFiles = f.listFiles();
				for (File file : allFiles) { // 폴더 안에 있는 이미지 확장명 검사해서 이미지 파일일 경우
												// thumbnailName 변수에 이미지 파일 이름을
												// 넣음(첫번째 사진만)
					if (file.getName().endsWith("jpg") || (file.getName().endsWith("bmp"))
							|| (file.getName().endsWith("gif")) || (file.getName().endsWith("png"))
							|| (file.getName().endsWith("jpeg")) || (file.getName().endsWith("JPG"))
							|| (file.getName().endsWith("JPEG")) || (file.getName().endsWith("BMP"))
							|| (file.getName().endsWith("GIF")) || (file.getName().endsWith("PNG"))) {
						thumbnailName = file;
						break;
					}
				}
				path = "file1/" + communityId + "/" + boardId + "/" + thumbnailName.getName(); // 워크스페이스
																								// 사진
																								// 경로(출력용)
				thumbnail = "<img src =\'" + path + "'" + " alt='사진을 로드하지 못했습니다'  style='width:400px; height:400px'/>"; // 썸네일
																														// 태그
																														// 붙이기
				list.get(i).setThumbnail(thumbnail); // 리스트에 썸네일 저장

			} catch (Exception e) {
				list.get(i).setThumbnail("사진이 없습니다"); // 아무런 사진이 없을 경우 "사진이
														// 없습니다" 라는 문자열 저장
			}
		}
		return list; // 썸네일만 담은 리스트 반환
	}

	public List<BoardVO> conversion(List<BoardVO> list) throws ParseException {
		list = getThumbnail(list); // 위의 썸네일가공하는 함수 실행

		for (int i = 0; i < list.size(); i++) { // content 내용 가공
			temp = list.get(i).getContent();
			temp = temp.replace(" ", "::"); // 공백은 split이 안되어 ::로 대체
			String contents[] = temp.split("::"); // 공백으로 나누어져 있는 이미지 하나씩 떼내어
													// 배열에 저장
			temp = "";

			for (int j = 0; j < contents.length; j++) { // 떼네어진 이미지URL 중복사진 처리위해
														// 가공
				contents[j] = contents[j].replace("::", ""); // 혹시 모를 불필요한 ::
																// 있으면 삭제

				// if(contents[j].startsWith("http:http")) {
				// contents[j] = contents[j].replace("http:http:", "http:");
				// }
				if (contents[j].startsWith("http") && ((contents[j].endsWith("jpg") || (contents[j].endsWith("bmp"))
						|| (contents[j].endsWith("gif")) || (contents[j].endsWith("png"))
						|| (contents[j].endsWith("jpeg")) || (contents[j].endsWith("JPG"))
						|| (contents[j].endsWith("JPEG")) || (contents[j].endsWith("BMP"))
						|| (contents[j].endsWith("GIF")) || (contents[j].endsWith("PNG"))
						|| contents[j].contains("ruliweb") || contents[j].endsWith("mp4")))) {
					// URL 끝 검사(이미지URL인지 검사)
					if (list.get(i).getOverlab().equals("")) // 만약에 현재 Overlab
																// 변수가 공백이면.
						list.get(i).setOverlab(contents[j]); // 첫번째 사진을 셋팅함

					contents[j] = "<img src =\'" + contents[j] + "'"
							+ " alt='사진을 로드하지 못했습니다'  style='width:400px; height:400px'/>";

				}
			}

			list.get(i).setContent(temp);

			// ~시간 전 처리

			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(list.get(i).getDate());
			dateCompare = t.calculateTime(date);
			list.get(i).setDateCompare(dateCompare);

			/* 에펨코리아만 썸네일 url로 처리 사진 다운로드 완벽하면 지워도 됨 */
			String thum = "";
			for (int j = 0; j < contents.length; j++) {
				if (contents[j].startsWith("<img ")) {
					thum = contents[j];

					if (thum.contains("transparent.gif")) {
						thum = "사진이 없습니다";
						continue;
					}
					if (list.get(i).getCid().equals("c1")) {
						list.get(i).setThumbnail(thum);
					}
					break;
				}
			}

		}
		return list;
	}

}

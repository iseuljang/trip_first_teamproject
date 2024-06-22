package test;
import java.text.SimpleDateFormat;
import java.util.*;

import trip.dto.*;
import trip.vo.*;

public class test 
{
	public static void main(String[] args) 
	{
		/* 이메일 인증. 
		userDTO dto = new userDTO();
		userVO vo = new userVO();
		dto.Email("gyr0204@naver.com");
		*/
		
		
		/* 공지글 추가
		adminboardVO vo = new adminboardVO();
		adminboardDTO dto = new adminboardDTO();
		vo.setUno("1");
		vo.setAdtitle("공지제목0");
		vo.setFname("img.jpg");
		vo.setPname("asdfzxv");
		vo.setUnick("test");
		vo.setStartday("2024-03-23");
		vo.setEndday("2024-04-20");
		dto.Insert(vo);
		vo.setStartday("2024-04-03 09:18:31");
		vo.setEndday("2024-05-26 09:18:31");
		ArrayList<adminboardVO> list = dto.GetList(vo);
		for(adminboardVO item : list)
		{
			System.out.println(item.getAdtitle());
		}
		*/
		
		
		/* 일반게시물 리스트
		boardDTO dto = new boardDTO();
		boardVO vo = new boardVO();
		searchVO svo = new searchVO();
		String[] season = {"봄","여름"};
		String[] local = {"전남","충청도"};
		String[] human = {"가족","연인"};
		String[] key = {"제목","0"};
		svo.setSeason(season);
		svo.setLocal(local);
		svo.setHuman(human);
	
		int page = 5;
		
		ArrayList<boardVO> blist = dto.GetList(1, "", key, svo, page);
		
		for(boardVO item : blist)
		{
			System.out.println(item.getBtitle());
		}
		*/ 
		
		
		/* 북마크 추가하기
		boardDTO dto = new boardDTO();
		
		dto.bookInsert("5", "23");
		*/
		
		
		/* 북마크 삭제하기
		boardDTO dto = new boardDTO();
		
		dto.bookDelete("5", "13");
		*/
		
		
		/* 북마크 리스트 불러오기
		boardDTO dto = new boardDTO();
		
		ArrayList<boardVO> mlist = dto.bookList("5", 5, 1);
		for(boardVO vo : mlist)
		{
			System.out.println(vo.getBtitle());
		}
		*/
	}
}

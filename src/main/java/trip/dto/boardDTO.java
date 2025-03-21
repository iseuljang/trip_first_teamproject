package trip.dto;

import java.util.*;

import trip.dao.*;
import trip.vo.*;

//게시물 정보 관리 클래스
public class boardDTO extends DBManager
{
	//게시물을 등록한다.
	//리턴값 : true - 등록성공, false - 등록실패	
	public boolean Insert(boardVO vo)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		//Board 테이블에 자료를 등록한다.
		String sql = "";
		sql  = "insert into board ";
		sql += "(uno,btitle,season,local,human,move,schedule,uinout,bnote,unick) ";
		sql += " values ";
		sql += " ( ";
		sql += "'" + vo.getUno() + "',";
		sql += "'" + this._R(vo.getBtitle()) + "',";
		sql += "'" + vo.getSeason()  + "',";
		sql += "'" + vo.getLocal()  + "',";
		sql += "'" + vo.getHuman()  + "',";
		sql += "'" + vo.getMove()  + "',";
		sql += "'" + vo.getSchedule()  + "',";
		sql += "'" + vo.getUinout()  + "',";
		sql += "'" + this._R(vo.getBnote()) + "',";
		sql += "'" + vo.getUnick()  + "'";
		sql += " ) ";
		this.RunSQL(sql);

		//등록된 게시물의 번호를 얻는다.
		sql = "select last_insert_id() as bno ";
		this.OpenQuery(sql);
		this.GetNext();
		String bno = this.GetValue("bno");
		vo.setBno(bno);
		
		this.DBClose();
		return true;
	}
	
	//게시물을 삭제한다.
	//리턴값 : true - 삭제성공, false - 삭제실패	
	public boolean Delete(String bno)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		//첨부파일 삭제 -> 댓글 삭제 -> 북마크삭제 -> 게시물 삭제
		String sql = "";
		sql = "delete from attach where bno = " + bno;
		this.RunSQL(sql);

		sql = "delete from reply where bno = " + bno;
		this.RunSQL(sql);
		
		sql = "delete from bookmark where bno = " + bno;
		this.RunSQL(sql);

		sql = "delete from board where bno = " + bno;
		this.RunSQL(sql);
		
		this.DBClose();
		return true;		
	}
	
	//게시물 정보를 변경한다.
	//리턴값 : true - 변경성공, false - 변경실패	
	public boolean Update(boardVO vo)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		//Board 테이블에 자료를 변경한다.
		String sql = "";
		sql  = "update board ";
		sql += "set ";
		sql += "btitle = '" + this._R(vo.getBtitle()) + "', ";
		sql += "season = '" + vo.getSeason()  + "',";
		sql += "local = '" + vo.getLocal()  + "',";
		sql += "human = '" + vo.getHuman()  + "',";
		sql += "move = '" + vo.getMove()  + "',";
		sql += "schedule = '" + vo.getSchedule()  + "',";
		sql += "uinout = '" + vo.getUinout()  + "',";
		sql += "bnote = '" + this._R(vo.getBnote()) + "' ";
		sql += "where bno = '" + vo.getBno() + "' ";
		this.RunSQL(sql);
		
		
		this.DBClose();
		return true;		
	}
	
	//게시물 정보를 조회한다.
	//ishit : true - 조회수를 증가, false - 조회수 증가 안함.
	public boardVO Read(String bno,boolean ishit)
	{
		if( this.DBOpen() == false )
		{
			return null;
		}
		
		String sql = "";
		//해당 게시물 번호에 대한 정보를 조회한다.
		sql  = "select uno,btitle,season,local,human,move,schedule,uinout,bnote,bwdate,bhit,blike,bhate, ";
		sql += "(select unick from user where uno = board.uno) as unick ";
		sql += "from board ";
		sql += "where bno = " + bno;
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
	
		boardVO vo = new boardVO();
		vo.setBno(bno);
		vo.setUno(this.GetValue("uno"));
		vo.setBtitle(this.GetValue("btitle"));
		vo.setSeason(this.GetValue("season"));
		vo.setLocal(this.GetValue("local"));
		vo.setHuman(this.GetValue("human"));
		vo.setMove(this.GetValue("move"));
		vo.setSchedule(this.GetValue("schedule"));
		vo.setUinout(this.GetValue("uinout"));
		vo.setBnote(this.GetValue("bnote"));
		vo.setBwdate(this.GetValue("bwdate"));
		vo.setBhit(this.GetValue("bhit"));
		vo.setBlike(this.GetValue("blike"));
		vo.setBhate(this.GetValue("bhate"));
		vo.setUnick(this.GetValue("unick"));		
		
		if(ishit == true)
		{
			//조회수를 증가시킨다.
			sql  = "update board set bhit = bhit + 1 ";
			sql += "where bno = " + bno;
			this.RunSQL(sql);
		}
		
		this.DBClose();
		return vo;
	}
	
	//전체 게시물 갯수를 얻는다. 
	//type : T - 제목에서 검색, N - 내용에서 검색 , 빈값 : 제목+내용에서 검색   , U : 닉네임검색
	//keyword : 검색어 
	public int GetTotal(String type,String[] keyword,searchVO svo)
	{
		int total = 0;
		if( this.DBOpen() == false )
		{
			return total;
		}
		
		//게시물의 갯수를 얻는다.
		String sql = "";
		sql  = "select count(*) as count "; 
		sql += "from board ";
		//sql += "where ";
		
		String where = "";
		for(String key : keyword)
		{
			if(key.length() > 0)
			{
				if(type.equals("T")||type.equals("G"))
				{
					//제목에서 검색 
					if(!where.equals("")){ where += " and ";	}
					where += "btitle like '%" + key + "%' ";
				}else if(type.equals("N"))
				{
					//내용에서 검색 
					if(!where.equals("")){ where += " and ";	}					
					where += "bnote like '%" + key + "%' ";
				}else if(type.equals("U"))
				{
					//닉네임에서 검색 
					if(!where.equals("")){ where += " and ";	}				
					where += "unick like '%" + key + "%'  ";
				}else
				{
					//제목 + 내용에서 검색 
					if(!where.equals("")){ where += " and ";	}				
					where += "( btitle like '%" + key + "%' ";
					where += "or bnote like '%" + key + "%' ) ";
				}
			}
		}	
		//검색조건 6종키워드 
		if(svo!=null)
		{
			String sixkey = "";
			// 제목 내용에서 검색 구문이 있으면 and 추가
			if(where.length() > 0 )
			{
				sixkey += " and";
			}
			String s_key = "";
			if(svo.getSeason()!=null )
			{
				if(svo.getSeason().length > 0 && !svo.getSeason()[0].equals(""))
				{
					s_key += " season in (";
					// (키워드,키워드)
					for(String key : svo.getSeason())
					{
						s_key += "'" + key + "',";
					}
					// , 제거
					s_key = s_key.substring(0, (s_key.length()-1));
					// ) 추가
					s_key += ")";
					sixkey += s_key;
				}
			}
			String l_key = "";
			if(svo.getLocal()!=null)
			{
				if(svo.getLocal().length > 0 && !svo.getLocal()[0].equals(""))
				{
					if(s_key.length() > 0 )
					{
						l_key += " and ";
					}
					l_key += " local in (";
					for(String key : svo.getLocal())
					{
						l_key += "'" + key + "',";
					}
					l_key = l_key.substring(0, (l_key.length()-1));
					l_key += ")";
					sixkey += l_key;
				}
			}
			String h_key = "";
			if(svo.getHuman()!=null)
			{
				if(svo.getHuman().length > 0 && !svo.getHuman()[0].equals(""))
				{
					if(l_key.length() >0 || s_key.length() > 0)
					{
						h_key += " and ";
					}
					h_key += " human in (";
					for(String key : svo.getHuman())
					{
						h_key += "'" + key + "',";
					}
					h_key = h_key.substring(0, (h_key.length()-1));
					h_key += ")";
					sixkey += h_key;
				}
			}
			String m_key = "";
			if(svo.getMove()!=null)
			{
				if(svo.getMove().length > 0 && !svo.getMove()[0].equals(""))
				{
					if(h_key.length() >0 || s_key.length() > 0 || l_key.length() >0)
					{
						m_key += " and ";
					}
					m_key += " move in (";
					for(String key : svo.getMove())
					{
						m_key += "'" + key + "',";
					}
					m_key = m_key.substring(0, (m_key.length()-1));
					m_key += ")";
					sixkey += m_key;
				}
			}
			String sc_key = "";
			if(svo.getSchedule()!=null)
			{
				if(svo.getSchedule().length > 0 && !svo.getSchedule()[0].equals(""))
				{
					if(m_key.length() >0 || s_key.length() > 0 || l_key.length() >0 || h_key.length() >0)
					{
						sc_key += " and ";
					}
					sc_key += " schedule in (";
					for(String key : svo.getSchedule())
					{
						sc_key += "'" + key + "',";
					}
					sc_key = sc_key.substring(0, (sc_key.length()-1));
					sc_key += ")";
					sixkey += sc_key;
				}
			}
			String u_key = "";
			if(svo.getUinout()!=null)
			{
				if(svo.getUinout().length > 0 && !svo.getUinout()[0].equals(""))
				{
					if(l_key.length() >0 || m_key.length() >0 || s_key.length() > 0 || l_key.length() >0 || h_key.length() >0)
					{
						u_key += " and ";
					}
					u_key += " uinout in (";
					for(String key : svo.getUinout())
					{
						u_key += "'" + key + "',";
					}
					u_key = u_key.substring(0, (u_key.length()-1));
					u_key += ")";
					sixkey += u_key;
				}
			}
			
			if(sixkey.length() > 4)
			{
				where += sixkey;
			}
		}
		
		if(!where.equals(""))
		{
			sql += " where " + where;
		}
		this.OpenQuery(sql);
		this.GetNext();
		total = this.GetInt("count");
		this.CloseQuery();
		
		this.DBClose();
		return total;
	}
	
	//게시물 목록을 조회한다.  
	//type : T - 제목에서 검색, N - 내용에서 검색 , 빈값 : 제목+내용에서 검색   , U : 닉네임검색
	//keyword : 검색어 	
	public ArrayList<boardVO> GetList(int pageno,String type,String[] keyword, searchVO svo, int perpage )
	{
		ArrayList<boardVO> list = new ArrayList<boardVO>();
		
		if( this.DBOpen() == false )
		{
			return list;
		}		
		
		//게시물 목록을 얻는다.
		String sql = "";
		sql  = "select bno,btitle,bnote, date(bwdate) as bwdate,bhit, blike,season,local,human,move,schedule,uinout, ";
		sql += "(select unick from user where uno = board.uno) as unick, ";
		sql += "(select count(rno) from reply where bno = board.bno) as rno, "; 
		sql += "(select ano from attach where bno = board.bno limit 1 ) as ano, "; 
		sql += "(select fname from attach where bno = board.bno limit 1 ) as fname, "; 
		sql += "(select pname from attach where bno = board.bno limit 1 ) as pname "; 
		sql += "from board ";
		//sql += "where ";
		
		String where = "";
		for(String key : keyword)
		{
			if(key.length() > 0)
			{
				if(type.equals("T")||type.equals("G")) // G - 전체 개시물
				{
					//제목에서 검색 
					if(!where.equals("")){ where += " and ";	}
					where += "btitle like '%" + key + "%' ";
				}else if(type.equals("N"))
				{
					//내용에서 검색 
					if(!where.equals("")){ where += " and ";	}					
					where += "bnote like '%" + key + "%' ";
				}else if(type.equals("U"))
				{
					//닉네임에서 검색 
					if(!where.equals("")){ where += " and ";	}				
					where += "unick like '%" + key + "%'  ";
				}else
				{
					//제목 + 내용에서 검색 
					if(!where.equals("")){ where += " and ";	}				
					where += "( btitle like '%" + key + "%' ";
					where += "or bnote like '%" + key + "%' ) ";
				}
			}
		}	
		//검색조건 6종키워드 
		if(svo!=null)
		{
			String sixkey = "";
			// 제목 내용에서 검색 구문이 있으면 and 추가
			if(where.length() > 0 )
			{
				sixkey += " and";
			}
			String s_key = "";
			if(svo.getSeason()!=null )
			{
				if(svo.getSeason().length > 0 && !svo.getSeason()[0].equals(""))
				{
					s_key += " season in (";
					// (키워드,키워드)
					for(String key : svo.getSeason())
					{
						s_key += "'" + key + "',";
					}
					// , 제거
					s_key = s_key.substring(0, (s_key.length()-1));
					// ) 추가
					s_key += ")";
					sixkey += s_key;
				}
			}
			String l_key = "";
			if(svo.getLocal()!=null)
			{
				if(svo.getLocal().length > 0 && !svo.getLocal()[0].equals(""))
				{
					if(s_key.length() > 0 )
					{
						l_key += " and ";
					}
					l_key += " local in (";
					for(String key : svo.getLocal())
					{
						l_key += "'" + key + "',";
					}
					l_key = l_key.substring(0, (l_key.length()-1));
					l_key += ")";
					sixkey += l_key;
				}
			}
			String h_key = "";
			if(svo.getHuman()!=null)
			{
				if(svo.getHuman().length > 0 && !svo.getHuman()[0].equals(""))
				{
					if(l_key.length() >0 || s_key.length() > 0)
					{
						h_key += " and ";
					}
					h_key += " human in (";
					for(String key : svo.getHuman())
					{
						h_key += "'" + key + "',";
					}
					h_key = h_key.substring(0, (h_key.length()-1));
					h_key += ")";
					sixkey += h_key;
				}
			}
			String m_key = "";
			if(svo.getMove()!=null)
			{
				if(svo.getMove().length > 0 && !svo.getMove()[0].equals(""))
				{
					if(h_key.length() >0 || s_key.length() > 0 || l_key.length() >0)
					{
						m_key += " and ";
					}
					m_key += " move in (";
					for(String key : svo.getMove())
					{
						m_key += "'" + key + "',";
					}
					m_key = m_key.substring(0, (m_key.length()-1));
					m_key += ")";
					sixkey += m_key;
				}
			}
			String sc_key = "";
			if(svo.getSchedule()!=null)
			{
				if(svo.getSchedule().length > 0 && !svo.getSchedule()[0].equals(""))
				{
					if(m_key.length() >0 || s_key.length() > 0 || l_key.length() >0 || h_key.length() >0)
					{
						sc_key += " and ";
					}
					sc_key += " schedule in (";
					for(String key : svo.getSchedule())
					{
						sc_key += "'" + key + "',";
					}
					sc_key = sc_key.substring(0, (sc_key.length()-1));
					sc_key += ")";
					sixkey += sc_key;
				}
			}
			String u_key = "";
			if(svo.getUinout()!=null)
			{
				if(svo.getUinout().length > 0 && !svo.getUinout()[0].equals(""))
				{
					if(l_key.length() >0 || m_key.length() >0 || s_key.length() > 0 || l_key.length() >0 || h_key.length() >0)
					{
						u_key += " and ";
					}
					u_key += " uinout in (";
					for(String key : svo.getUinout())
					{
						u_key += "'" + key + "',";
					}
					u_key = u_key.substring(0, (u_key.length()-1));
					u_key += ")";
					sixkey += u_key;
				}
			}
			
			if(sixkey.length() > 4)
			{
				where += sixkey;
			}
		}
		
		if(!where.equals(""))
		{
			sql += " where " + where;
		}
		
		
		//최신 게시물로 정렬
		sql += " order by bno desc ";
		
		//페이지당 5개씩 가져오도록 limit를 처리한다
		int startno = perpage * (pageno - 1);
		sql += "limit " + startno + ", " + perpage + " ";
		
		System.out.println(sql);
		
		this.OpenQuery(sql);		
		while(this.GetNext())
		{
			boardVO bvo = new boardVO();
			
			bvo.setBno(this.GetValue("bno"));
			bvo.setBtitle(this.GetValue("btitle"));
			bvo.setBnote(this.GetValue("bnote"));
			bvo.setBwdate(this.GetValue("bwdate"));
			bvo.setBhit(this.GetValue("bhit"));
			bvo.setBlike(this.GetValue("blike"));
			bvo.setUnick(this.GetValue("unick"));
			bvo.setRno(this.GetValue("rno"));
			bvo.setAno(this.GetValue("ano"));
			bvo.setFname(this.GetValue("fname"));
			bvo.setPname(this.GetValue("pname"));
			bvo.setSeason(this.GetValue("season"));
			bvo.setLocal(this.GetValue("local"));
			bvo.setHuman(this.GetValue("human"));
			bvo.setMove(this.GetValue("move"));
			bvo.setSchedule(this.GetValue("schedule"));
			bvo.setUinout(this.GetValue("uinout"));
			
			list.add(bvo);
		}
		
		this.DBClose();
		return list;
	}
	
	//정렬
	public boardVO array(String option)
	{
		if( this.DBOpen() == false )
		{
			return null;
		}
		
		String sql = "";
		//해당 게시물 번호에 대한 정보를 조회한다.
		sql  = "select uno,btitle,season,local,human,move,schedule,uinout,bnote,bwdate,bhit,blike,bhate, ";
		sql += "(select unick from user where uno = board.uno) as unick ";
		sql += "from board ";
		sql += " order by " + option +  "desc";
		
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
	
		boardVO vo = new boardVO();
		vo.setBno(this.GetValue("bno"));
		vo.setUno(this.GetValue("uno"));
		vo.setBtitle(this.GetValue("btitle"));
		vo.setSeason(this.GetValue("season"));
		vo.setLocal(this.GetValue("local"));
		vo.setHuman(this.GetValue("human"));
		vo.setMove(this.GetValue("move"));
		vo.setSchedule(this.GetValue("schedule"));
		vo.setUinout(this.GetValue("uinout"));
		vo.setBnote(this.GetValue("bnote"));
		vo.setBwdate(this.GetValue("bwdate"));
		vo.setBhit(this.GetValue("bhit"));
		vo.setBlike(this.GetValue("blike"));
		vo.setBhate(this.GetValue("bhate"));
		vo.setUnick(this.GetValue("unick"));		
		
		return vo;
	}
	
	//추천수 변경
	public boolean like(boardVO vo)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		String sql = "";
		sql  = "update board ";
		sql += "set ";
		sql += "blike = '" + vo.getBlike() + "', ";
		sql += "bhate = '" + vo.getBhate() + "' ";
		sql += "where bno = '" + vo.getBno() + "' ";
		this.RunSQL(sql);
		
		
		this.DBClose();
		return true;		
	}
	
	//북마크 한거 총개수
	public int bookTotal(String uno)
	{
		int total = 0;
		if( this.DBOpen() == false )
		{
			return total;
		}
		
		//게시물의 갯수를 얻는다.
		String sql = "";
		sql  = "select count(*) as count "; 
		sql += "from bookmark ";
		sql += "where uno = " + uno;
		
		System.out.println(sql);
		
		this.OpenQuery(sql);
		this.GetNext();
		total = this.GetInt("count");
		this.CloseQuery();
		
		this.DBClose();
		return total;
	}
	//북마크 한거 회원정보쪽에 불러오는 메소드
	public ArrayList<boardVO> bookList(String uno, int perpage, int pageno)
	{
		ArrayList<boardVO> list = new ArrayList<boardVO>();
		if( this.DBOpen() == false )
		{
			return list;
		}	
		
		String sql = "";
		sql  = "select bno,btitle,date(bwdate) as bwdate,bhit, blike,season,local,human,move,schedule,uinout, ";
		sql += "(select unick from user where uno = board.uno) as unick, ";
		sql += "(select count(rno) from reply where bno = board.bno) as rno "; 
		sql += "from board ";
		sql += "where bno in (select bno from bookmark where uno = " + uno + " ) ";
		sql += "order by bno desc "; 
		
		
		//페이지당 perpage개씩 가져오도록 limit를 처리한다
		int startno = perpage * (pageno - 1);
		sql += "limit " + startno + ", " + perpage + " ";
		
		System.out.println(sql);
		
		this.OpenQuery(sql);		
		while(this.GetNext())
		{
			boardVO bvo = new boardVO();
			
			bvo.setBno(this.GetValue("bno"));
			bvo.setBtitle(this.GetValue("btitle"));
			bvo.setBwdate(this.GetValue("bwdate"));
			bvo.setBhit(this.GetValue("bhit"));
			bvo.setBlike(this.GetValue("blike"));
			bvo.setUnick(this.GetValue("unick"));
			bvo.setRno(this.GetValue("rno"));
			bvo.setSeason(this.GetValue("season"));
			bvo.setLocal(this.GetValue("local"));
			bvo.setHuman(this.GetValue("human"));
			bvo.setMove(this.GetValue("move"));
			bvo.setSchedule(this.GetValue("schedule"));
			bvo.setUinout(this.GetValue("uinout"));
			
			list.add(bvo);
		}
		
		this.DBClose();
		return list;
	}
	
	//북마크하기
	public boolean bookInsert(String uno, String bno) 
	{
		if( this.DBOpen() == false )
		{
			return false;
		}	
		
		// 북마크 게시물 중복 검사 
		// 리턴값 : true - 중복 게시물, false - 중복이 안된 게시물
		String sql = "";
		sql  = "select uno,bno ";
		sql += "from bookmark ";
		sql += "where uno = " + uno + " and bno = " + bno;
		this.OpenQuery(sql);
		if(this.GetNext() == true)
		{	//북마크에 이미 있음
			this.DBClose();
			return false;
		}
		
		sql  = "insert into bookmark ";
		sql += "(uno, bno) ";
		sql += "values ";
		sql += "('" + uno + "' , '" + bno + "') ";
		System.out.println(sql);
		this.RunSQL(sql);
		
		this.DBClose();		
		return true;
	}
	
	//북마크 삭제
	public boolean bookDelete(String uno, String bno) 
	{
		if( this.DBOpen() == false )
		{
			return false;
		}	
		String sql = "";
		sql  =  "delete from bookmark where uno = " + uno + " and bno = " + bno;
		System.out.println(sql);
		this.RunSQL(sql);
		this.DBClose();		
		return true;
	}
	
	
	//내가 작성한글 총개수
	public int writeTotal(String uno)
	{
		int total = 0;
		if( this.DBOpen() == false )
		{
			return total;
		}
		
		//게시물의 갯수를 얻는다.
		String sql = "";
		sql  = "select count(*) as count "; 
		sql += "from board ";
		sql += "where uno = " + uno;
		
		System.out.println(sql);
		
		this.OpenQuery(sql);
		this.GetNext();
		total = this.GetInt("count");
		this.CloseQuery();
		
		this.DBClose();
		return total;
	}
	
	//내가 작성한글 회원정보쪽에 불러오는 메소드
	public ArrayList<boardVO> writeList(String uno, int perpage, int pageno)
	{
		ArrayList<boardVO> list = new ArrayList<boardVO>();
		if( this.DBOpen() == false )
		{
			return list;
		}	
		
		String sql = "";
		sql  = "select bno,btitle,date(bwdate) as bwdate,bhit, blike,season,local,human,move,schedule,uinout, ";
		sql += "(select unick from user where uno = board.uno) as unick, ";
		sql += "(select count(rno) from reply where bno = board.bno) as rno "; 
		sql += "from board ";
		sql += "where uno = '" + uno + "' ";
		sql += "order by bno desc "; 
		
		
		//페이지당 perpage개씩 가져오도록 limit를 처리한다
		int startno = perpage * (pageno - 1);
		sql += "limit " + startno + ", " + perpage + " ";
		
		System.out.println(sql);
		
		this.OpenQuery(sql);		
		while(this.GetNext())
		{
			boardVO bvo = new boardVO();
			
			bvo.setBno(this.GetValue("bno"));
			bvo.setBtitle(this.GetValue("btitle"));
			bvo.setBwdate(this.GetValue("bwdate"));
			bvo.setBhit(this.GetValue("bhit"));
			bvo.setBlike(this.GetValue("blike"));
			bvo.setUnick(this.GetValue("unick"));
			bvo.setRno(this.GetValue("rno"));
			bvo.setSeason(this.GetValue("season"));
			bvo.setLocal(this.GetValue("local"));
			bvo.setHuman(this.GetValue("human"));
			bvo.setMove(this.GetValue("move"));
			bvo.setSchedule(this.GetValue("schedule"));
			bvo.setUinout(this.GetValue("uinout"));
			
			list.add(bvo);
		}
		
		this.DBClose();
		return list;
	}
	
}

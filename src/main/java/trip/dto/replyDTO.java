package trip.dto;

import java.util.*;

import trip.dao.*;
import trip.vo.*;

//댓글 정보 관리 클래스
public class replyDTO extends DBManager
{
	//댓글을 등록한다
	//리턴값 : true - 등록성공, false - 등록실패	
	public boolean Insert(replyVO vo)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		// 댓글을 저장한다
		String sql = "";
		sql  = "insert into reply ";
		sql += "(uno,bno,rnote,uicon,btitle) ";
		sql += "values ";
		sql += " ( ";
		sql += "'" + vo.getUno()  + "', ";
		sql += "'" + vo.getBno()   + "', ";
		sql += "'" + this._R(vo.getRnote()).replace("<","&lt;").replace(">","&gt;").replace("\n","\n<br>")   + "', ";
		sql += "'" + vo.getUicon() + "', ";
		sql += "'" + vo.getBtitle() + "' ";
		sql += " ) ";
		this.RunSQL(sql);
		
		//등록된 댓글 번호를 얻는다.
		sql = "select last_insert_id() as rno ";
		this.OpenQuery(sql);
		this.GetNext();
		String rno = this.GetValue("rno");
		vo.setRno(rno);
		
		this.DBClose();
		return true;
	}
	
	//댓글 정보를 변경한다.
	//리턴값 : true - 변경성공, false - 변경실패	
	public boolean Update(replyVO vo)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		//댓글 변경한다.
		String sql = "";
		sql  = "update reply ";
		sql += "set ";
		sql += "rnote = '" + this._R(vo.getRnote()).replace("<","&lt;").replace(">","&gt;").replace("\n","\n<br>") + "'  ";
		sql += "where rno = '" + vo.getRno() + "' ";
		this.RunSQL(sql);
		
		
		this.DBClose();
		return true;		
	}
	
	//댓글을 삭제한다
	//리턴값 : true - 등록성공, false - 등록실패	
	public boolean Delete(String rno)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		String sql = "";
		sql = "delete from reply where rno = " + rno;
		this.RunSQL(sql);
		this.DBClose();
		return true;
	}
	
	//댓글 목록을 조회한다
	public ArrayList<replyVO> GetList(String bno)
	{
		ArrayList<replyVO> list = new ArrayList<replyVO>();
		if( this.DBOpen() == false )
		{
			return list;
		}
		String sql = "";
		sql  = "select rno, uno, rnote, uicon, date(rwdate) as rwdate, ";
		sql += "(select unick from user where uno = reply.uno) as unick ";
		sql += "from reply ";
		sql += "where bno = '" + bno + "' ";
		sql += "order by rno desc ";
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			replyVO vo = new replyVO();
			
			vo.setRno(this.GetValue("rno"));
			vo.setUno(this.GetValue("uno"));
			vo.setUicon(this.GetValue("uicon"));
			vo.setRnote(this.GetValue("rnote"));
			vo.setRwdate(this.GetValue("rwdate"));
			vo.setUnick(this.GetValue("unick"));
			
			list.add(vo);
		}
		this.DBClose();
		return list;
	}
	
	
	//댓글 단 게시물 총개수
	public int replyTotal(String uno)
	{
		int total = 0;
		if( this.DBOpen() == false )
		{
			return total;
		}
		
		//게시물의 갯수를 얻는다.
		String sql = "";
		sql  = "select count(bno) as count "; 
		sql += "from reply ";
		sql += "where uno = " + uno;
		
		System.out.println(sql);
		
		this.OpenQuery(sql);
		this.GetNext();
		total = this.GetInt("count");
		this.CloseQuery();
		
		this.DBClose();
		return total;
	}
	
	
	//댓글 목록을 조회한다
	public ArrayList<replyVO> myList(String uno, int perpage, int pageno)
	{
		ArrayList<replyVO> list = new ArrayList<replyVO>();
		if( this.DBOpen() == false )
		{
			return list;
		}
		String sql = "";
		sql  = "select rno, bno, uno, rnote, uicon, date(rwdate) as rwdate, btitle, ";
		sql += "(select unick from user where uno = reply.uno) as unick ";
		sql += "from reply ";
		sql += "where uno = '" + uno + "' ";
		sql += "order by rno desc ";
		
		//페이지당 5개씩 가져오도록 limit를 처리한다
		int startno = perpage * (pageno - 1);
		sql += "limit " + startno + ", " + perpage + " ";
		
		System.out.println(sql);
		
		
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			replyVO vo = new replyVO();
			
			vo.setRno(this.GetValue("rno"));
			vo.setBno(this.GetValue("bno"));
			vo.setUno(uno);
			vo.setUicon(this.GetValue("uicon"));
			vo.setRnote(this.GetValue("rnote"));
			vo.setRwdate(this.GetValue("rwdate"));
			vo.setUnick(this.GetValue("unick"));
			vo.setBtitle(this.GetValue("btitle"));
			
			list.add(vo);
		}
		this.DBClose();
		return list;
	}
	
}

package trip.dto;
import java.util.*;
import trip.dao.*;
import trip.vo.*;

//채팅 정보 관리 클래스
public class chatDTO extends DBManager
{
	//채팅을 등록한다
	//리턴값 : true - 등록성공, false - 등록실패	
	public boolean Insert(chatVO vo)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		// 채팅을 저장한다
		String sql = "";
		sql  = "insert into chat ";
		sql += "(uno,cnote,unick) ";
		sql += "values ";
		sql += " ( ";
		sql += "'" + vo.getUno()  + "', ";
		sql += "'" + this._R(vo.getCnote()) + "', ";
		sql += "'" + vo.getUnick()   + "' ";
		sql += " ) ";
		this.RunSQL(sql);
		
		//등록된 채팅 번호를 얻는다.
		sql = "select last_insert_id() as cno ";
		this.OpenQuery(sql);
		this.GetNext();
		String cno = this.GetValue("cno");
		vo.setCno(cno);
		
		this.DBClose();
		return true;
	}
	
	
	//채팅 목록을 조회한다(일시는 저장일시와 현재일시 분차이로 가져온다)
	public ArrayList<chatVO> GetList_All()
	{
		ArrayList<chatVO> list = new ArrayList<chatVO>();
		if( this.DBOpen() == false )
		{
			return list;
		}
		String sql = "";
		sql  = "select *, timestampdiff(minute,date_format(cwdate,'%Y-%m-%d %H:%i'),date_format(now(),'%Y-%m-%d %H:%i')) as time_diff FROM chat";
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			chatVO vo = new chatVO();
			
			vo.setCno(this.GetValue("cno"));
			vo.setUno(this.GetValue("uno"));
			vo.setCnote(this.GetValue("cnote"));
			vo.setCwdate(this.GetValue("time_diff"));
			vo.setUnick(this.GetValue("unick"));
			
			list.add(vo);
		}
		this.DBClose();
		return list;
	}
	
	
	//채팅 목록을 조회한다
	public ArrayList<chatVO> GetList(String cno)
	{
		ArrayList<chatVO> list = new ArrayList<chatVO>();
		if( this.DBOpen() == false )
		{
			return list;
		}
		String sql = "";
		sql  = "select uno,cno,cnote, date(cwdate) as cwdate, ";
		sql += "(select unick from user where uno = chat.uno) as unick ";
		sql += "from chat ";
		sql += "where cno = '" + cno + "' ";
		sql += "order by cno desc ";
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			chatVO vo = new chatVO();
			
			vo.setCno(cno);
			vo.setUno(this.GetValue("uno"));
			vo.setCnote(this.GetValue("cnote"));
			vo.setCwdate(this.GetValue("cwdate"));
			vo.setUnick(this.GetValue("unick"));
			
			list.add(vo);
		}
		this.DBClose();
		return list;
	}
	
}

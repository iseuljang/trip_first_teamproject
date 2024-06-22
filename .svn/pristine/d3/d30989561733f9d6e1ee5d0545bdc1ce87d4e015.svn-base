package trip.dto;

import java.util.ArrayList;

import trip.dao.DBManager;
import trip.vo.*;

public class attachDTO extends DBManager
{
	// 첨부파일을 여러개 등록한다 -- 일반게시물용
	public boolean Insert(ArrayList<attachVO> list)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		
		String sql = "";
		
		sql  = " insert into attach ";
		sql += "(bno,pname,fname) ";
		sql +=  "values ";
		for(attachVO vo : list)
		{
			if(vo != null && !vo.getFname().equals(""))
			{
				sql += " ('" + vo.getBno() + "', ";
				sql += " '" + vo.getPname() + "', ";
				sql += " '" + vo.getFname() + "' ";
				sql += " ), ";
			}	
		}
		sql = sql.substring(0, (sql.length()-2));
		if(!this.RunSQL(sql))
		{
			this.DBClose();
			return false;
		}
		this.DBClose();
		return true;
	}
	
	//첨부파일 정보를 여러개 변경한다. -- 일반게시글용 
	public boolean Update(ArrayList<attachVO> list)
	{
		if( this.DBOpen() == false )
		{
			return false;
		}
		String sql = "";
		
		for(attachVO vo : list)
		{
			if(vo.getFname() != null && !vo.getFname().equals(""))
			{
				sql  = "update attach set ";
				sql += "pname = '" + vo.getPname() + "', ";
				sql += "fname = '" + vo.getFname() + "' ";
				sql += "where bno = '" + vo.getBno() + "' and ano = '" + vo.getAno() + "'";
				this.RunSQL(sql);	
			}	
		}
		if(!this.RunSQL(sql))
		{
			this.DBClose();
			return false;
		}
		this.DBClose();
		return true;		
	}
	
	//첨부파일 정보를 1개만 조회한다. -- 일반게시글용
	public attachVO Read_1(String ano)
	{
		attachVO avo = new attachVO();
		if( this.DBOpen() == false )
		{
			return avo;
		}
		
		String sql = "";
		sql  = "select pname,fname "; 
		sql += "from attach ";
		sql += "where ano = " + ano;
		this.OpenQuery(sql);
		
		if( this.GetNext() == true)
		{
			avo.setPname(this.GetValue("pname"));
			avo.setFname(this.GetValue("fname"));
		}
		return avo;
	}
	
	//첨부파일 정보를 전체조회한다. -- 일반게시글용
	public ArrayList<attachVO> Read(String bno)
	{
		ArrayList<attachVO> list = new ArrayList<attachVO>();
		if( this.DBOpen() == false )
		{
			return list;
		}
		
		String sql = "";
		sql  = "select pname,fname,ano,bno "; 
		sql += "from attach ";
		sql += "where bno = " + bno;
		this.OpenQuery(sql);
		
		while( this.GetNext() == true)
		{
			attachVO vo = new attachVO();
			vo.setPname(this.GetValue("pname"));
			vo.setFname(this.GetValue("fname"));
			vo.setAno(this.GetValue("ano"));
			list.add(vo);
		}
		return list;
	}
	
}

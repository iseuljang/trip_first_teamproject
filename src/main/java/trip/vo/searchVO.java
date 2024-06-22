package trip.vo;

public class searchVO 
{
	// field
	private String[] season;	// 계절
	private String[] local;	    // 지역 
	private String[] human;	    // 동행 
	private String[] move;	    // 이동 
	private String[] schedule;  // 일정 
	private String[] uinout;	// 장소 
	
	public String[] getSeason()   { return season;   }
	public String[] getLocal()    { return local;	 }
	public String[] getHuman()    { return human;	 }
	public String[] getMove()     { return move;	 }
	public String[] getSchedule() { return schedule; }
	public String[] getUinout()   { return uinout;   }
	
	public void setSeason(String[] season)     { this.season = season;	   }
	public void setLocal(String[] local)       { this.local = local;	   }
	public void setHuman(String[] human)       { this.human = human;	   }
	public void setMove(String[] move)         { this.move = move;	       }
	public void setSchedule(String[] schedule) { this.schedule = schedule; }
	public void setUinout(String[] uinout)     { this.uinout = uinout;	   }
}

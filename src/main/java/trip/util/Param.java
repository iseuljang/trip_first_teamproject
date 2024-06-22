package trip.util;

public class Param 
{
	//웹 페이지 매개변수 처리용
	//param = ["1","2","3"]
	//name  = "season"
	//return "season=1&season=2&season=3"
	public static String getParam(String[] param,String name)
	{
		String list = "";
		if(param != null)
		{
			for(String v : param)
			{
				if(!list.equals(""))
				{
					list += "&";		
				}
				list += name + "=" + v;
			}
		}else
		{
			list = name + "=";
		}
		return list;
	}
	public static String removeLastChar(String str) {
        if (str == null || str.length() == 0) {
            return str;
        }
        return str.substring(0, str.length() - 1);
    }
	//목록에서 키워드 표시용
	public static String setItem(String[] param,String color)
	{
		String list = "";
		if( param != null)
		{
			for(String item : param)
			{
				if( !item.equals("") )
				{
					list += "<i style='color: " + color + ";'>" + item + "</i>,";					
				}
			}
		}		
		return removeLastChar(list);
	}
}

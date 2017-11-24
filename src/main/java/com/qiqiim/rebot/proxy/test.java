package com.qiqiim.rebot.proxy;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class test {
public static void main(String[] args) {
	
		try{
			
			Document doc = Jsoup.connect("http://i.itpk.cn/api.php").timeout(62000).data("api_key","824003f52d337680d8f5afcea7270719").data("api_secret","ntj8s9pn8zkn").data("limit","5").data("question","你是猪吗").post();
			
			String msgStr = doc.select("body").html();
			System.out.println(msgStr);
		}catch(Exception e){
			
		}
}
}

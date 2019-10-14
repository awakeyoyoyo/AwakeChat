package com.awakeyo.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class UserManager {
     static Map<String,MyWebSocket> servers=new ConcurrentHashMap<String, MyWebSocket>();
    public static void broadCast(String msg){
        for (MyWebSocket myWebSocket : servers.values()) {
            try {
                myWebSocket.sendMessage(msg);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    public static int getTotal(){
        return servers.size();
    }
    public static void add(String username,MyWebSocket server){

        servers.put(username,server);
        System.out.println("有新连接加入！ 当前总连接数是："+ servers.size());
    }
    public static void remove(String username){

        servers.remove(username);
        System.out.println("有连接退出！ 当前总连接数是："+ servers.size());
    }
    public static  ArrayList<String> names(){
        ArrayList<String> num=new ArrayList<String>();
        Object[] temp=servers.keySet().toArray() ;
        for (int i = 0; i < temp.length; i++) {
            String e = (String) temp[i];
            num.add(e);
        }
        return num;
    }
}

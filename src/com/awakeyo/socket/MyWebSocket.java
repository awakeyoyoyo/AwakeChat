package com.awakeyo.socket;


import com.awakeyo.enity.Message;
import com.fasterxml.jackson.annotation.JacksonInject;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.json.Json;
import javax.json.JsonObject;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.text.SimpleDateFormat;


/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 *                 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 *                 用注解@ServerEndpoint("/ws/bitcoinServer")把它标记为一个WebSocket Server
 * ws/bitcoinServer 表示有通过这个地址访问该服务
 */
@ServerEndpoint("/websocket/{username}")
public class MyWebSocket {
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    //时间
    private static SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private String username;
//    OnOpen 表示有浏览器链接过来的时候被调用
//    OnClose 表示浏览器发出关闭请求的时候被调用
//    OnMessage 表示浏览器发消息的时候被调用
//    OnError 表示有错误发生，比如网络断开了等等
//    sendMessage 用于向浏览器回发消息
    @OnOpen
    public void onOpen(@PathParam("username")String username, Session session){
        this.session = session;
        this.username=username;
        UserManager.add(username,this);
        UserManager.broadCast("numberadd|"+UserManager.getTotal()+"|"+username);
        System.out.println(username+"laile");
    }
    @OnClose
    public void onClose(){
        UserManager.remove(this.username);
        UserManager.broadCast("numberremove|"+UserManager.getTotal()+"|"+username);
    }

    @OnMessage
    public void onMessage(String json, Session session) throws IOException {
        System.out.println("来自客户端的消息:" + json);
        //json jackson数据
        ObjectMapper objectMapper = new ObjectMapper();

        Message message=objectMapper.readValue(json,Message.class);

        //解析出用户名 以及msg

        //然后群发咯
        UserManager.broadCast("msg|"+sim.format(message.getSendTime())+" "+message.getUsername()+" : "+message.getMsg());
        //time username ：msg
    }

    @OnError
    public void onError(Session session, Throwable error){
        System.out.println("发生错误");
        error.printStackTrace();
    }
    public void sendMessage(String message) throws IOException{
        this.session.getBasicRemote().sendText(message);
    }

}

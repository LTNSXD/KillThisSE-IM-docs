# 消息模块

!!! warning "Websocket"

    在即时通讯系统中，为了实时收到其他用户发送的信息，在消息处理方面使用了Websocket而不是HTTP，使得服务端能主动向客户端发送信息。

!!! note

    利用Websocket通信，主要包括了连接、发送消息、接收消息三个部分。**这里的发送消息与接收消息主体指的是后端服务器，例如接收指的是后端接收前端发来的websocket信息，发送指的是后端向前端发送返回体。**以下做出逐一介绍。

!!! note "Websocket url"

    消费者能处理的相对url路径为`/ws/chat/<conversation_id>/<user_id>/`，两个参数分别代表了当前的会话id与当前用户的id

!!! note "通道层"

    不同的会话拥有不同的通道层，以**会话id**作为通道层的唯一标识。

## 连接

连接到Websocket不需要任何的请求体参数。连接成功后，消费者将会把**当前请求加到 `conversation_id`的通道层中**，同时向这个通道层发送一条消息。

## 接收

!!! Note "参数列表"

    以表格的形式，列出向后端Websocket发送消息所需的参数。其中包括参数类型，是否必须与参数说明。

| 参数名            | 参数类型      | 是否必须     | 参数说明                                       |
| ----------------- | ------------- | ------------ | ---------------------------------------------- |
| **token**   | **str** | **是** | **用户的token**                          |
| **message** | **str** | **是** | **消息内容**                             |
| is_image          | bool          | 否           | 图片标志                                       |
| image_url         | str           | 否           | 图片url                                        |
| is_video          | bool          | 否           | 视频标志                                       |
| video_url         | str           | 否           | 视频url                                        |
| is_file           | bool          | 否           | 文件标志                                       |
| file_url          | str           | 否           | 文件url                                        |
| deleted_msg_id    | int           | 否           | （如果这是一条删除消息的请求）用户删除消息的id |
| withdraw_msg_id   | int           | 否           | （如果这是一条撤回消息的请求）用户撤回消息的id |
| quote_with        | int           | 否           | 该消息引用的消息                               |
| mentioned_members | list          | 否           | 该消息提及的成员（群聊有效）                   |
| forward           | bool          | 否           | 转发消息的标志                                 |
| *heartbeat*     | *bool*      | *否*       | *心跳标志*                                   |

!!! note "心跳"

    如果heartbeat字段出现在了请求体中，那么后端将会把这次消息发送认定为一次“测试连接/重新连接”请求。这是为了保持连接的稳定性而设计的。

??? example "示例"
    === "仅文本消息"
        ```json         
        {                          
            "token": token,                          
            "message": "Hello, World"                  
        }                  
        ```

    === "多媒体消息"
        ```json                  
        {                          
            "token": token,                          
            "message": whatever,                         
            "is_image": true,                          
            "image_url": "https://killthisse-avatar.oss-cn-beijing.aliyuncs.com/%E9%BB%98%E8%AE%A41.jpg"                  
        }                  
        ```

    === "转发消息"
        ```json                  
        {                          
            "token": token,                          
            "message": [1, 4, 5, 8, 9, 10],                          "forward": true                  
        }                 
        ```

## 发送

!!! note "后端向前端发送消息的时机"

    每个websocket请求在连接，或者有人向其所在的通道层(conversation_id)发送了消息，那么后端就应该在此刻向这个请求所在的通道层发送消息。

!!! note "返回体"

    返回体的格式为

    ```json     
    {         
        "messages": 消息列表,         
        "last_msg": 该会话的最后一条消息,         
        "len_of_msgs": 会话含有消息数目的总数,         
        "unread_msgs": 未读消息计数,         
        "mentioned": 用户在该会话是否被提及     
    }     
    ```

以下以表格的形式展示消息列表中，每条消息所包含的信息

| 参数名            | 参数类型 | 说明                           |
| ----------------- | -------- | ------------------------------ |
| conversation_id   | int      | 自身所在的会话id               |
| msg_id            | int      | 消息id                         |
| msg_body          | str      | 消息主体                       |
| sender_id         | int      | 发送者id                       |
| sender_name       | str      | 发送者昵称                     |
| sender_avatar     | str      | 发送者头像                     |
| create_time       | datetime | 创建时间                       |
| is_image          | bool     | 图像标志                       |
| image_url         | str      | 图像url                        |
| is_file           | bool     | 文件标志                       |
| file_url          | str      | 文件url                        |
| is_audio          | bool     | 语音标志                       |
| is_video          | bool     | 视频标志                       |
| quote_with        | int      | 引用的消息对象                 |
| mentioned_members | list     | 提及的成员列表                 |
| is_transmit       | bool     | 转发消息标志                   |
| transmit_with     | list     | 转发的消息列表                 |
| is_read           | bool     | （私聊用）对方是否已读这条消息 |

??? example "示例"

    === "返回体示例"
    ```json     
    {         
        "messages": [             
            {                 
                "conversation_id": "14",                 
                "msg_id": 68,                 
                "msg_body": "I Love THU-CST",                
                "sender_id": 13,                 
                "sender_name": "Asplanic",                 
                "sender_avatar": "https://killthisse-avatar.oss-cn-beijing.aliyuncs.com/1684983737349%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20230116192705.jpg",                 
                "create_time": "05-25 11:07",                 
                "is_image": null,                 
                "image_url": null,                 
                "is_file": null,                 
                "file_url": null,                 
                "is_audio": null,                 
                "is_video": null,                 
                "quote_with": -1,                 
                "mentioned_members": [],                 
                "is_transmit": false,                 
                "transmit_with": [],                 
                "is_read": false             
            }         
        ],         
        "members": [             
            {                 
                "user_id": 12,                 
                "user_name": "whynb",                 
                "user_avatar": "https://killthisse-avatar.oss-cn-beijing.aliyuncs.com/%E9%BB%98%E8%AE%A47.png"             
            }
        ],        
        "len_of_msgs": 2,         
        "unread_msgs": 2,         
        "mentioned": false
    }     
    ```

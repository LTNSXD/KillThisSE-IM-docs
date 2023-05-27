# 会话相关

## 获取所有非置顶私聊

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_private_conversations/</span>
</div>

##### 功能说明

获取所有非置顶的私聊会话

##### 参数

除了token以外不需要其他参数。

##### 成功请求返回体

```json
{
  "conversations": [
    {
      "id": 会话id,
      "friend_id": 对方id,
      "friend_name": 对方的用户名,
      "friend_avatar": 对方的头像,
      "is_Private": True,
      "silent": 免打扰标志,
      "sticked": False,
      "disabled": 失效标志,
      "validation": 二次验证标志
    },
    ...
  ]
}
```

##### 失败响应码

| code | 说明       |
| ---- | ---------- |
| 1    | 用户未登录 |

## 获取所有非置顶群聊

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_group_conversations/</span>
</div>

##### 功能说明

获取所有非置顶的群聊会话

##### 参数

除了Token以外不需要其他参数。

##### 成功请求返回体

```json
{
  "conversations": [
    {
      "id": 会话id,
      "name": 群聊名称,
      "avatar": 群聊头像,
      "is_Private": False,
      "silent": 免打扰标志,
      "sticked": False,
      "disabled": 失效标志,
      "validation": 二次验证标志
    },
    ...
  ]
}
```

##### 失败响应码

| code | 说明       |
| ---- | ---------- |
| 1    | 用户未登录 |

## 获取所有置顶私聊

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_sticky_private_conversations/</span>
</div>

##### 功能说明

获取所有置顶的私聊会话

##### 参数

除了Token以外不需要其他参数。

##### 成功请求返回体

```json
{
  "conversations": [
    {
      "id": 会话id,
      "friend_id": 对方id,
      "friend_name": 对方的用户名,
      "friend_avatar": 对方的头像,
      "is_Private": True,
      "silent": 免打扰标志,
      "sticked": True,
      "disabled": 失效标志,
      "validation": 二次验证标志
    },
    ...
  ]
}
```

##### 失败响应码

| code | 说明       |
| ---- | ---------- |
| 1    | 用户未登录 |

## 获取所有置顶群聊

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_sticked_group_conversations/</span>
</div>

##### 功能说明

获取所有置顶的群聊会话

##### 参数

除了token以外不需要其他参数。

##### 成功请求返回体

```json
{
  "conversations": [
    {
      "id": 会话id,
      "name": 群聊名称,
      "avatar": 群聊头像,
      "is_Private": False,
      "silent": 免打扰标志,
      "sticked": True,
      "disabled": 失效标志,
      "validation": 二次验证标志
    },
    ...
  ]
}
```

##### 失败响应码

| code | 说明       |
| ---- | ---------- |
| 1    | 用户未登录 |

## 创建/获取私聊

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_or_create_private_conversation/</span>
</div>

##### 功能说明

创建/获取与某一用户的私聊

##### 参数

| 参数名 | 类型 | 说明     |
| ------ | ---- | -------- |
| friend | int  | 对方的id |

##### 成功请求返回体

```json
{
  "conversation_id": 会话id,
  "silent": 免打扰标记
}
```

##### 失败响应码

| code | 说明               |
| ---- | ------------------ |
| 1    | 用户未登录         |
| 2    | 目标用户不存在     |
| 3    | 用户与对方不是好友 |

## 创建群聊

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/create_group_conversation/</span>
</div>

##### 功能说明

创建新的群聊

##### 参数

| 参数名  | 类型 | 说明                               |
| ------- | ---- | ---------------------------------- |
| members | list | （除用户自身以外）群聊成员的id列表 |
| name    | str  | 群聊名称                           |

##### 成功请求返回体

```json
{
  "conversation_id": 会话id,
}
```

##### 失败响应码

| code | 说明                       |
| ---- | -------------------------- |
| 1    | 用户未登录                 |
| 2    | 某一目标用户不存在         |
| 3    | 用户与某一邀请成员不是好友 |

## 设置二次验证

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/set_validation/</span>
</div>

##### 功能说明

用户就某一会话设置/取消二次验证

##### 参数

| 参数名       | 类型 | 说明                  |
| ------------ | ---- | --------------------- |
| conversation | int  | 会话id                |
| valid        | str  | 只能为"True"或"False" |

##### 成功请求返回体

```json
{
  "Modified": True
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 会话不存在     |
| 3    | 用户不在会话中 |

## 二次验证

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/secondary_validate/</span>
</div>

##### 功能说明

用户进行二次验证

##### 参数

| 参数名   | 类型 | 说明       |
| -------- | ---- | ---------- |
| password | str  | 用户的密码 |

##### 成功请求返回体

```json
{
  "Valid": True
}
```

##### 失败响应码

| code | 说明       |
| ---- | ---------- |
| 1    | 用户未登录 |
| 2    | 密码不存在 |

## 设置聊天置顶

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/set_sticky_conversation/</span>
</div>

##### 功能说明

用户设置/取消某一指定聊天是否置顶

##### 参数

| 参数名      | 类型 | 说明                  |
| ----------- | ---- | --------------------- |
| conversaion | int  | 会话id                |
| sticky      | str  | 只能为"True"或"False" |

##### 成功请求返回体

```json
{
  "Revised": True
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标会话不存在 |
| 3    | 用户不在会话中 |

## 设置聊天免打扰

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/set_silent_conversation/</span>
</div>

##### 功能说明

用户设置/取消某一指定聊天免打扰

##### 参数

| 参数名       | 类型 | 说明                  |
| ------------ | ---- | --------------------- |
| conversation | int  | 会话id                |
| silent       | str  | 只能为"True"或"False" |

##### 成功请求返回体

```json
{
  "Modified": True
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 会话不存在     |
| 3    | 用户不在会话中 |

## 设置已读消息位置

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/set_read_message/</span>
</div>

##### 功能说明

指定某一位置，该位置以上的消息默认已读

##### 参数

| 参数名       | 类型 | 说明   |
| ------------ | ---- | ------ |
| conversation | int  | 会话id |
| msg_id       | int  | 消息id |

##### 成功请求返回体

```json
{
  "Set Read Messages": True
}
```

##### 失败响应码

| code | 说明                     |
| ---- | ------------------------ |
| 1    | 用户未登录               |
| 2    | 会话不存在               |
| 3    | 设置已读位置的消息不存在 |

## 获取所有聊天记录

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/query_all_records/</span>
</div>

##### 功能说明

用户获取某一会话的所有聊天记录

##### 参数

| 参数名       | 类型 | 说明   |
| ------------ | ---- | ------ |
| conversation | int  | 会话id |

##### 成功请求返回体

```json
{
  "messages": [
    {
      "conversation_id": 会话id,
      "msg_id": 消息id,
      "msg_body": 消息体,
      "sender_id": 发送者id,
      "sender_name": 发送者用户名,
      "sender_avatar": 发送者头像,
      "create_time": 创建时间,
      "is_image": 图像标志,
      "image_url": 图像url,
      "is_file": 文件标志,
      "file_url": 文件url,
      "is_audio": 音频标志,
      "is_video": 视频标志,
      "quote_with": 引用对象,
      "mentioned_members": 提及的成员,
      "is_transmit": 转发标志,
      "transmit_with": 转发包含的信息列表
    },
    ...
  ]
}
```

!!! note 

    消息具体信息可以参见API文档中的消息模块，或者是数据库中的Message表

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标会话不存在 |
| 3    | 用户不在会话中 |

## 根据发送者查询聊天记录

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/query_by_sender/</span>
</div>

##### 功能说明

用户根据发送者查询某一会话的聊天记录

##### 参数

| 参数名       | 类型 | 说明     |
| ------------ | ---- | -------- |
| conversation | int  | 会话id   |
| sender       | int  | 发送者id |

##### 成功请求返回体

```json
{
  "messages": [
    {
      "conversation_id": 会话id,
      "msg_id": 消息id,
      "msg_body": 消息体,
      "sender_id": 发送者id,
      "sender_name": 发送者用户名,
      "sender_avatar": 发送者头像,
      "create_time": 创建时间,
      "is_image": 图像标志,
      "image_url": 图像url,
      "is_file": 文件标志,
      "file_url": 文件url,
      "is_audio": 音频标志,
      "is_video": 视频标志,
      "quote_with": 引用对象,
      "mentioned_members": 提及的成员,
      "is_transmit": 转发标志,
      "transmit_with": 转发包含的信息列表
    },
    ...
  ]
}
```

!!! note

    消息具体信息可以参见API文档中的消息模块，或者是数据库中的Message表

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标会话不存在 |
| 3    | 用户不在会话中 |

## 根据内容查询聊天记录

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/query_by_content/</span>
</div>

##### 功能说明

用户查询某一会话中包含 `content`的所有消息

##### 参数

| 参数名       | 类型 | 说明       |
| ------------ | ---- | ---------- |
| conversation | int  | 会话id     |
| content      | str  | 查询的内容 |

##### 成功请求返回体

```json
{
  "messages": [
    {
      "conversation_id": 会话id,
      "msg_id": 消息id,
      "msg_body": 消息体,
      "sender_id": 发送者id,
      "sender_name": 发送者用户名,
      "sender_avatar": 发送者头像,
      "create_time": 创建时间,
      "is_image": 图像标志,
      "image_url": 图像url,
      "is_file": 文件标志,
      "file_url": 文件url,
      "is_audio": 音频标志,
      "is_video": 视频标志,
      "quote_with": 引用对象,
      "mentioned_members": 提及的成员,
      "is_transmit": 转发标志,
      "transmit_with": 转发包含的信息列表
    },
    ...
  ]
}
```

!!! note

    消息具体信息可以参见API文档中的消息模块，或者是数据库中的Message表

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标会话不存在 |
| 3    | 用户不在会话中 |

## 根据类型查询聊天记录

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/query_by_type/</span>
</div>

##### 功能说明

用户根据类型查询某一会话的聊天记录

##### 参数

| 参数名       | 类型 | 说明                                     |
| ------------ | ---- | ---------------------------------------- |
| conversation | int  | 会话id                                   |
| type         | str  | 可以为:"image", "file", "video", "audio" |

##### 成功请求返回体

```json
{
  "messages": [
    {
      "conversation_id": 会话id,
      "msg_id": 消息id,
      "msg_body": 消息体,
      "sender_id": 发送者id,
      "sender_name": 发送者用户名,
      "sender_avatar": 发送者头像,
      "create_time": 创建时间,
      "is_image": 图像标志,
      "image_url": 图像url,
      "is_file": 文件标志,
      "file_url": 文件url,
      "is_audio": 音频标志,
      "is_video": 视频标志,
      "quote_with": 引用对象,
      "mentioned_members": 提及的成员,
      "is_transmit": 转发标志,
      "transmit_with": 转发包含的信息列表
    },
    ...
  ]
}
```

!!! note

    消息具体信息可以参见API文档中的消息模块，或者是数据库中的Message表

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标会话不存在 |
| 3    | 用户不在会话中 |
| 4    | 未知的类型     |

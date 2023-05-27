# `msg`模型

## Conversation表

| 字段                | 类型       | 属性        | 说明             |
| ------------------- | ---------- | ----------- | ---------------- |
| conversation_id     | int        | primary_key | 会话的id，主键   |
| conversation_name   | str        |             | 会话名称         |
| conversation_avatar | str        |             | 会话头像         |
| create_time         | datetime   |             | 创建时间         |
| update_time         | datetime   |             | 更新时间         |
| is_Private          | bool       |             | 私聊标记         |
| members             | ManyToMany | 映射到User  | 会话成员         |
| owner               | int        |             | （群聊）群主     |
| administrators      | ManyToMany | 映射到User  | （群聊）管理员   |
| disabled            | bool       |             | 弃用标志         |
| announcement        | str        |             | （群聊）群公告   |
| sticky_members      | ManyToMany | 映射到User  | 置顶成员列表     |
| silent_members      | ManyToMany | 映射到User  | 免打扰成员列表   |
| mentioned_members   | ManyToMany | 映射到User  | 被提及的成员列表 |
| valid_members       | ManyToMany | 映射到User  | 二级验证成员列表 |

## Message表

| 字段              | 类型       | 属性        | 说明         |
| ----------------- | ---------- | ----------- | ------------ |
| msg_id            | int        | primary_key | 消息id，主键 |
| msg_body          | str        |             | 消息内容     |
| conversation_id   | int        |             | 所属的会话id |
| sender_id         | int        |             | 发送者id     |
| create_time       | datetime   |             | 创建时间     |
| is_withdraw       | bool       |             | 撤回标志     |
| is_image          | bool       |             | 图片标志     |
| image_url         | str        |             | 图片url      |
| is_video          | bool       |             | 视频标志     |
| video_url         | str        |             | 视频url      |
| is_file           | bool       |             | 文件标志     |
| is_audio          | bool       |             | 音频标志     |
| file_url          | str        |             | 文件url      |
| quote_with        | int        |             | 引用的消息   |
| is_transmit       | bool       |             | 转发标志     |
| read_members      | ManyToMany | 映射到User  | 已读成员     |
| delete_members    | ManyToMany | 映射到User  | 删除的成员   |
| mentioned_members | ManyToMany | 映射到User  | 提及成员     |

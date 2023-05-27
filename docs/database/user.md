# `user`模型

## User表

| 字段       | 类型 | 属性        | 说明                             |
| ---------- | ---- | ----------- | -------------------------------- |
| user_id    | int  | primary_key | 用户id，作为其独一无二的标识     |
| name       | str  | unique      | 用户昵称，用户之间用户名不可重复 |
| avatar     | str  |             | 用户头像链接                     |
| user_email | str  |             | 用户邮箱                         |
| disabled   | bool |             | 注销标志                         |

## Friendship表

| 字段           | 类型     | 属性 | 说明     |
| -------------- | -------- | ---- | -------- |
| user_id        | int      |      | 用户id   |
| friend_user_id | int      |      | 好友id   |
| update_time    | datetime |      | 更新时间 |

!!! note unique_together

    好友关系是双向的，如果a和b是好友，那么b和a也是好友。故数据在表中是成双出现的，并且user_id和friend_user_id是联合唯一的

## FriendshipRequest表

| 字段           | 类型     | 属性 | 说明     |
| -------------- | -------- | ---- | -------- |
| user_id        | int      |      | 用户id   |
| friend_user_id | int      |      | 好友id   |
| update_time    | datetime |      | 更新时间 |

## Group表

| 字段        | 类型     | 属性        | 说明     |
| ----------- | -------- | ----------- | -------- |
| group_id    | int      | primary_key | 分组id   |
| group_name  | str      |             | 分组名称 |
| admin_id    | int      |             | 所有者id |
| update_time | datetime |             | 更新时间 |

## GroupInvitation表

| 字段          | 类型     | 属性        | 说明       |
| ------------- | -------- | ----------- | ---------- |
| invitation_id | int      | primary_key | 邀请体id   |
| inviter_id    | int      |             | 邀请者id   |
| invitee_id    | int      |             | 被邀请者id |
| group_id      | int      |             | 群聊会话id |
| update_time   | datetime |             | 更新时间   |

!!! note "unique_together"

    invitee_id与group_id是联合唯一的
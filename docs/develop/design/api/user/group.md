# 群聊管理

## 管理员/群主邀请用户进入群聊

!!! note "需要登陆"

!!! warning "需要权限: 管理员及以上"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/admin_invite_member/</span>
</div>

##### 功能说明

管理员/群主邀请用户直接进入群聊

##### 参数

| 参数名  | 类型 | 说明             |
| ------- | ---- | ---------------- |
| group   | int  | 群聊id           |
| invitee | list | 被邀请者的id列表 |

##### 成功请求返回体

```json
{
  "Invited": True
}
```

##### 失败响应码

| code | 说明                         |
| ---- | ---------------------------- |
| 1    | 用户未登录                   |
| 2    | 目标群聊不存在               |
| 3    | 尝试邀请的用户不存在         |
| 4    | 尝试邀请的用户已经在群聊中了 |
| 5    | 权限不足                     |

## 群成员邀请用户进入群聊

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/invite_member_to_group/</span>
</div>

##### 功能说明

群成员邀请好友进入群聊，需要群主/管理员审核

##### 参数

| 参数名  | 类型 | 说明             |
| ------- | ---- | ---------------- |
| group   | int  | 群聊id           |
| invitee | list | 被邀请者的id列表 |

##### 成功请求返回体

```json
{
  "Invited": True
}
```

##### 失败响应码

| code | 说明                         |
| ---- | ---------------------------- |
| 1    | 用户未登录                   |
| 2    | 目标群聊不存在               |
| 3    | 尝试邀请的用户不存在         |
| 4    | 尝试邀请的用户已经在群聊中了 |

## 获取入群邀请

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_group_invitations/</span>
</div>

##### 功能说明

管理员/群主查看所有邀请入群的请求

##### 参数

| 参数名 | 类型 | 说明   |
| ------ | ---- | ------ |
| group  | int  | 群聊id |

##### 成功请求返回体

```json
{
  "invitations": [
    {
      "invitation_id": 邀请体id,
      "inviter_id": 邀请者id,
      "inviter_name": 邀请者用户名,
      "inviter_avatar": 邀请者头像,
      "invitee_id": 被邀请者id,
      "invitee_name": 被邀请者用户名,
      "invitee_avatar": 被邀请者头像
    }
  ]
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标群聊不存在 |

## 管理员/群主回应进群邀请

!!! note "需要登陆"

!!! warning "需要权限: 管理员及以上"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/respond_group_invitation/</span>
</div>

##### 功能说明

管理员/群主回应邀请进群的请求

##### 参数

| 参数名     | 类型 | 说明                     |
| ---------- | ---- | ------------------------ |
| group      | int  | 群聊id                   |
| invitation | int  | 邀请体id                 |
| response   | str  | 只能为"accept"或"reject" |

##### 成功请求返回体

```json
{
  "Responded": True
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标群聊不存在 |
| 3    | 权限不足       |
| 4    | 邀请体不存在   |

## 群主解散群聊

!!! note "需要登陆"

!!! warning "需要权限: 群主"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/dismiss_group_conversation/</span>
</div>

##### 功能说明

群主解散群聊

##### 参数

| 参数名 | 类型 | 说明   |
| ------ | ---- | ------ |
| group  | int  | 群聊id |

##### 成功请求返回体

```json
{
  "Dismissed": True
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标群聊不存在 |
| 3    | 权限不足       |

## 用户退出群聊

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/leave_group_conversation/</span>
</div>

##### 功能说明

用户退出群聊

!!! Note "群主不可以退出群聊，只可以先转让，再退群"

##### 参数

| 参数名 | 类型 | 说明   |
| ------ | ---- | ------ |
| group  | int  | 群聊id |

##### 成功请求返回体

```json
{
  "Left": True
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标群聊不存在 |
| 3    | 用户不在群聊中 |
| 4    | 用户是该群群主 |

## 管理员/群主移除群聊

!!! note "需要登陆"

!!! warning "需要权限: 群主可以移除管理员，管理员只能移除普通成员"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/remove_member_from_group/</span>
</div>

##### 功能说明

群主/管理员移除权限比自己低的群成员

##### 参数

| 参数名  | 类型 | 说明               |
| ------- | ---- | ------------------ |
| group   | int  | 群聊id             |
| members | list | 被移除成员的id列表 |

##### 成功请求返回体

```json
{
  "Removed": True
}
```

##### 失败响应码

| code | 说明                     |
| ---- | ------------------------ |
| 1    | 用户未登录               |
| 2    | 目标群聊不存在           |
| 3    | 权限不足                 |
| 4    | 尝试移除的用户不在群聊中 |
| 5    | 尝试移除的用户不存在     |

## 转让群主

!!! note "需要登陆"

!!! warning "需要权限: 群主"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/transfer_owner/</span>
</div>

##### 功能说明

转让群主

##### 参数

| 参数名 | 类型 | 说明     |
| ------ | ---- | -------- |
| group  | int  | 群聊id   |
| owner  | int  | 新群主id |

##### 成功请求返回体

```json
{
  "transfered": True
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标群聊不存在 |
| 3    | 权限不足       |

## 增加群聊管理员

!!! note "需要登陆"

!!! warning "需要权限: 群主"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/add_administrators/</span>
</div>

##### 功能说明

增加群聊管理员

##### 参数

| 参数名 | 类型 | 说明               |
| ------ | ---- | ------------------ |
| group  | int  | 群聊id             |
| admins | list | 新管理员用户id列表 |

##### 成功请求返回体

```json
{
  "Added": True
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标群聊不存在 |
| 3    | 权限不足       |

## 移除管理员

!!! note "需要登陆"

!!! warning "需要权限: 群主"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/remove_administrator/</span>
</div>

##### 功能说明

管理员/群主邀请用户直接进入群聊

##### 参数

| 参数名 | 类型 | 说明               |
| ------ | ---- | ------------------ |
| group  | int  | 群聊id             |
| admin  | list | 移除的管理员id列表 |

##### 成功请求返回体

```json
{
  "Removed": True
}
```

##### 失败响应码

| code | 说明                     |
| ---- | ------------------------ |
| 1    | 用户未登录               |
| 2    | 目标群聊不存在           |
| 3    | 权限不足                 |
| 4    | 目标删除的管理员不存在   |
| 5    | 目标删除的用户不是管理员 |

## 设置群公告

!!! note "需要登陆"

!!! warning "需要权限: 管理员及以上"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/set_group_announcement/</span>
</div>

##### 功能说明

管理员/群主设置群公告

##### 参数

| 参数名       | 类型 | 说明       |
| ------------ | ---- | ---------- |
| group        | int  | 群聊id     |
| announcement | str  | 群公告内容 |

##### 成功请求返回体

```json
{
  "Set": True
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标群聊不存在 |
| 3    | 权限不足       |

## 获取群公告

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_group_announcement/</span>
</div>

##### 功能说明

获取当前群公告

##### 参数

| 参数名 | 类型 | 说明   |
| ------ | ---- | ------ |
| group  | int  | 群聊id |

##### 成功请求返回体

```json
{
  "Announcement": 全体目光向我看齐，群主是个伞兵 /* 群公告 */
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标群聊不存在 |
| 3    | 用户不在群聊中 |

## 获取群主

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_group_owner/</span>
</div>

##### 功能说明

获取群主的信息

##### 参数

| 参数名 | 类型 | 说明   |
| ------ | ---- | ------ |
| group  | int  | 群聊id |

##### 成功请求返回体

```json
{
  "owner": {
    "user_id": id,
    "name": 用户名,
    "avatar": 头像
  }
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标群聊不存在 |
| 3    | 用户不在群聊中 |

## 获取管理员

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_group_administrators/</span>
</div>

##### 功能说明

获取群聊的管理员

##### 参数

| 参数名 | 类型 | 说明   |
| ------ | ---- | ------ |
| group  | int  | 群聊id |

##### 成功请求返回体

```json
{
  "administrators": [
    {
      "user_id": id,
      "name": 用户名,
      "avatar": 头像
    },
    ...
  ]
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标群聊不存在 |
| 3    | 用户不在群聊中 |

## 获取群成员

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_group_administrators/</span>
</div>

##### 功能说明

获取群聊除了群主与管理员以外的成员

##### 参数

| 参数名 | 类型 | 说明   |
| ------ | ---- | ------ |
| group  | int  | 群聊id |

##### 成功请求返回体

```json
{
  "members": [
    {
      "user_id": id,
      "name": 用户名,
      "avatar": 头像
    },
    ...
  ]
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标群聊不存在 |
| 3    | 用户不在群聊中 |

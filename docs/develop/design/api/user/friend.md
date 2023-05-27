# 好友相关

## 获取所有好友请求

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_friend_requests/</span>
</div>

##### 功能说明

用户获取收到的所有好友请求

##### 参数

除了token以外不需要其他参数。

##### 成功请求返回体

```json
{
  "requests": [
    {
      "user_id": 对方的id,
      "name": 对方的用户名,
      "avatar": 对方的头像
    },
    ...
  ]
}
```

##### 失败响应码

| code | 说明       |
| ---- | ---------- |
| 1    | 用户未登录 |

## 发送好友请求

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/send_friend_request/</span>
</div>

##### 功能说明

向他人发送好友请求

##### 参数

| 参数名         | 类型 | 说明         |
| -------------- | ---- | ------------ |
| friend_user_id | int  | 目标对象的id |

##### 成功请求返回体

- 成功发送请求

```json
{
  "Send request": True
}
```

- 在对方已经给用户发送过请求的情况下，这时再发送请求的结果是二人直接成为好友

```json
{
  "Become Friends successfully": True
}
```

##### 失败响应码

| code | 说明             |
| ---- | ---------------- |
| 1    | 用户未登录       |
| 2    | 目标用户不存在   |
| 3    | 二人已经是好友了 |
| 4    | 请求已经存在     |
| 5    | 目标用户已经注销 |

## 回应好友请求

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/respond_friend_request/</span>
</div>

##### 功能说明

回应他人的好友请求

##### 参数

| 参数名         | 类型 | 说明                     |
| -------------- | ---- | ------------------------ |
| friend_user_id | int  | 目标对象的id             |
| response       | str  | 只能为"accept"或"reject" |

##### 成功请求返回体

- 成功同意

```json
{
  "Become Friends": True
}
```

- 成功拒绝

```json
{
  "Become Friends": False
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 目标用户不存在 |

## 删除好友

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/del_friend/</span>
</div>

##### 功能说明

删除好友

##### 参数

| 参数名         | 类型 | 说明         |
| -------------- | ---- | ------------ |
| friend_user_id | int  | 目标对象的id |

##### 成功请求返回体

```json
{
  "Deleted": True
}
```

##### 失败响应码

| code | 说明             |
| ---- | ---------------- |
| 1    | 用户未登录       |
| 2    | 目标用户不存在   |
| 3    | 对方并非你的好友 |

## 获取好友列表

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_friends/</span>
</div>

##### 功能说明

获取一个用户所有的好友

##### 参数

除了token以外不需要别的参数

##### 成功请求返回体

```json
{
    "friends": [
        {
            "user_id": 7,
            "name": "dwn",
            "avatar": "https://killthisse-avatar.oss-cn-beijing.aliyuncs.com/1684979879401%E6%B0%B4%E8%93%9D%E8%93%9D.png"
        },
	...
    ]
}
```

##### 失败响应码

| code | 说明       |
| ---- | ---------- |
| 1    | 用户未登录 |

## 根据id搜索用户

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/search_by_id/</span>
</div>

##### 功能说明

根据对方的id查询用户

##### 参数

| 参数名    | 类型 | 说明         |
| --------- | ---- | ------------ |
| friend_id | int  | 目标用户的id |

##### 成功请求返回体

```json
{
  "user_id": 对方的id,
  "name": 对方的用户名,
  "avatar": 对方的头像
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 查找目标不存在 |

## 根据用户名搜索用户

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/search_by_name/</span>
</div>

##### 功能说明

根据对方的用户名查询用户

##### 参数

| 参数名      | 类型 | 说明             |
| ----------- | ---- | ---------------- |
| friend_name | str  | 目标用户的用户名 |

##### 成功请求返回体

```json
{
  "user_id": 对方的id,
  "name": 对方的用户名,
  "avatar": 对方的头像
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 查找目标不存在 |

## 创建分组

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/create_group/</span>
</div>

##### 功能说明

创建好友分组

##### 参数

| 参数名 | 类型 | 说明     |
| ------ | ---- | -------- |
| name   | str  | 分组名称 |

##### 成功请求返回体

```json
{
  "group_id": 分组的id
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户未登录     |
| 2    | 查找目标不存在 |

## 删除分组

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/del_group/</span>
</div>

##### 功能说明

删除好友分组

##### 参数

| 参数名 | 类型 | 说明     |
| ------ | ---- | -------- |
| name   | str  | 分组名称 |

##### 成功请求返回体

```json
{
  "Deleted": True
}
```

##### 失败响应码

| code | 说明                     |
| ---- | ------------------------ |
| 1    | 用户未登录               |
| 2    | 分组不存在               |
| 3    | 当前用户并非分组的管理者 |

## 获取分组

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_group/</span>
</div>

##### 功能说明

用户获取自己的所有分组

##### 参数

除了token以外不需要别的参数。

##### 成功请求返回体

```json
{
  "groups": [
    {
      "group_id": 分组id,
      "group_name": 分组名称,
      "admin_id": 拥有者id
    }
  ]
}
```

##### 失败响应码

| code | 说明       |
| ---- | ---------- |
| 1    | 用户未登录 |

## 获取组内好友

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/get_group_friends/</span>
</div>

##### 功能说明

获取某一分组内的所有好友

##### 参数

| 参数名   | 类型 | 说明   |
| -------- | ---- | ------ |
| group_id | int  | 分组id |

##### 成功请求返回体

```json
{
  "friends": [
    {
      "user_id": 用户id,
      "name": 好友的用户名,
      "avatar": 好友的头像
    },
    ...
  ]
}
```

##### 失败响应码

| code | 说明                   |
| ---- | ---------------------- |
| 1    | 用户未登录             |
| 2    | 分组不存在             |
| 3    | 用户并非是分组的所有者 |

## 将好友添加到分组

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/add_friend_to_group/</span>
</div>

##### 功能说明

将好友添加到某一指定的分组

##### 参数

| 参数名    | 类型 | 说明   |
| --------- | ---- | ------ |
| group_id  | int  | 分组id |
| friend_id | int  | 好友id |

##### 成功请求返回体

```json
{
  "Added": True
}
```

##### 失败响应码

| code | 说明                     |
| ---- | ------------------------ |
| 1    | 用户未登录               |
| 2    | 分组不存在               |
| 3    | 用户不是当前分组的所有者 |
| 4    | 用户与对方并非是好友     |
| 5    | 对方已经在该分组内       |

## 将好友从分组中删除

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/del_friend_from_group/</span>
</div>

##### 功能说明

创建好友分组

##### 参数

| 参数名    | 类型 | 说明   |
| --------- | ---- | ------ |
| group_id  | int  | 分组id |
| friend_id | int  | 好友id |

##### 成功请求返回体

```json
{
  "Deleted": True
}
```

##### 失败响应码

| code | 说明                     |
| ---- | ------------------------ |
| 1    | 用户未登录               |
| 2    | 分组不存在               |
| 3    | 用户不是当前分组的所有者 |
| 4    | 用户和对方不是好友       |
| 5    | 对方不在该分组内         |

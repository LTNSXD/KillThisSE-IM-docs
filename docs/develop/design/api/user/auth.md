# 账号相关

## 用户注册

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/register_without_email/</span>
</div>

##### 功能说明

用户注册新的KillThisSE IM账号

##### 参数

| 参数名   | 类型 | 说明                                                                   |
| -------- | ---- | ---------------------------------------------------------------------- |
| name     | str  | 只能由英文字母、阿拉伯数字与下划线构成，长度3-16，且不能与其他用户重复 |
| password | str  | 只能由英文字母、阿拉伯数字与下划线构成，长度6-16                       |

!!! Note "密码安全"
    在后端接收到密码以后，会先通过哈希算法加密，再储存进数据库。登陆时比较密码也是如此。

##### 成功请求返回体

```json
{
  "created": True
}
```

##### 失败响应码

| code | 说明           |
| ---- | -------------- |
| 1    | 用户名不合法   |
| 2    | 用户名已经存在 |
| 3    | 密码不合法     |

## 用户登录

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/login/</span>
</div>

##### 功能说明

用户登录已有的账号

##### 参数

| 参数名   | 类型 | 说明   |
| -------- | ---- | ------ |
| name     | str  | 用户名 |
| password | str  | 密码   |

##### 成功请求返回体

```json
{
  "Logged in": True,
  "Token": token
}
```

!!! note "Token"

    前端收到Token以后会将其保存起来，这是后端判断用户是否登陆的依据。

##### 失败响应码

| code | 说明                 |
| ---- | -------------------- |
| 1    | 用户名不合法         |
| 2    | 用户不存在或已被注销 |
| 3    | 用户名与密码不匹配   |

## 用户注销

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/cancel_account/</span>
</div>
##### 功能说明

用户注销

##### 参数

| 参数名 | 类型 | 说明        |
| ------ | ---- | ----------- |
| Token  | str  | 登陆的Token |

##### 成功请求返回体

```json
{
  "Deleted": True
}
```

##### 失败响应码

| code | 说明       |
| ---- | ---------- |
| 1    | 用户未登陆 |

## 用户登出

!!! note "需要登陆"

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/logout/</span>
</div>

##### 功能说明

用户登出当前账号

##### 参数

| 参数名 | 类型 | 说明        |
| ------ | ---- | ----------- |
| Token  | str  | 登陆的Token |

##### 成功请求返回体

```json
{
  "Logged out": True
}
```

##### 失败响应码

| code | 说明       |
| ---- | ---------- |
| 1    | 用户未登陆 |

## 发送邮件以登陆

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/send_email_for_login/</span>
</div>

##### 功能说明

用户选择用邮箱登录时，发送邮件的API

##### 参数

| 参数名 | 类型 | 说明       |
| ------ | ---- | ---------- |
| email  | str  | 用户的邮箱 |

##### 成功请求返回体

```json
{
  "send": True,
  "code_send": code
}
```

!!! Note "返回体说明"

    code_send指发送到用户邮箱的验证码

##### 失败响应码

| code | 说明                   |
| ---- | ---------------------- |
| 2    | 该邮箱并未绑定任何用户 |

## 以邮箱登录

##### 接口

<div class="grid cards" markdown>
<span>**[ POST ]**    /user/send_email_for_login/</span>
</div>

##### 功能说明

用户利用邮箱的验证码来登录

##### 参数

| 参数名     | 类型 | 说明       |
| ---------- | ---- | ---------- |
| email      | str  | 用户的邮箱 |
| code_input | int  | 验证码     |

##### 成功请求返回体

```json
{
  "Logged in": True,
  "Token": token
}
```

##### 失败响应码

| code | 说明         |
| ---- | ------------ |
| 2    | 用户不存在   |
| 5    | 验证码错误   |
| 6    | 验证码已过期 |
